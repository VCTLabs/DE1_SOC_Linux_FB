//**************************************************************************************************
//***** Module Name: Elite_SPI_Slave
//***** Description: General Purpose I2C Slave
//*****              Assumes MClk is 50MHz
//*****              Uses only 2 wires named "SDA" and "SCL" in addition to power and ground
//*****					Can support over 100 devices on the same bus using single byte addressing
//*****					Multi-master support (for example, two CPUs can share the same I2C devices)
//*****					Industry Sandard developed by Philips.
//*****						Cons: Relatively Slow. (100Kbps base speed w/extensions up to 3.4Mbps)
//***** 
//***** Useage:		Line HighZ - Start bit | Address byte | R/W bit | Ack bit | Data byte | Ack bit | Stop bit - Line HighZ
//***** Quote:			"The true delight is in the finding out rather than the knowing." - Isaac Asimov
//***** 
//***** Elite Engineering Corporation
//***** PROPRIETARY
//***** Created:  09 Jan 2017, TC
//***** Revision Log: X1 - Using Example from Altera OpenCores.com fpga4fun.com, KNJN LLC
//***** 
//**************************************************************************************************




//**************************************************************************************************
//***** Declare Top Module Inputs/Outputs/Bidir
module Elite_I2C_Slave
	(
	MClk,
	I2C_Rst_Flag,
	I2C_SCL, 
	I2C_SDA, 
	I2C_SCL_DUP,
	I2C_SDA_DUP,
	IOout,
	IOin,
	I2C_ADR,
	Data_Ready_Flag
	);

input MClk;
input I2C_Rst_Flag;
input I2C_SCL;
inout I2C_SDA;
output I2C_SCL_DUP;
output I2C_SDA_DUP;
output [7:0] IOout; 
output [7:0] IOin;   
output [6:0] I2C_ADR;
output Data_Ready_Flag;


//***** External Net Definitions *********************************************************************
// We use two wires with a combinatorial loop to detect the start and stop conditions
//  ... making sure these two wires don't get optimized away
wire 	SDA_shadow    /* synthesis keep = 1 */;
wire 	start_or_stop /* synthesis keep = 1 */;
reg 	incycle;			// active High ( 1 = transmitting in process, 0 = Ignore SDA line)

wire I2C_SCL_DUP;
wire I2C_SDA_DUP;
reg SCLr;

//***** Internal Net Definitions ***************************************************************************************
reg [3:0] 	bitcnt;  					// counts the I2C bits from 7 down to 0, plus an ACK bit
wire 			bit_DATA = ~bitcnt[3];  // the DATA bits are the first 8 bits sent - Stays True for the first 0-7 counts.
wire 			bit_ACK = bitcnt[3];  	// the ACK bit is the 9th bit sent - becomes True only on the 8th count.
reg 			data_phase;

//***** wrap around pins for monitoring on the Analyzer
assign I2C_SCL_DUP = SCLr;
assign I2C_SDA_DUP = SDAr;

//***** Read the Address and check if it's for us
wire adr_phase = ~data_phase;
reg adr_match, op_read, got_ACK;
reg SDAr;  
reg [7:0] mem;
reg [6:0] I2C_ADR;						// Max number of registers is 127 (7'h7F)
wire op_write = ~op_read;

// Detect Start Condition: While SCL=1, SDA=Falling Edge
// Detect Stop Condition: While SCL=1, SDA=Rising Edge
assign SDA_shadow = (~I2C_SCL | start_or_stop) ? I2C_SDA : SDA_shadow;
assign start_or_stop = ~I2C_SCL ? 1'b0 : (I2C_SDA ^ SDA_shadow);

//***** Detect write condition is finished 
assign Data_Ready_Flag = bitcnt[3] & data_phase;

//***** Syncronize the clock edges coming in ********************************
always @ (negedge I2C_SCL or posedge start_or_stop)
	begin
	if (start_or_stop) 
		begin
		incycle <= 1'b0;
		end
	else if (~I2C_SDA) // only if the SDA is low during the clock falling edge
		begin
		incycle <= 1'b1;			
		end
	end

//***** Count the bits coming in *********************************************
always @	(negedge I2C_SCL or negedge incycle)
	begin
	if(~incycle)
		begin
		bitcnt <= 4'h7;  // the bit 7 is received first
		data_phase <= 0;
		end
	else
		begin
		if(bit_ACK)
			begin
			bitcnt <= 4'h7;
			data_phase <= 1;
			end
		else
			begin
			bitcnt <= bitcnt - 4'h1;
			end
		end
	end



// sample SDA on posedge since the I2C spec specifies as low as 0µs hold-time on negedge
always @(posedge I2C_SCL) 
	begin
	SDAr <= I2C_SDA;
	SCLr <= I2C_SCL;						// using intermediate register due to bidirectional nature of GPIO
	end
	
