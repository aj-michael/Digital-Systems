`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// 
// Create Date:    15:39:50 09/10/2015 
// Design Name:    SN74LS195A Gate Level Module
// Module Name:    SN74LS195Agates 
//////////////////////////////////////////////////////////////////////////////////
module SN74LS195Abehavior(Q, P, Q3not, PE, J, K, CP, MR);
	parameter LENGTH = 4;
	input PE, J, K, CP, MR;
	input [LENGTH-1:0] P;
	output reg [LENGTH-1:0] Q;
	output Q3not;
	
	always @ (posedge CP or negedge MR)
		if (MR == 0) Q <= 0;
		else if (PE == 0)
		Q <= P;
		else if (PE == 1)
		Q <= { Q[LENGTH-2:0], (~Q[0]&J)|(Q[0]&K) };
		
	assign Q3not = ~Q[3];
	
endmodule
