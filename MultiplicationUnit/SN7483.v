`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// 
// Create Date:    18:25:59 09/26/2015 
// Design Name:    SN7483 Addition Unit
// Module Name:    SN7483
//////////////////////////////////////////////////////////////////////////////////
module SN7483(A,B,CI,CO,Sum);
	input [3:0] A;
	input [3:0] B;
	input CI;
	output CO;
	output [3:0] Sum;
	assign {CO, Sum} = A + B + CI;
endmodule
