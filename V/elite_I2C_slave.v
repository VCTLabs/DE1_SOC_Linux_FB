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
//*****					X2 - 23 Jan 2017, TC - Added 3 byte format requirement: Addr | Register | Data and hard code address to b'0001010
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
	I2C_Adr,
	I2C_Reg_Cmnd,
	Data_Ready_Flag,
	
	incycle,
	bitcnt,
	Data_Phase,
	Reg_Phase,
	Adr_Phase,
	got_ACK,
	op_read,
	SDA_OE,
	adr_match,
	bit_ACK,
	SDA_assert_high_r
	
	);

input MClk;
input I2C_Rst_Flag;
input I2C_SCL;
inout I2C_SDA;
output I2C_SCL_DUP;
output I2C_SDA_DUP;
output [7:0] IOout; 
output [7:0] IOin;   
output [6:0] I2C_Adr;
output [7:0] I2C_Reg_Cmnd;
output Data_Ready_Flag;


output 	incycle;
output [3:0]	bitcnt;
output 	Data_Phase;
output 	Reg_Phase;
output 	Adr_Phase;
output 	got_ACK;
output 	op_read;
output 	SDA_OE;
output 	adr_match;
output	bit_ACK;
output	SDA_assert_high_r;

//***** External Net Definitions *********************************************************************
// We use two wires with a combinatorial loop to detect the start and stop conditions
//  ... making sure these two wires don't get optimized away
wire 	SDA_shadow    /* synthesis keep = 1 */;
wire 	start_or_stop /* synthesis keep = 1 */;
reg 	incycle;			// active High ( 1 = transmitting in process, 0 = Ignore SDA line)

wire I2C_SCL_DUP;
wire I2C_SDA_DUP;
reg SCL_Wrap;
reg SDA_Wrap;

//***** Internal Net Definitions ***************************************************************************************
reg [3:0] 	bitcnt;  					// counts the I2C bits from 7 down to 0, plus an ACK bit
wire 			bit_DATA = ~bitcnt[3];  // the DATA bits are the first 8 bits sent - Stays True for the first 0-7 counts.
wire 			bit_ACK = bitcnt[3];  	// the ACK bit is the 9th bit sent - becomes True only on the 8th count.
reg 			Data_Phase;
reg			Reg_Phase;
wire			Adr_Phase;

//***** Read the Address and check if it's for us
reg adr_match; 
reg op_read; 
reg got_ACK;
reg SDAr;  
reg [7:0] Mem_Byte;
reg [6:0] I2C_Adr;						// Max number of addresses is 127 (7'h7F)
reg [7:0] I2C_Reg_Cmnd;					// Max number of registers is 0-5
wire op_write = ~op_read;

//***** Wrap around pins for monitoring on the Analyzer
assign I2C_SCL_DUP = SCL_Wrap;
assign I2C_SDA_DUP = SDA_Wrap;
// Wrap SDA & SCL pins out to Duplicate header pins
always @(posedge MClk) 
	begin
	SDA_Wrap <= I2C_SDA;
	SCL_Wrap <= I2C_SCL;				// use intermediate registers due to bidirectional nature of GPIO & I2C lines
	end

// Detect Start Condition: While SCL=1, SDA=Falling Edge
// Detect Stop Condition: While SCL=1, SDA=Rising Edge
assign SDA_shadow = (~I2C_SCL | start_or_stop) ? I2C_SDA : SDA_shadow;
assign start_or_stop = ~I2C_SCL ? 1'b0 : (I2C_SDA ^ SDA_shadow);

