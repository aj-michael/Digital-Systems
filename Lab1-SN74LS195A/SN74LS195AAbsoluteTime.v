`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
//
// Create Date:   19:48:37 09/12/2015
// Design Name:   SN74LS177Abehavior
// Module Name:   C:/Users/adam/Documents/GitHub/Lab1SN74LS177A/SN74LS177AAbsoluteTime.v
// Project Name:  Lab1SN74LS177A
////////////////////////////////////////////////////////////////////////////////
module SN74LS195AAbsoluteTime;
	reg [3:0] P;
	reg PE, J, K, CP, MR;
	wire Q3not_gate, Q3not_behavior;
	wire [3:0] Qbehavior, Qgates;

	SN74LS195Agates GatesChip (Qgates, P, Q3not_gate, PE, J, K, CP, MR);
	SN74LS195Abehavior BehaviorChip (Qbehavior, P, Q3not_behavior, PE, J, K, CP, MR);

	always #5 CP = ~CP;

	initial fork
		MR = 1; P = 4'b1010; PE=0; J = 0; K = 0; CP = 0;
		#5 MR = 0; #5 P = 4'b1010; #5 PE=0; #5 J = 0; #5 K = 0;
		#23 MR = 1; #23 P = 4'b1010; #23 PE=0; #23 J = 1; #23 K = 1;
		#41 MR = 1; #41 P = 4'b1010; #41 PE=1; #41 J = 1; #41 K = 1;
		#59 MR = 1; #59 P = 4'b1010; #59 PE=1; #59 J = 0; #59 K = 0;
		#77 MR = 1; #77 P = 4'b1010; #77 PE=1; #77 J = 1; #77 K = 0;
		#103 MR = 1; #103 P = 4'b1010; #103 PE=1; #103 J = 0; #103 K = 1;
		#153 $stop;
	join
endmodule

