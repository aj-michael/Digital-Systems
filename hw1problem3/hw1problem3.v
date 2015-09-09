`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Adam, LLC
// Engineer: Adam Michael
// 
// Create Date:    21:46:39 09/08/2015 
// Design Name: 
// Module Name:    hw1problem3 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module hw1problem3(X, Z, RESET, CLOCK);
	input X, RESET, CLOCK;
	output Z;
	
	reg Q1, Q0;
	wire D1, D0;
	
	always @ (posedge CLOCK)
		if (RESET == 1) begin Q1 <= 0; Q0 <= 0; end
		else begin Q1 <= D1; Q0 <= D0; end

	assign Z = Q1 & Q0;

	assign D1 = ~X & Q1 & ~Q0 | X & Q0;
	assign D0 = ~X;

endmodule
