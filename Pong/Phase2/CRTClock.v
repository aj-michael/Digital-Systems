`timescale 1ns / 1ps
// Modified by:	Adam Michael, CM1884
//						Mohammad Almisbaa, CM2060
// Date:				November 5, 2015
// Summary:			This is just a square wave generator.

//File: CRTClockTemplate.v
//Generate 25MHz VGA clock from a SystemClock
//SystemClockFreq and CRTClockFreq are input parameters in MHz
//ECE333 Fall 2015
//Term Project on Pong game on VGA
//this is a template to be completed by students

module CRTClock(SystemClockFreq, CRTClockFreq, PixelClock, Reset, Clock);

	parameter SystemClockSize=10;

	input  [SystemClockSize-1:0] SystemClockFreq;
	input  [SystemClockSize-1:0] CRTClockFreq;
	output PixelClock;
	input  Reset;
	input  Clock;

	reg  [SystemClockSize-1:0] counter;
	wire [SystemClockSize-1:0] MaxCounter;
	
	assign MaxCounter = (SystemClockFreq / CRTClockFreq) - 1;
	assign PixelClock = counter > (MaxCounter >> 1);
	
	always @ (posedge Clock or posedge Reset)
		if (Reset) counter <= 0;
		else begin
			if (counter == MaxCounter) counter <= 0;
			else counter <= counter + 1'd1;
			end
endmodule

