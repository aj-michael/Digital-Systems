`timescale 1ns / 100ps

// File name	: p2hw3latches2015fall.v
// ECE333 Homework #3 Problem 2
//check if this circuit has latches. Show where latches are on its schematic,
//and propose fixes to remove all latches.

module p2hw3latches2015fall(X, Z, RESET, CLOCK, CurrentState);

	input	X, RESET, CLOCK;
	output reg Z;


	// State variables
	output reg [1:0] CurrentState;
	reg [1:0] NextState;


	// State codes
	parameter	State0 = 0, State1 = 1, State2 = 2, State3 = 3;

	// Output logic
	always @ (CurrentState)
		if(CurrentState==State0) Z<=1;
		else if (CurrentState==State3) Z<=0;
		else Z<=0;
	
	// State registers
	always @ (posedge CLOCK)
		if (RESET==1) CurrentState <= State0; else CurrentState <= NextState;	
	//next state logic
	always@(CurrentState or X) 
		case (CurrentState)
		State0: if (X==0) NextState <= State1; else NextState <= State0;
		State1: if (X==0) NextState <= State1; else NextState <= State0;
		State3: if (X==0) NextState <= State1; else NextState <= State2;
		State2: NextState <= State2;
		endcase
endmodule

