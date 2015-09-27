`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// 
// Create Date:    18:21:20 09/26/2015 
// Design Name:    SN74194
// Module Name:    SN74194 
//////////////////////////////////////////////////////////////////////////////////
module SN74194(P,Q,DSR,DSL,S1,S0,_MR,CLOCK);
	parameter	LENGTH = 4;
	input			DSR, DSL, S1, S0, _MR, CLOCK;
	input	[LENGTH-1:0]	P;
	output 	reg [LENGTH-1:0]	Q;

	always @ (posedge CLOCK or negedge _MR)
		if(_MR==0)	Q <= 0;
		else
		case ({S1,S0})
		0:	Q <= Q;
		1:	Q <= {Q[LENGTH-2:0],DSR};
		2:	Q <= {DSL, Q[LENGTH-1:1]};
		3:	Q <= P;
		endcase
endmodule
