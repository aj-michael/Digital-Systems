`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
//
// Create Date:   11:50:15 09/27/2015
// Design Name:   Lab2Part2AJM
// Module Name:   C:/Users/adam/Documents/GitHub/Digital Systems/Lab2-Part2-Controller7SegmentDisplayKeypadScanner/Lab2Part2AJMTest.v
// Project Name:  Lab2-Part2-Controller7SegmentDisplayKeypadScanner
////////////////////////////////////////////////////////////////////////////////
module Lab2Part2AJMTest;
	reg [3:0] Rows;
	reg ClockIn, Start, Reset;
	wire [3:0] Columns;
	wire Locked, Found;
	wire [7:0] Display;
	wire [3:0] Transistors;
	
	defparam uut.StartSwitch.Timer.Divider = 3;
	defparam uut.ControlUnit.Timer.Divider = 3;

	Lab2Part2AJM uut(Rows, ClockIn, Start, Reset, Columns, Locked, Found, Display, Transistors);
	defparam uut.ControlUnit.Timer.Divider = 3;
	wire [7:0] Segment0 = uut.Segment0;
	wire [7:0] Segment1 = uut.Segment1;
	wire [7:0] Segment2 = uut.Segment2;
	wire [7:0] Segment3 = uut.Segment3;
	wire [3:0] OnesDigit = uut.OnesDigit;
	wire [3:0] TensDigit = uut.TensDigit;
	wire [2:0] ControllerCurrentState = uut.ControlUnit.CurrentState;
	wire [2:0] ControllerNextState = uut.ControlUnit.NextState;
	wire ControllerStart = uut.ControlUnit.Start;
	wire DebouncedStart = uut.DebouncedStart;
	wire NormalStart = uut.Start;
	wire [1:0] DebouncerState = uut.StartSwitch.State;
	wire [1:0] DebouncerNextState = uut.StartSwitch.NextState;

	always #5 ClockIn = ~ClockIn;

	initial begin
		Rows = 4'b0000; ClockIn = 0; Start = 0; Reset = 1; #100;
		Reset = 0; #100;
		Rows = 4'b1111; #100;
		Start = 1; #500;
		Rows = 4'b1111; #100;
		Rows = 4'b1011; #100;
		Rows = 4'b0111; #200;
		$stop;
	end
      
endmodule

