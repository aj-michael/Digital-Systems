// File name	: sn74194.v
// Written by	: Jianjian Song
// 4-bit universal bidirectional shift register
`timescale 1ns / 1ps

module SN74194v1(P,Q,DSR,DSL,S1,S0,_MR,CLOCK) ;
parameter	LENGTH = 4;
input			DSR, DSL, S1, S0, _MR, CLOCK;
input	[LENGTH-1:0]	P;
output 	reg [LENGTH-1:0]	Q;
reg	[LENGTH-1:0]	NextQ;
//reg Q;  //A warning will appear if dimension is not given.
// An error will occur if posedge _MR is used because _MR is active low
//always @ (posedge CLOCK or posedge _MR)

always @ (posedge CLOCK or negedge _MR)
	if(_MR==0)	Q <= 0;
	else	Q<=NextQ;
//activity list does not include the clock signal
always@(Q or S1 or S0 or DSR or DSL or P)
	case ({S1,S0})
	0:	NextQ <= Q;	// hold
	1:	NextQ <= {Q[LENGTH-2:0],DSR};	// shift left
	2:	NextQ <= {DSL, Q[LENGTH-1:1]};		// shift right
	3:	NextQ <= P;				// parallel load
	endcase
endmodule
