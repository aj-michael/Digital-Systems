`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
// Create Date:   14:53:39 10/01/2015
// Design Name:   RAM40x7bits
////////////////////////////////////////////////////////////////////////////////
module RAM40x7bitsTest;
	reg [5:0] Address;
	reg [6:0] Din;
	reg Clock, WriteEnabled;
	wire [6:0] Dout;

	RAM40x7bits uut(Address,Din,Clock,WriteEnabled,Dout);

	always #5 Clock = ~Clock;

	initial begin
		Address = 0; Din = 0; Clock = 0; WriteEnabled = 0; #20;
		Address = 6'd13; Din = 7'd57; #20;
		WriteEnabled = 1; #20;
		WriteEnabled = 0; Address = 6'd14; #20;
		Address = 6'd13; #20;
		$stop;
	end
      
endmodule

