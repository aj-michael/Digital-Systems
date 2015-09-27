`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// 
// Create Date:    18:15:41 09/26/2015 
// Design Name:    A multiplier
// Module Name:    Multiplication 
//////////////////////////////////////////////////////////////////////////////////
module Multiplication(Clock, Reset, Start, Multiplicant, Multiplier, Product);
	input Clock, Reset, Start;
	input [3:0] Multiplicant;
	input [3:0] Multiplier;
	output [7:0] Product;
	
	wire [2:0] Shift0;
	wire [2:0] Shift1;
	wire Clear;

	Controller Controller(Clock, Reset, Start, Shift1, Shift0, Clear);
	DataUnit DataUnit(Product, Multiplicant, Multiplier, Shift1, Shift0, Clear, Clock);
endmodule
