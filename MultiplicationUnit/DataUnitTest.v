`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
//
// Create Date:   20:16:32 09/26/2015
// Design Name:   DataUnit
// Module Name:   C:/Users/adam/Documents/GitHub/Digital Systems/MultiplicationUnit/DataUnitTest.v
// Project Name:  DataUnit
////////////////////////////////////////////////////////////////////////////////
module DataUnitTest;
	reg [3:0] Multiplicant;
	reg [3:0] Multiplier;
	reg [2:0] Shift1;
	reg [2:0] Shift0;
	reg reset, clock;
	wire [7:0] Product;

	DataUnit uut(Product, Multiplicant, Multiplier, Shift1, Shift0, reset, clock);
	
	always #5 clock = ~clock;

	initial begin
		reset = 0; clock = 0;
		Multiplicant = 3; Multiplier = 7;
		Shift1 = 3'b101; Shift0 = 3'b101; #1;
		reset = 1; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b111; Shift0 = 3'b000; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b111; Shift0 = 3'b000; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b111; Shift0 = 3'b000; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b011; Shift0 = 3'b000; #10;
		reset = 0; #10;
		reset = 1; Multiplicant = 5; Multiplier = 5;
		Shift1 = 3'b101; Shift0 = 3'b101; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b111; Shift0 = 3'b000; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b111; Shift0 = 3'b000; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b111; Shift0 = 3'b000; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b011; Shift0 = 3'b000; #10;
		reset = 0; #10;
		reset = 1; Multiplicant = 12; Multiplier = 6;
		Shift1 = 3'b101; Shift0 = 3'b101; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b111; Shift0 = 3'b000; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b111; Shift0 = 3'b000; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b111; Shift0 = 3'b000; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b011; Shift0 = 3'b000; #10;
		reset = 0; #10;
		reset = 1; Multiplicant = 0; Multiplier = 15;
		Shift1 = 3'b101; Shift0 = 3'b101; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b111; Shift0 = 3'b000; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b111; Shift0 = 3'b000; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b111; Shift0 = 3'b000; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b011; Shift0 = 3'b000; #10;
		reset = 0; #10;
		reset = 1; Multiplicant = 12; Multiplier = 12;
		Shift1 = 3'b101; Shift0 = 3'b101; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b111; Shift0 = 3'b000; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b111; Shift0 = 3'b000; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b111; Shift0 = 3'b000; #10;
		Shift1 = 3'b010; Shift0 = 3'b010; #10;
		Shift1 = 3'b011; Shift0 = 3'b000; #10;
		$stop;
	end
endmodule

