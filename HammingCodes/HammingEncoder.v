`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
//
// Create Date:    19:35:25 09/18/2015 
// Design Name:    Hamming Codes Implementation
// Module Name:    HammingEncoder 
//////////////////////////////////////////////////////////////////////////////////
module HammingEncoder(data, code);
	input [3:0] data;
	output reg [6:0] code;

	always@(data)
	case (data)
		4'b0000: code <= 7'b0000000;
		4'b0001: code <= 7'b0001011;
		4'b0010: code <= 7'b0010101;
		4'b0011: code <= 7'b0011110;
		4'b0100: code <= 7'b0100110;
		4'b0101: code <= 7'b0101101;
		4'b0110: code <= 7'b0110011;
		4'b0111: code <= 7'b0111000;
		4'b1000: code <= 7'b1000111;
		4'b1001: code <= 7'b1001100;
		4'b1010: code <= 7'b1010010;
		4'b1011: code <= 7'b1011001;
		4'b1100: code <= 7'b1100001;
		4'b1101: code <= 7'b1101010;
		4'b1110: code <= 7'b1110100;
		4'b1111: code <= 7'b1111111;
	endcase
endmodule
