`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
//
// Create Date:   14:29:09 09/24/2015
// Design Name:   KeyScanController
// Module Name:   C:/Users/adam/Documents/GitHub/Digital Systems/Lab2-Part2-Controller7SegmentDisplayKeypadScanner/KeyScanControlleTest.v
// Project Name:  Lab2-Part2-Controller7SegmentDisplayKeypadScanner
////////////////////////////////////////////////////////////////////////////////
module KeyScanControllerTest;
	reg Clock, Found, Reset, Start;
	wire Load, Shift;
	wire [2:0] CurrentState = uut.CurrentState;
	wire StartTimer = uut.StartTimer;
	wire TimerDone = uut.TimerDone;
	defparam uut.Timer.Divider = 3;
	KeyScanController uut(Clock, Found, Reset, Start, Load, Shift);
	always #10 Clock = ~Clock;
	initial begin
		Clock = 0; Found = 0; Reset = 1; Start = 0; #25;
		Start = 1; #20;
		Reset = 0; #20;
		Start = 0; #90;
		Found = 1; #30;
		Found = 0; #40;
		Start = 1; #20;
		Start = 0; #40;
		Found = 1; #80;
		Found = 0; #450;
		$stop;
	end
endmodule