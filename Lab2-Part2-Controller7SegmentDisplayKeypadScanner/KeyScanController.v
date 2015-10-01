`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// 
// Create Date:    14:11:27 09/24/2015 
// Design Name:    Key Scan Controller
// Module Name:    KeyScanController 
//////////////////////////////////////////////////////////////////////////////////
module KeyScanController(Clock, Found, Reset, Start, Load, Shift);
	input Clock, Found, Reset, Start;
	output reg Load;
	output reg Shift;
	reg [2:0] CurrentState;
	reg [2:0] NextState;
	reg StartTimer;
	wire TimerDone;
	parameter State0 = 3'b000;
	parameter State1 = 3'b001;
	parameter State2 = 3'b010;
	parameter State3 = 3'b011;
	parameter State4 = 3'b100;
	initial CurrentState = State0;
	initial NextState = State0;
	// Output block
	always @ (CurrentState)
		case (CurrentState)
		State0: {Load, Shift} <= 2'b00;
		State1: {Load, Shift} <= 2'b10;
		State2: {Load, Shift} <= 2'b00;
		State3: {Load, Shift} <= 2'b00;
		State4: {Load, Shift} <= 2'b01;
		endcase
	// State transition block
	always @ (posedge Clock or posedge Reset)
		if (Reset == 1) CurrentState <= State0;
		else CurrentState <= NextState;
	// Next state block
	always @ (CurrentState or Found or Start or TimerDone)
		if (CurrentState == State0 && Start == 1) NextState <= State1;
		else if (CurrentState == State1) begin NextState <= State2; StartTimer <= 1; end
		else if (CurrentState == State2 && TimerDone == 1) NextState <= State3;	// I think this is wrong.
		else if (CurrentState == State2) StartTimer <= 0;
		else if (CurrentState == State3 && Found == 1) NextState <= State3;
		else if (CurrentState == State3 && Found == 0) NextState <= State4;
		else if (CurrentState == State4) begin NextState <= State2; StartTimer <= 1; end
	DelayLoop Timer(StartTimer, TimerDone, Clock);
endmodule
