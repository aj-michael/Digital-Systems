`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:  Adam, LLC
// Engineer: Adam Michael
//
// Create Date:   22:42:16 09/08/2015
// Design Name:   hw1problem3
// Module Name:   C:/Users/adam/Documents/GitHub/Digital Systems/hw1problem3/hw1problem3TB.v
// Project Name:  hw1problem3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hw1problem3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hw1problem3TB;
	reg X, RESET, CLOCK;
	wire Z;
	wire Q1 = Unit2.Q1;
	wire Q0 = Unit2.Q0;

	initial begin #0 CLOCK = 1; end
	always #1 CLOCK = ~CLOCK;

	initial fork
		#0 RESET = 1;	// I added the inital reset because otherwise Q1 will
		#0 X = 0;		// depend on previous (non-existant) value of Q1.
		#1 RESET = 0;
		#2 X = 0;		// X changes every 2 time units because CLOCK flips once
		#4 X = 0;		// per time unit and we only change state on rising edges.
		#6 X = 1;
		#8 X = 0;
		#10 X = 1;
		#12 X = 0;
		#14 X = 0;
		#16 X = 1;
		#18 X = 1;
		#20 X = 0;
		#22 X = 1;
		#24 X = 0;
		#26 X = 1;
		#28 X = 0;
		#30 X = 0;
		#32 X = 1;
		#34 X = 0;
		#36 X = 1;
		#38 X = 1;
		#40 X = 0;
		#42 $stop;
	join

	hw1problem3 Unit2(X, Z, RESET, CLOCK);
endmodule

