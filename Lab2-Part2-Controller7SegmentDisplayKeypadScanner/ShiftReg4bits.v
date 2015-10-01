`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// 
// Create Date:    15:18:10 09/17/2015 
// Design Name:    Manual Keypad Scanner and Encoder
// Module Name:    ShiftReg4bits 
//////////////////////////////////////////////////////////////////////////////////
module ShiftReg4bits(P, CLOCK, Load, RESET, RotateRight, Q);
	parameter LENGTH = 4;
	input [LENGTH-1:0] P;
	input CLOCK, Load, RESET, RotateRight;
	output reg [LENGTH-1:0] Q;
	
	always@(posedge CLOCK or posedge RESET)
		if (RESET == 1)       Q <= 4'b1110;
		else if (Load)        Q <= P;
		else if (RotateRight) Q <= { Q[0], Q[LENGTH-1:1] };

endmodule
