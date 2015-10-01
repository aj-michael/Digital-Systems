`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
//////////////////////////////////////////////////////////////////////////////////
module SplitDigits(Number, Hundreds, Tens, Ones);
	input [6:0] Number;
	output reg [3:0] Hundreds, Tens, Ones;
	always @ (Number)
		case (Number)
		// automate this with python? I need 128 cases.
		7'b0000000: {Hundreds, Tens, Ones} <= 12'b000000000000;
		endcase
endmodule
