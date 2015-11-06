`timescale 1ns / 1ps
///File: PongDriver2015fall.v
//pong game with new controller template
//ECE333 Fall 2015
//Term Project template
//
//Date: November 1, 2015
//the video controller uses synch timings from the pong game
//the system clock should be 100MHz
//the VGA pixel clock is 25MHz
//this is a template for students to complete
//try to match the video_timer

module PongWithCRTDriverAJM(
   input Clock, Reset, rota, rotb,
	output [2:0] red,
   output [2:0] green,
   output [1:0] blue,
   output hsync, vsync
);

	wire [9:0] xpos;
	wire [9:0] ypos;

	parameter [9:0] NumberofPixels=10'd640, NumberofLines=10'd480;
	parameter [9:0] SystemClockFreq=10'd100, CRTClockFreq=10'd25; //MHz 

	CRTcontroller2015fall VGAdisplay(NumberofPixels, NumberofLines, SystemClockFreq, CRTClockFreq, hsync, vsync, xpos, ypos, Reset, Clock);
	game_module2015 game_inst(Clock, Reset, xpos, ypos, rota, rotb, red, green, blue);
endmodule
