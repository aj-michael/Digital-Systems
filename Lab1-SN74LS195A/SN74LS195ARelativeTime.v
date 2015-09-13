`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
//
// Create Date:   15:51:43 09/10/2015
// Design Name:   SN74LS195Agates and SN74LS195Abehavior
// Module Name:   C:/Users/adam/Documents/GitHub/Lab1SN74LS195A/SN74LS195ARelativeTime.v
// Project Name:  Lab1SN74LS195A
////////////////////////////////////////////////////////////////////////////////
module SN74LS195ARelativeTime;
	reg [3:0] P;
	reg PE, J, K, CP, MR;
	wire Q3not_gate, Q3not_behavior;
	wire [3:0] Qbehavior, Qgates;

	SN74LS195Agates GatesChip (Qgates, P, Q3not_gate, PE, J, K, CP, MR);
	SN74LS195Abehavior BehaviorChip (Qbehavior, P, Q3not_behavior, PE, J, K, CP, MR);

	initial begin  P = 0;  PE = 0;   J = 0;   K = 0;   CP = 0;   MR = 0;  end
	always #5 CP = ~CP;
	
	initial begin
	MR = 1;  P = 4'b1010;  PE=0; J = 0;   K = 0;   #5;	//reset
	MR = 0;  P = 4'b1010;  PE=0; J = 0;   K = 0;   #18;	//reset
	MR = 1;  P = 4'b1010;  PE=0; J = 1;   K = 1;   #18;	//parallel load
	MR = 1;  P = 4'b1010;  PE=1; J = 1;   K = 1;   #18;	//shift, set first stage
	MR = 1;  P = 4'b1010;  PE=1; J = 0;   K = 0;   #18;	//shift, reset first
	MR = 1;  P = 4'b1010;  PE=1; J = 1;   K = 0;   #26;	//shift, toggle first stage
	MR = 1;  P = 4'b1010;  PE=1; J = 0;   K = 1;   #50;	//shift, retain first stage
	$stop;
	end
endmodule

