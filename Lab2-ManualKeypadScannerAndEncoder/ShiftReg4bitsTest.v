`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
//
// Create Date:   17:54:38 09/18/2015
// Design Name:   ShiftReg4bits
// Module Name:   C:/Users/adam/Documents/GitHub/Digital Systems/Lab2-ManualKeypadScannerAndEncoder/ShiftReg4bitsTest.v
// Project Name:  Lab2-ManualKeypadScannerAndEncoder
////////////////////////////////////////////////////////////////////////////////
module ShiftReg4bitsTest;
	reg [3:0] P;
	reg CLOCK, Load, RESET, RotateRight;
	wire [3:0] Q;

	ShiftReg4bits uut (P, CLOCK, Load, RESET, RotateRight, Q);

	always #5 CLOCK = ~CLOCK;

	initial begin
		P = 4'b0111; CLOCK = 0; Load = 1; RESET = 1; RotateRight = 0; #1;
		RESET = 0; #13;
		RotateRight = 1; Load = 0; #40;
		RotateRight = 0; #10;
		RESET = 1; #10;
		$stop;
	end      
endmodule