// Create the boundaries for the 3 byte format: Adr | Register | Data
assign Adr_Phase = ~Data_Phase & ~Reg_Phase;

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
		Reg_Phase <= 0;
		Data_Phase <= 0;
		end
	else
		begin
		if(bit_ACK)
			begin
			bitcnt <= 4'h7;
			if ( ~Data_Phase ) Reg_Phase <= 1;
			if ( Reg_Phase ) 
				begin
				Reg_Phase <= 0;
				Data_Phase <= 1;
				end
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
		if (Adr_Phase & bitcnt==0 & I2C_Adr != 7'b0001010) adr_match <= 0;			// Set address to 10 (0x0A)
		if (Adr_Phase & bitcnt==7 ) I2C_Adr[6] <= SDAr;
		if (Adr_Phase & bitcnt==6 ) I2C_Adr[5] <= SDAr;
		if (Adr_Phase & bitcnt==5 ) I2C_Adr[4] <= SDAr;
		if (Adr_Phase & bitcnt==4 ) I2C_Adr[3] <= SDAr;
		if (Adr_Phase & bitcnt==3 ) I2C_Adr[2] <= SDAr;
		if (Adr_Phase & bitcnt==2 ) I2C_Adr[1] <= SDAr;
		if (Adr_Phase & bitcnt==1 ) I2C_Adr[0] <= SDAr;
		if (Adr_Phase & bitcnt==0 ) op_read <= SDAr;
		// we monitor the ACK to be able to free the bus when the master doesn't ACK during a read operation
		if(bit_ACK) got_ACK <= ~SDAr;
		if(adr_match & bit_DATA & Reg_Phase & op_write ) I2C_Reg_Cmnd[bitcnt] <= SDAr;  // memory write
		if(adr_match & bit_DATA & Data_Phase & op_write ) Mem_Byte[bitcnt] <= SDAr;  // memory write
		end
	end

//***** Drive the SDA line as Data, Ack, or High Z (tristated)
//wire 	mem_bit_low = ~Mem_Byte[bitcnt[2:0]];
wire 	SDA_assert_high = adr_match & Data_Phase & op_read & IOin[bitcnt[2:0]];
wire 	SDA_assert_low  = adr_match & bit_DATA & Data_Phase & op_read & ~(IOin[bitcnt[2:0]]) & got_ACK;
wire 	SDA_assert_high_r = adr_match & Reg_Phase & op_read & I2C_Reg_Cmnd[bitcnt[2:0]];
wire 	SDA_assert_low_r  = adr_match & bit_DATA & Reg_Phase & op_read & ~(I2C_Reg_Cmnd[bitcnt[2:0]]) & got_ACK;
wire 	SDA_assert_ACK = adr_match & bit_ACK & (Adr_Phase | op_write);
wire 	SDA_OE = SDA_assert_low | SDA_assert_high | SDA_assert_low_r | SDA_assert_high_r | SDA_assert_ACK;
wire 	SDA_Outr = SDA_assert_low | SDA_assert_low_r | SDA_assert_ACK ? 1'b0 : 1'b1;

//***** Detect write condition is finished 
assign Data_Ready_Flag = bitcnt[3] & Data_Phase & adr_match;

assign I2C_SDA = SDA_OE ? SDA_Outr : 1'bz;

assign IOout = Mem_Byte;

//***** Internal Control Register Definitions ***************************************************************************************
wire			Data_Ready_Flag;
reg [7:0]   I2C_Registers[7:0] 	/* synthesis ramstyle = "no_rw_check" */;
reg [7:0]	IOin;         					// holds the outgoing bytes to write to the SDA line
wire        I2C_WR_Full_Flag;   			// wait to write if the full flag is set to True


always @( negedge I2C_SCL or negedge incycle )
   begin
	
   if( ~incycle )								// Load POR values
      begin
      IOin <= 8'h00;
      I2C_Registers[1] <= 8'h03;			// Load HDL Version Major/Minor
      I2C_Registers[3] <= 8'h00;			// Load HDL Status (reset status?)
      end
   else
	
      begin
//***** If a Rcv I2C byte is ready to be written into the Buffer...
      if ( op_read )
         begin
			if ( bit_ACK )
				begin
//***** Determine which register to read from the first I2C byte.
				case ( I2C_Reg_Cmnd )
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
			case ( I2C_Reg_Cmnd )
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
//****** End I2C slave Block
//**************************************************************************************************



endmodule

