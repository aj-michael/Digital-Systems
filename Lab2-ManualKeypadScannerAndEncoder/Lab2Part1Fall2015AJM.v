`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// 
// Create Date:    15:07:21 09/17/2015 
// Design Name:    Manual Keypad Scanner and Encoder
// Module Name:    Lab2Part1Fall2015AJM 
//////////////////////////////////////////////////////////////////////////////////
module Lab2Part1Fall2015AJM(Rows, ClockIn, Load, Reset, RotateOnce, Columns, KeyNumberLEDs, ClockLocked);
	parameter LENGTH = 4;
	input [LENGTH-1:0] Rows;
	input ClockIn, Load, Reset, RotateOnce;
	output [LENGTH-1:0] Columns;
	output [LENGTH:0] KeyNumberLEDs;
	output ClockLocked;
	
	wire DebouncedShift, Rotate;
	
	Clock50MHz KeypadScanClock(ClockIn, Clock, ClockLocked);
	DebouncerWithoutLatch RotateOnceSwitch(RotateOnce, DebouncedRotate, Reset, Clock);
	ClockedOneShot RotateOnceUnit(DebouncedRotate, Rotate, Reset, Clock);
	ShiftReg4bits ColumnPattern(Load, Rotate, 4'b1110, Columns, Reset, Clock);
	KeyEncoderAJM KeyMapUnit(Rows, Columns, KeyNumberLEDs);
endmodule