// slave writes to SDA on negitive edge of clocks pulses
always @(negedge I2C_SCL or negedge incycle)
	begin
	if(~incycle)
		begin
		got_ACK <= 0;
		adr_match <= 1;
		op_read <= 0;
		end
	else
		begin
		if (adr_phase & bit_ACK & I2C_ADR > 6) adr_match <= 0;
		if (adr_phase & bitcnt==7 ) I2C_ADR[6] <= SDAr;
		if (adr_phase & bitcnt==6 ) I2C_ADR[5] <= SDAr;
		if (adr_phase & bitcnt==5 ) I2C_ADR[4] <= SDAr;
		if (adr_phase & bitcnt==4 ) I2C_ADR[3] <= SDAr;
		if (adr_phase & bitcnt==3 ) I2C_ADR[2] <= SDAr;
		if (adr_phase & bitcnt==2 ) I2C_ADR[1] <= SDAr;
		if (adr_phase & bitcnt==1 ) I2C_ADR[0] <= SDAr;
		if (adr_phase & bitcnt==0 ) op_read <= SDAr;
		// we monitor the ACK to be able to free the bus when the master doesn't ACK during a read operation
		if(bit_ACK) got_ACK <= ~SDAr;
		if(adr_match & bit_DATA & data_phase & op_write) mem[bitcnt] <= SDAr;  // memory write
		end
	end

//***** Drive the SDA line as Data, Ack, or High Z (tristated)
//wire 	mem_bit_low = ~mem[bitcnt[2:0]];
wire 	SDA_assert_high = adr_match & data_phase & op_read & IOin[bitcnt[2:0]];
wire 	SDA_assert_low = adr_match & bit_DATA & data_phase & op_read & ~(IOin[bitcnt[2:0]]) & got_ACK;
wire 	SDA_assert_ACK = adr_match & bit_ACK & (adr_phase | op_write);
wire 	SDA_OE = SDA_assert_low | SDA_assert_ACK | SDA_assert_high;
wire 	SDA_Outr = SDA_assert_low | SDA_assert_ACK ? 1'b0 : 1'b1;

assign I2C_SDA = SDA_OE ? SDA_Outr : 1'bz;

assign IOout = mem;


//***** Internal Control Register Definitions ***************************************************************************************
wire			Data_Ready_Flag;
reg [7:0]   I2C_Registers[7:0] 	/* synthesis ramstyle = "no_rw_check" */;
reg [7:0]	IOin;         				// holds the outgoing bytes to write to the SDA line
wire        I2C_WR_Full_Flag;   		// wait to write if the full flag is set to True


always @( negedge I2C_SCL or negedge incycle )
   begin
	
   if( ~incycle )								// Load POR values
      begin
      IOin <= 8'h00;
      //I2C_Registers[0] <= 8'h01;
      I2C_Registers[1] <= 8'h01;		// Load HDL Version Major/Minor
      //I2C_Registers[2] <= 8'h00;
      I2C_Registers[3] <= 8'h00;		// Load HDL Status (reset status?)
      //I2C_Registers[4] <= 8'h00;
      //I2C_Registers[5] <= 8'h00;
      end
   else
	
      begin
//***** If a Rcv I2C byte is ready to be written into the Buffer...
      if ( op_read )
         begin
			if ( bit_ACK )
				begin
//***** Determine which register to read from the first I2C byte.
				case ( I2C_ADR )
					7'b0000000: IOin <= I2C_Registers[0];			// Reg0 - API Version major/minor
					7'b0000001: IOin <= I2C_Registers[1];			// Reg1 - HDL Version major
					7'b0000010: IOin <= I2C_Registers[2];			// Reg2 - Command Word 0-255
					7'b0000011: IOin <= I2C_Registers[3];			// Reg3 - HDL Status 0-255
					7'b0000100: IOin <= I2C_Registers[4];			// Reg4 - Data Length
					7'b0000101: IOin <= I2C_Registers[5];			// Reg5 - Active Clip No#
					default: IOin <= 8'h00;
					endcase
				end
			end	
//***** If a Rcv I2C byte is ready to be written into the Buffer...
      else if ( Data_Ready_Flag & op_write )
         begin
//***** Determine which register to write to by the first I2C byte.
			case ( I2C_ADR )
				7'b0000000: I2C_Registers[0] <= IOout;		// Reg0 - API Version major/minor
				7'b0000010: I2C_Registers[2] <= IOout;		// Reg2 - Command Word 0-255
				7'b0000100: I2C_Registers[4] <= IOout;		// Reg4 - Data Length
				7'b0000101: I2C_Registers[5] <= IOout;		// Reg5 - Active Clip No#
				default: IOin <= 8'h00;						// if it's any other register, throw away the data
				endcase
			end
		end	
	end



































//**************************************************************************************************
//****** End FIFO Manager Block
//**************************************************************************************************



endmodule

