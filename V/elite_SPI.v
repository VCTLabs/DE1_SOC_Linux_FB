//**************************************************************************************************
//***** Module Name: Elite_SPI_Slave
//***** Description: General Purpose SPI IO
//*****              Assumes MClk is 50MHz
//*****              Set SPI Clk to no greater than 1/3 master clock
//***** 
//***** 
//***** Elite Engineering Corporation
//***** PROPRIETARY
//***** Created:  20 Dec 2016, TC
//***** Revision Log: X1
//***** 
//**************************************************************************************************




//**************************************************************************************************

//***** Declare Top Module Inputs/Outputs/Bidir
module Elite_SPI_Slave
   (
   input          MClk, 									// master clock 20ns (50MHz)
   input          USPI_Rst_Flag,        	        	// master signal for POR    
   input          USPI_SCLK, 								// has to be slower than MClk. Provided by PC	
   input          USPI_CSEL, 								// Active low, controlled by PC, not us, so monitor closely
   input          USPI_MOSI, 								// The output from the HPS to the FPGA
   output         USPI_MISO, 								// The output from the FPGA to the HPS
   output  [7:0]  USPI_Rcvr,                       // The incoming SPI line as we get a byte (might need a flag w/this) 
   output  [7:0]  USPI_Txmr,                       // The outgoing SPI line as we clock out a byte (might need a flag w/this, too)
	output 			USPI_MOSI_DUP,									// wrap around outputs for monitoring on the logic analyzer              
	output			USPI_MISO_DUP,									// wrap around outputs for monitoring on the logic analyzer           
	output			USPI_SCLK_DUP,                         // wrap around outputs for monitoring on the logic analyzer  
	output 			USPI_CSEL_DUP                  			// wrap around outputs for monitoring on the logic analyzer                
	);
   

//***** External Net Definitions *********************************************************************
assign USPI_MISO = Byte_data_sent[7];  // send MSB first to the MISO pin
assign USPI_Rcvr = Rcv_Data;
assign USPI_Txmr = FIFO_Dequeue_Byte;

//**** Wrap outputs around to header 2
assign USPI_MOSI_DUP = MOSIr[1];					// use second register bit for alignment w/other bidir input signals
assign USPI_MISO_DUP = Byte_data_sent[7];		// use same register output bit as the MISO pin.
assign USPI_SCLK_DUP = SCLKr[1];					// use second register bit for alignment w/other bidir input signals
assign USPI_CSEL_DUP = CSELr[1];					// use second register bit for alignment w/other bidir input signals


//***** Internal Net Definitions ***************************************************************************************
reg [7:0] Rcv_Data = 0;        	               
//reg [1:0] LEDr;               
reg [2:0] SCLKr;  
reg [2:0] CSELr;  
reg [1:0] MOSIr;  


reg [7:0] Byte_data_sent;
reg [7:0] Byte_Count;

// we handle SPI in 8-bits format, so we need a 3 bit counter to count the bits as they come in
reg [2:0] Bit_Counter = 0;
reg Byte_Rcvd_Flag = 0;                   // high when a byte has been received
reg [7:0] Cmnd_Byte = 0;                  // write the first incoming SPI byte into this register


