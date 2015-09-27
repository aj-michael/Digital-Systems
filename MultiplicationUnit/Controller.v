`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// 
// Create Date:    18:17:58 09/26/2015 
// Design Name:    Multiplication controller
// Module Name:    Controller 
//////////////////////////////////////////////////////////////////////////////////
module Controller(Clock, Reset, Start, Shift1, Shift0, Clear);
	input Clock, Reset, Start;
	output reg [2:0] Shift0;
	output reg [2:0] Shift1;
	output reg Clear;
	
	parameter State0 = 4'b0000;
	parameter State1 = 4'b0001;
	parameter State2 = 4'b0010;
	parameter State3 = 4'b0011;
	parameter State4 = 4'b0100;
	parameter State5 = 4'b0101;
	parameter State6 = 4'b0110;
	parameter State7 = 4'b0111;
	parameter State8 = 4'b1000;
	parameter State9 = 4'b1001;
	parameter State10 = 4'b1010;
	parameter State11 = 4'b1011;
	
	reg [3:0] CurrentState;
	reg [3:0] NextState;
	
	always @ CurrentState
		case (CurrentState)
		State0: {Clear, Shift1, Shift0} <= 7'b1000000;		// Do nothing
		State1: {Clear, Shift1, Shift0} <= 7'b0000000;		// Clear the registers
		State2: {Clear, Shift1, Shift0} <= 7'b1101101;		// Initialize registers
		State3: {Clear, Shift1, Shift0} <= 7'b1010010;		// Add and put in top half or product
		State4: {Clear, Shift1, Shift0} <= 7'b1111000; 		// Shift product and multiplier
		State5: {Clear, Shift1, Shift0} <= 7'b1010010;		// Now we just repeat the last two
		State6: {Clear, Shift1, Shift0} <= 7'b1111000;
		State7: {Clear, Shift1, Shift0} <= 7'b1010010;
		State8: {Clear, Shift1, Shift0} <= 7'b1111000;
		State9: {Clear, Shift1, Shift0} <= 7'b1010010;
		State10: {Clear, Shift1, Shift0} <= 7'b1111000;
		State11: {Clear, Shift1, Shift0} <= 7'b1000000;		// We're done
		endcase

	always @ (posedge Clock or negedge Reset)
		if (Reset == 0) begin CurrentState <= State0; NextState <= State0; end
		else CurrentState <= NextState;
	
	always @ (CurrentState or Start or NextState)
		case (CurrentState)
		State0: if (Start == 1) NextState <= State1;
		State1: NextState <= State2;
		State2: NextState <= State3;
		State3: NextState <= State4;
		State4: NextState <= State5;
		State5: NextState <= State6;
		State6: NextState <= State7;
		State7: NextState <= State8;
		State8: NextState <= State9;
		State9: NextState <= State10;
		State10: NextState <= State11;
		endcase
endmodule
