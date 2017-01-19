///////////////////////////////////////////////
// Elite 7seg display counter
//
// x     g f e d c b a
//
// 0     0 0 0 0 0 0 1
// 1     1 0 0 1 1 1 1
// 2     0 0 1 0 0 1 0
// 3     0 0 0 0 1 1 0           1 = off
// 4     1 0 0 1 1 0 0
// 5     0 1 0 0 1 0 0           0 = on
// 6     0 1 0 0 0 0 0
// 7     0 0 0 1 1 1 1
// 8     0 0 0 0 0 0 0
// 9     0 0 0 0 1 0 0
// A     0 0 0 1 0 0 0
// B     1 1 0 0 0 0 0
// C     0 1 1 0 0 0 1
// D     1 0 0 0 0 1 0
// E     0 1 1 0 0 0 0
// F     0 1 1 1 0 0 0
//
// Location diagram for x
//
//			---a---
//			f		b
//			---g---
//			e		c
//			---d---   DP

///////////////////////////////////////////////
// module Elite_7Seg
///////////////////////////////////////////////
module Elite_7Seg
	(
   input wire 	CLOCK_50,
	input wire 	Reset_7Seg,
	input wire 	[7:0]	Elite_7Seg_Disp_Word,	// from the SPI bus for right now.
	input wire 	Elite_7Seg_Set_Flag,
	output wire	[6:0]	Elite_7Seg_0_Byte,		// far right of de1 board, declare as wire
	output reg	[6:0]	Elite_7Seg_1_Byte,
	output reg	[6:0]	Elite_7Seg_2_Byte,
	output reg	[6:0]	Elite_7Seg_3_Byte,
	output reg	[6:0]	Elite_7Seg_4_Byte,
	output reg	[6:0]	Elite_7Seg_5_Byte			// far left of de1 board
	);

// Macros for readability
// Location diagram for x
//
//			---a---
//			f		b
//			---g---
//			e		c
//			---d---   DP

// x     		g f e d c b a
`define Seg7_OFF 7'b1111111
`define Seg7_0 7'b1000000
`define Seg7_1 7'b1111001
`define Seg7_2 7'b0100100
`define Seg7_3 7'b0110000
`define Seg7_4 7'b0011001
`define Seg7_5 7'b0010010
`define Seg7_6 7'b0000010
`define Seg7_7 7'b1111000
`define Seg7_8 7'b0000000
`define Seg7_9 7'b0010000
`define Seg7_A 7'b0001000
`define Seg7_b 7'b0000011
`define Seg7_C 7'b1000110
`define Seg7_d 7'b0100001
`define Seg7_E 7'b0000110
`define Seg7_F 7'b0001110
`define Seg7_L 7'b1000111
`define Seg7_i 7'b1101111
`define Seg7_t 7'b0000111

 
// Assignments
assign Elite_7Seg_0_Byte = SevenSeg;	// declare as a wire output so we write to an interim variable 

// BCD is a counter that counts from 0 to 15
// Counter goes from 00000000 to 99999999, then rolls-over.
reg [23:0] Counter;
reg [4:0] BCD;
reg [6:0] SevenSeg; //  decimal point not included

// Unary reduction, set flag when when vector full
wire cntovf = &Counter;

// Structural Coding
always @(posedge CLOCK_50) 
	begin
	if(cntovf) BCD <= (BCD == 4'hF ? 4'h0 : BCD + 4'h1);
	end
	
always @(posedge CLOCK_50)
	begin
		Counter <= Counter + 24'h1;
		
		Elite_7Seg_5_Byte <= `Seg7_OFF; 
		Elite_7Seg_4_Byte <= `Seg7_OFF; 
		Elite_7Seg_3_Byte <= `Seg7_OFF; 
		Elite_7Seg_2_Byte <= `Seg7_OFF; 
		Elite_7Seg_1_Byte <= `Seg7_0; 
		SevenSeg <= `Seg7_1;
	end
		
//always block for converting bcd digit into 7 segment format
/*
always @(posedge CLOCK_50) 

		case(BCD)
			4'h0: SevenSeg = `Seg7_0;
			4'h1: SevenSeg = `Seg7_1;
			4'h2: SevenSeg = `Seg7_2;
			4'h3: SevenSeg = `Seg7_3;
			4'h4: SevenSeg = `Seg7_4;
			4'h5: SevenSeg = `Seg7_5;
			4'h6: SevenSeg = `Seg7_6;
			4'h7: SevenSeg = `Seg7_7;
			4'h8: SevenSeg = `Seg7_8;
			4'h9: SevenSeg = `Seg7_9;
			4'hA: SevenSeg = `Seg7_A;
			4'hB: SevenSeg = `Seg7_b;
			4'hC: SevenSeg = `Seg7_C;
			4'hD: SevenSeg = `Seg7_d;
			4'hE: SevenSeg = `Seg7_E;
			4'hF: SevenSeg = `Seg7_F;
			default: SevenSeg = 7'b1111111;			// default all off
		endcase
*/		


	endmodule
