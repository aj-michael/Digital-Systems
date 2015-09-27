`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
//
// Create Date:   21:22:18 09/26/2015
// Design Name:   Controller
// Module Name:   C:/Users/adam/Documents/GitHub/Digital Systems/MultiplicationUnit/ControllerTest.v
// Project Name:  DataUnit
module ControllerTest;
	reg Clock, Reset, Start;
	wire [2:0] Shift1;
	wire [2:0] Shift0;
	wire Clear;
	
	Controller uut(Clock, Reset, Start, Shift1, Shift0, Clear);
	wire [3:0] CurrentState = uut.CurrentState;
	wire [3:0] NextState = uut.NextState;
	
	always #5 Clock = ~Clock;

	initial begin
		Clock = 0; Reset = 0; Start = 0; #10;
		Reset = 1; #30;
		Start = 1; #200;
		$stop;
	end
endmodule

