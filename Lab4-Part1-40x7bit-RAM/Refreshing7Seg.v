// File name	: Refreshing7Seg.v
// Written by	: Jianjian Song
// Generate and repeat four positive pulses on Transistors
// with one pulse being on at any given time
`timescale 1ns / 1ps

module Refreshing7Seg(Transistors,Reset, CLOCK) ;
parameter	Bits = 4;
input		Reset, CLOCK;
output reg [Bits-1:0]	Transistors;

reg	[1:0]	Q;
//refreshing rate in number of clock cycles. Time=#cycles*20ns
parameter	Divider = 10000;	
parameter 	NumberOfBits = 22;
reg [NumberOfBits:0] count;

always @ (posedge CLOCK)
	if(Reset==1)	Q <= 0;
	else	if (count==Divider) Q<=Q+1'b1;
	else Q<=Q;

always@(Q)
	case (Q)
	0:	Transistors<=4'b1110;
	1:	Transistors<=4'b1101;
	2: Transistors<=4'b1011;
	3: Transistors<=4'b0111;
	endcase
	
always @ (posedge CLOCK)
	if(Reset==1)		begin count <= 0; end
	else if (count==Divider)	count<=0;
		else count <= count+1'b1;
	
endmodule
