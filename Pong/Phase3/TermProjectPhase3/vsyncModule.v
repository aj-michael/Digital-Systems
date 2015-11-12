`timescale 1ns / 1ps

//File: 		vsyncModule.v
//Author: 	Adam Michael, CM1884
//				Mohammad Almisbaa, CM2060
//Date: 		November 5, 2015

//The line increment is synchronized with the hsync pulse
//synch pulse is generated at the end of the line: Active Video-BackPorch-SynchPulse-FrontPorch
//this is how it is done by the video timer of the pong game
//LineEnd and FrameEnd are ANDed to restart frame

module vsyncModule(LineEnd, SynchPulse, FrontPorch, ActiveVideo, BackPorch, vsync, yposition, reset, clock);

	parameter yresolution=10;

	input [yresolution-1:0] SynchPulse, FrontPorch, ActiveVideo, BackPorch;
	input reset, clock, LineEnd;

	output vsync;
	output reg [yresolution-1:0] yposition;

	wire [yresolution-1:0] ycount;
	ClockedNegativeOneShot RestartUnit(LineEnd, NextLineOneShot, reset, clock);

	assign vsync = ~((ycount > ActiveVideo+FrontPorch) && (ycount <= ActiveVideo+FrontPorch+SynchPulse));
	
	always@(ycount, SynchPulse, BackPorch, ActiveVideo, FrontPorch) 
		yposition<=ycount;
		
	wire [yresolution-1:0] EndCount = SynchPulse + FrontPorch + ActiveVideo + BackPorch;
	assign done = ycount == EndCount;

	UniversalCounter10bitsV5 YPositionCounter(10'd0,10'd0, EndCount, ycount, done,done||NextLineOneShot,   , reset, clock) ;
endmodule
