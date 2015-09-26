`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
//
// Create Date:   19:46:00 09/18/2015
// Design Name:   HammingEncoder
// Module Name:   C:/Users/adam/Documents/GitHub/Digital Systems/HammingCodes/HammingEncoderTest.v
// Project Name:  HammingCodes
////////////////////////////////////////////////////////////////////////////////
module HammingEncoderTest;
	reg [3:0] data;
	wire [6:0] code;
	wire [6:0] code2;

	HammingEncoder uut(data, code);
	NewHammingEncoder uut2(data, code2);

	initial begin
		data = 4'b0000; #1;
		data = 4'b0001; #1;
		data = 4'b0010; #1;
		data = 4'b0011; #1;
		data = 4'b0100; #1;
		data = 4'b0101; #1;
		data = 4'b0110; #1;
		data = 4'b0111; #1;
		data = 4'b1000; #1;
		data = 4'b1001; #1;
		data = 4'b1010; #1;
		data = 4'b1011; #1;
		data = 4'b1100; #1;
		data = 4'b1101; #1;
		data = 4'b1110; #1;
		data = 4'b1111; #1;
		$stop;
	end
endmodule

