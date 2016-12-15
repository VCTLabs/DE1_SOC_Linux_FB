//**************************************************************************************************
//***** Module Name: elite_SPI_Slave
//***** Description: General Purpose SPI IO
//*****              Assumes MClk is 50MHz
//*****              Sets SPI Clk to 1MHz
//***** 
//***** 
//***** Elite Engineering Corporation
//***** PROPRIETARY
//***** Created:  20 APR 2016, RLK
//***** Revision Log: X1
//***** 
//**************************************************************************************************

//***** Call to Include file located in Top Level **************************************************
`include  "defines.vh"



//**************************************************************************************************


module elite_SPI_Slave
   (
   MClk,						      //	Clock Input, 50 MHz
   USPI_Rst_Flag,        		// Input                
   USPI_Cmnd1_8,              // Output                
	USPI_Ready_Flag,           // Output                
   USPI_MISO,                 // Input               
   USPI_MOSI,                 // Output                
   USPI_SCLK,                 // Input                
   USPI_CSEL,                 // Input                
	);

//***** Declare Top Module Inputs/Outputs/Bidir
input			      MClk;				      	//	50 MHz
input             USPI_Rst_Flag;  			// Input                
output [7:0]	   USPI_Cmnd1_8;        	// Output                
output			   USPI_Ready_Flag;      	// Output                
input			      USPI_MISO;            	// Input               
output			   USPI_MOSI;            	// Output                
input			   	USPI_SCLK;            	// Input                
input			   	USPI_CSEL;            	// Input                

//***** External Net Definitions *********************************************************************
wire           	MClk;							// Input
wire              USPI_Rst_Flag;  			// Input                
reg [7:0]	      USPI_Cmnd1_8;        	// Output                
reg			      USPI_Ready_Flag = 1;  	// Output                
wire			      USPI_MISO;            	// Input               
reg			      USPI_MOSI;            	// Output                
wire			      USPI_SCLK;            	// Input                
wire			      USPI_CSEL;          		// Input                

//***** Internal Net Definitions ***************************************************************************************
wire              MSPI_Ready_Flag;           // 1 = driver is ready for new data, 0 = data is being xmitted/rcvd
wire [7:0]        MSPI_Rcv_Data_Byte;        // 8 bit data
reg  [7:0]        MSPI_Xmit_Data_Byte = 0;   // 8 bit data to be xmitted to SPI device, must be set at or before Start Cmnd is set
reg               MSPI_Start_Cmnd = 0;       // 1 = commands the driver to begin xmitting
reg               MSPI_Reset = 1;            // forces xmit to stop. driver will return to idle state
reg               MSPI_Clk_Polarity = 1;   

//***** Debug Registers
reg               USPI_Debug1 = 0;         // Output
reg               USPI_Debug2 = 0;         // Output
reg               USPI_Debug3 = 0;         // Output

//*************************************************************************************************
//***** Input Wire Driver assignments
//*************************************************************************************************

reg [2:0] SCKr;  
reg [2:0] SSELr;  
reg [1:0] MOSIr;  


wire SCK_risingedge = (SCKr[2:1]==2'b01);  		// now we can detect USPI_SCLK rising edges
wire SCK_fallingedge = (SCKr[2:1]==2'b10);  		// and falling edges

wire SSEL_active = ~SSELr[1];  // SSEL is active low
wire SSEL_startmessage = (SSELr[2:1]==2'b10);  	// message starts at falling edge
wire SSEL_endmessage = (SSELr[2:1]==2'b01);  	// message stops at rising edge

wire MOSI_data = MOSIr[1];
wire MISO_data;

// sync SCK to the FPGA clock using a 3-bits shift register
always @(posedge MClk) SCKr <= {SCKr[1:0], USPI_SCLK};

// same thing for SSEL
always @(posedge MClk) SSELr <= {SSELr[1:0], USPI_CSEL};

// and for MOSI
always @(posedge MClk) MOSIr <= {MOSIr[0], USPI_MOSI};




// we handle SPI in 8-bits format, so we need a 3 bits counter to count the bits as they come in
reg [2:0] bitcnt;

reg byte_received;  										// high when a byte has been received
reg [7:0] byte_data_received;
reg LED;

always @(posedge MClk)
	begin
	  if(~SSEL_active)
		 bitcnt <= 3'b000;
	  else
	  if(SCK_risingedge)
	  begin
		 bitcnt <= bitcnt + 3'b001;

		 // implement a shift-left register (since we receive the data MSB first)
		 byte_data_received <= {byte_data_received[6:0], MOSI_data};
	  end
	end

always @(posedge MClk) byte_received <= SSEL_active && SCK_risingedge && (bitcnt==3'b111);

// we use the LSB of the data received to control an LED
always @(posedge MClk) if(byte_received) LED <= byte_data_received[0];


//**************************************************************************************************
//***** SPI clock generator - operates at 2x of target spi clock to allow rising/falling edge detect
//***** Main state machine holds this clock in "reset" until ready to help guarrantee setup/hold times
//***** Setup to 1MHz SCK
//**************************************************************************************************
reg [7:0] byte_data_sent;

reg [7:0] cnt;
always @(posedge MClk) if(SSEL_startmessage) cnt<=cnt+8'h1;  // count the messages

always @(posedge MClk)
	if(SSEL_active)
		begin
		if (SSEL_startmessage)
			 byte_data_sent <= cnt;  // first byte sent in a message is the message count
		else
		  if(SCK_fallingedge)
		  begin
			 if(bitcnt==3'b000)
				byte_data_sent <= 8'h00;  // after that, we send 0s
			 else
				byte_data_sent <= {byte_data_sent[6:0], 1'b0};
		  end
		end

assign MISO_data = byte_data_sent[7];  // send MSB first
// we assume that there is only one slave on the SPI bus
// so we don't bother with a tri-state buffer for MISO
// we normally would need to tri-state MISO when SSEL is inactive



endmodule 
//**************************************************************************************************
//***** End Module *********************************************************************************
//**************************************************************************************************
