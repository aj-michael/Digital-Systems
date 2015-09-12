`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// 
// Create Date:    15:35:33 09/12/2015 
// Design Name: 	 Truth table implementation of 4:3 encoder.
// Module Name:    encoder43table 
//////////////////////////////////////////////////////////////////////////////////
module encoder43table(A, B, C, D, Y2, Y1, Y0);
	input A, B, C, D;
	output reg Y2, Y1, Y0;
	
	always@(A, B, C, D)
		case({A, B, C, D})
		4'b0000: {Y2, Y1, Y0} = 3'b000;
		4'b0001: {Y2, Y1, Y0} = 3'b001;
		4'b0010: {Y2, Y1, Y0} = 3'b001;
		4'b0011: {Y2, Y1, Y0} = 3'b010;
		4'b0100: {Y2, Y1, Y0} = 3'b001;
		4'b0101: {Y2, Y1, Y0} = 3'b010;
		4'b0110: {Y2, Y1, Y0} = 3'b010;
		4'b0111: {Y2, Y1, Y0} = 3'b011;
		4'b1000: {Y2, Y1, Y0} = 3'b001;
		4'b1001: {Y2, Y1, Y0} = 3'b010;
		4'b1010: {Y2, Y1, Y0} = 3'b010;
		4'b1011: {Y2, Y1, Y0} = 3'b011;
		4'b1100: {Y2, Y1, Y0} = 3'b010;
		4'b1101: {Y2, Y1, Y0} = 3'b011;
		4'b1110: {Y2, Y1, Y0} = 3'b011;
		4'b1111: {Y2, Y1, Y0} = 3'b100;
		endcase
endmodule
