`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
//
// Create Date:   21:40:37 09/26/2015
// Design Name:   Multiplication
// Module Name:   C:/Users/adam/Documents/GitHub/Digital Systems/MultiplicationUnit/MultiplicationTest.v
// Project Name:  DataUnit
////////////////////////////////////////////////////////////////////////////////
module MultiplicationTest;
	reg Clock, Reset, Start;
	reg [3:0] Multiplicant;
	reg [3:0] Multiplier;
	wire [7:0] Product;

	Multiplication uut(Clock, Reset, Start, Multiplicant, Multiplier, Product);
	
	always #5 Clock = ~Clock;

	initial begin
		Clock = 0; Reset = 0; Start = 0; Multiplicant = 13; Multiplier = 13; #10;
		Reset = 1; #10;
		Start = 1; #150;
		Multiplicant = 9; Multiplier = 11; Reset = 0; #10;
		Reset = 1; #10;
		Start = 1; #150;
		Multiplicant = 2; Multiplier = 2; Reset = 0; #10;
		Reset = 1; #10;
		Start = 1; #150;
		Multiplicant = 5; Multiplier = 8; Reset = 0; #10;
		Reset = 1; #10;
		Start = 1; #150;
		Multiplicant = 3; Multiplier = 14; Reset = 0; #10;
		Reset = 1; #10;
		Start = 1; #150;
		$stop;
	end
endmodule

