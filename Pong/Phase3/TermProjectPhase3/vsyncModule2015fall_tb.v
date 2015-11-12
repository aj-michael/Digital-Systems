`timescale 1ns / 1ps

//Author: 	Adam Michael, CM1884
//				Mohammad Almisbaa, CM2060
//Date: 		November 5, 2015

module vsyncModule2015fall_tb;

	reg LineEnd;
	reg [9:0] SynchPulse, FrontPorch, ActiveVideo, BackPorch;
	reg reset, clock;

	wire vsync;
	wire [9:0] yposition;

	vsyncModule uut (LineEnd, SynchPulse, FrontPorch, ActiveVideo, BackPorch, vsync, yposition, reset, clock);
	
	initial begin
		SynchPulse = 2;  BackPorch = 3;  ActiveVideo = 5;
		FrontPorch = 2;   reset = 0; clock = 0;    LineEnd=0; end
	always #1 clock=~clock;
	always #6 LineEnd=~LineEnd;
	initial fork
	#0 reset=1; 	#12 reset=0; 

   #300 $stop;
	join
endmodule

