`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
// Date:     10/1/2015
// Summary:  A basic distributed RAM.
//////////////////////////////////////////////////////////////////////////////////
module RAM40x7bits(Address, Din, Clock, WriteEnabled, Dout);
	input [5:0] Address;
	input [6:0] Din;
	input Clock, WriteEnabled;
	output [6:0] Dout;
	
	reg [6:0] Data [39:0];
	
	always@(posedge Clock)
		if (WriteEnabled == 1) Data[Address] <= Din;

	assign Dout = Data[Address];
endmodule
