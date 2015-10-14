`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
// Date: 	 10/1/2015
// Summary:  Splits a number from 0 to 128 into its digits.
//////////////////////////////////////////////////////////////////////////////////
module SplitDigits(Number, Hundreds, Tens, Ones);
	input [6:0] Number;
	output [3:0] Hundreds, Tens, Ones;
	assign Hundreds = (Number / 100) % 10;
	assign Tens = (Number / 10) % 10;
	assign Ones = Number % 10;
endmodule
