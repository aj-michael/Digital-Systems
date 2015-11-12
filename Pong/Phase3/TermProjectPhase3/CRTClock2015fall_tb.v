`timescale 1ns / 1ps
// Modified by:	Adam Michael, CM1884
//						Mohammad Almisbaa, CM2060
// Date:				November 5, 2015
// Summary:			This test bench simulates converting a 100MHz clock into a 25MHz clock.

module CRTClock2015fall_tb;

	reg Reset, Clock;
	wire PixelClock;

	reg [9:0] SystemClockFreq;
	reg [9:0] CRTClockFreq;
	CRTClock uut (SystemClockFreq, CRTClockFreq, PixelClock, Reset, Clock);

	initial begin
		SystemClockFreq = 100;
		CRTClockFreq = 25;
		Reset = 0;
		Clock = 0;
	end

	initial fork
	#0 Reset=1; #20 Reset=0;
	#800 $stop;
	join
	always #4 Clock=~Clock;   
endmodule

