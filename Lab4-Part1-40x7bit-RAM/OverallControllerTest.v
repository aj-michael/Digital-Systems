`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
////////////////////////////////////////////////////////////////////////////////
module OverallControllerTest;
	reg Clock, IncrementData, LoadData, Reset;
	wire AddOne, WriteOrRead;

	OverallController uut(Clock, IncrementData, LoadData, Reset, AddOne, WriteOrRead);

	always #5 Clock = ~Clock;

	initial begin
		Clock = 0; IncrementData = 0; LoadData = 0; Reset = 0; #10;
		IncrementData = 1; #20;
		IncrementData = 0; #10;
		LoadData = 1; #10;
		LoadData = 0; #10;
		Reset = 1; #30;
		Reset = 0; #10;
		$stop;
	end
endmodule

