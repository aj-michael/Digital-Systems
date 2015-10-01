`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// 
// Create Date:    15:07:21 09/17/2015 
// Design Name:    Manual Keypad Scanner and Encoder
// Module Name:    Lab2Part1Fall2015AJM 
//////////////////////////////////////////////////////////////////////////////////
module Lab2Part2AJM(Rows, ClockIn, Start, Reset, Columns, Locked, Found, Display, Transistors);
	input [3:0] Rows;
	input ClockIn, Start, Reset;
	output [3:0] Columns;
	output Locked, Found;
	output [7:0] Display;
	output [3:0] Transistors;
	wire DebouncedShift, Rotate;
	wire Load, Shift;
	wire [3:0] OnesDigit;
	wire [3:0] TensDigit;
	wire [7:0] Segment0;
	wire [7:0] Segment1;
	wire [7:0] Segment2;
	wire [7:0] Segment3;
	Clock50MHz KeypadScanClock(ClockIn, Clock, Locked);
	DebouncerWithoutLatch StartSwitch(Start, DebouncedStart, Reset, Clock);
	KeyScanController ControlUnit(Clock, Found, Reset, DebouncedStart, Load, Shift);
	ShiftReg4bits ColumnPattern(4'b1110, Clock, Load, Reset, Shift, Columns);
	KeyEncoder KeySearchUnit(Columns, Rows, Clock, Reset, OnesDigit, TensDigit, Found);
	BCDto7Segment BCDUnit0(OnesDigit, Segment3);
	BCDto7Segment BCDUnit1(TensDigit, Segment2);
	BCDto7Segment BCDUnit2(4'd0, Segment1);
	BCDto7Segment BCDUnit3(4'd0, Segment0);
	SevenSegDriver SevenSegUnit(Segment0, Segment1, Segment2, Segment3, Display, Reset, Clock, Transistors);
endmodule