wire SCLK_risingedge = (SCLKr[2:1] == 2'b01);  	// now we can detect USPI_SCLK rising edges
wire SCLK_fallingedge = (SCLKr[2:1] == 2'b10);  // and falling edges

wire CSEL_active = ~CSELr[1];  						// USPI_CSEL is active low
wire CSEL_startmessage = (CSELr[2:1]==2'b10);  	// message starts at falling edge
wire CSEL_endmessage = (CSELr[2:1]==2'b01);  	// message stops at rising edge
wire MOSI_data = MOSIr[1];

// sync USPI_SCLK to the FPGA clock using a 3-bits shift left register
always @(posedge MClk) SCLKr <= {SCLKr[1:0], USPI_SCLK};

// sync USPI_CSEL to the FPGA clock using a 3 bit register
always @(posedge MClk) CSELr <= {CSELr[1:0], USPI_CSEL};

// and for USPI_MOSI shift in using MSB first
always @(posedge MClk) MOSIr <= {MOSIr[0], USPI_MOSI};

// for each bit rcv'd, update the MOSI data byte and the bit counter.
always @( posedge MClk )
   begin
   if( ~CSEL_active )
      begin
      Bit_Counter <= 3'b000;
		Rcv_Data <= 8'h0;
      end
   else if ( SCLK_risingedge )
      begin
      Bit_Counter <= Bit_Counter + 3'b001;		// 111 + 001 rolls over to 000 when full.
      Rcv_Data <= {Rcv_Data[6:0], MOSI_data};   // implement a shift-left register << (since we receive the data MSB first)
      end
   end

always @( posedge MClk ) 
   begin
   Byte_Rcvd_Flag <= CSEL_active && SCLK_risingedge && (Bit_Counter == 3'b111);
   end
   

always @( posedge MClk ) if ( CSEL_startmessage ) Byte_Count <= Byte_Count + 8'h1;  // count the messages

// write to the outgoing data byte that goes to the MISO line
always @( posedge MClk )
   begin
   if(CSEL_active)
      begin
      if( CSEL_startmessage )			// use the startmsg pulse as a "do once" flag
			begin
         Byte_data_sent <= 0;  		// first byte sent in a message is going to be a dummy byte
			end
		else if (( SCLK_fallingedge ) && (Bit_Counter != 3'b000))
			begin
			//if ( Bit_Counter == 3'b000 ) // && ( FIFO_Empty_Flag ) ) 
				//Byte_data_sent <= 8'h00;  // after that, if they send more clocks, we send 0s
			//else
				Byte_data_sent <= {Byte_data_sent[6:0], 1'b0};		// (shift left)
			end
		else if ( Byte_Rcvd_Flag ) 				// after we've rcv'd the complete byte we can transfer it to the outgoing variable.
			begin
			Byte_data_sent <= Rcv_Data;			// Future: Byte_data_sent <= FIFO_Dequeue_Byte;
			end
      end
	else
		Byte_data_sent <= 0;							// clear the output line to zero.
   end
   
   
// we assume that there is only one slave on the SPI bus
// so we don't bother with a tri-state buffer for MISO
// otherwise we would need to tri-state MISO when CSEL is inactive

//*************** Module Name and Argument Declaration ********************************************
parameter FIFO_DEPTH = 256;
parameter DATA_BITS = 8;

//***** Module I/O Declarations ********************************************************************
reg          	Flush_Rx_Fifo = 0;          	// Input new

//***** External Net Definitions *********************************************************************
reg  [7:0]     FIFO_Dequeue_Byte;         	// output pulls a byte off the FIFO
reg            FIFO_Dequeue_Byte_Ready_Flag;	// Output
reg            FIFO_Empty_Flag;     			// Output
wire           FIFO_Dequeue_Strobe = 0;      // Input

//***** Internal Net Definitions ***************************************************************************************
reg [7:0]      FIFO[FIFO_DEPTH-1:0] /* synthesis ramstyle = "no_rw_check" */;    // compiler directive, stop trying to correct the spelling Terra.
reg [7:0]      FIFO_WR_Head_Index = 0;			// points to the next location to write to 
reg [7:0]      FIFO_RD_Tail_Index = 0;			// points to the first location written that has not yet been read out
reg            FIFO_Enqueue_Strobe;         	// used to confirm the incoming byte
wire           UART_Rx_Overflow_Flag;       	// status from the UART
reg            Rx_Fifo_WR_Full_Flag;   		// wait to write if the full flag is set to True
reg[DATA_BITS-1:0] FIFO_Byte_Counter;        // counts the received bytes to check for overflow


//**************************************************************************************************
//***** Enqueue FIFO Byte Counters & Pointers
//**************************************************************************************************

//***** Update the Empty & Full Flags *********************************************************************************************
always @( FIFO_Byte_Counter )
   begin
   FIFO_Empty_Flag = ( FIFO_Byte_Counter == 0 );                   	// Set to true when no bytes are in the buffer
   Rx_Fifo_WR_Full_Flag = ( FIFO_Byte_Counter == FIFO_DEPTH );       // Set to true when the counter reaches the end of the buffer
   end

//***** Update the Buffer Count (The usage of the buffer) *****************************************************************************
always @(posedge MClk or posedge Flush_Rx_Fifo)
begin
   if( Flush_Rx_Fifo )
      begin
      FIFO_Byte_Counter <= 0;
      end
   else if( (!Rx_Fifo_WR_Full_Flag && Byte_Rcvd_Flag) && (!FIFO_Empty_Flag && FIFO_Dequeue_Strobe) ) // Don't move the counter if we read the same time we write
      begin
      FIFO_Byte_Counter <= FIFO_Byte_Counter;
      end
   else if( !Rx_Fifo_WR_Full_Flag && Byte_Rcvd_Flag )               	// increment the counter if we successfully enqueue a byte
      begin
      FIFO_Byte_Counter <= FIFO_Byte_Counter + 1'b1;						// add 1 bit due to n size counter parameter declarations
      end
   else if( !FIFO_Empty_Flag && FIFO_Dequeue_Strobe )               	// decrement the counter if we successfully dequeue a byte out
      begin
      FIFO_Byte_Counter <= FIFO_Byte_Counter - 1'b1;
      end
   else                                                              // Don't move the counter if we're not enabled, no bytes ready, full, or empty
      begin
      FIFO_Byte_Counter <= FIFO_Byte_Counter;
      end
end
//**************************************************************************************************
//****** End Rcv FIFO Byte Counters & Pointers
//**************************************************************************************************


//**************************************************************************************************
//***** FIFO Manager
//**************************************************************************************************
always @( posedge MClk )
   begin
   if( Flush_Rx_Fifo )
      begin
      FIFO_Dequeue_Byte <= 0;
      FIFO_WR_Head_Index <= 0;
      FIFO_RD_Tail_Index <= 0;
      end
   else
      begin
//***** Is there a byte ready to write into the FIFO? 
//----- If a Enqueue byte is ready to be written into the FIFO...
      if ( Byte_Rcvd_Flag == 1  && !Rx_Fifo_WR_Full_Flag )
         begin
//***** There is a byte ready, write it into the FIFO, strobe the signal to confirm we got it
         FIFO[FIFO_WR_Head_Index] <= Rcv_Data;
         FIFO_WR_Head_Index <= FIFO_WR_Head_Index + 1'b1;
         FIFO_Enqueue_Strobe <= 1;
         end
      else  
         begin
         FIFO[FIFO_WR_Head_Index] <= FIFO[FIFO_WR_Head_Index];
         FIFO_WR_Head_Index <= FIFO_WR_Head_Index;
         FIFO_Enqueue_Strobe <= 0;
         end

//***** The Upper level wants to Dequeue a byte out of the FIFO ...
//----- Place the FIFO byte into the outgoing buffer, set the flag to respond 
      if( FIFO_Dequeue_Strobe && !FIFO_Empty_Flag )
         begin
         FIFO_Dequeue_Byte <= FIFO[FIFO_RD_Tail_Index];   				// pull from the tail ptr to empty the buffer
         FIFO_RD_Tail_Index <= FIFO_RD_Tail_Index + 1'b1;
         FIFO_Dequeue_Byte_Ready_Flag <= 1;                         	// tell the upper routine, we've readied the byte
         end
      else
         begin
         FIFO_Dequeue_Byte <= FIFO_Dequeue_Byte;                     // if the fifo is empty, this data will be invalid
         FIFO_RD_Tail_Index <= FIFO_RD_Tail_Index;
         FIFO_Dequeue_Byte_Ready_Flag <= 0;                         	// tell the upper routine, we've readied the byte
         end
         
      end
   end
//**************************************************************************************************
//****** End FIFO Manager Block
//**************************************************************************************************



endmodule

