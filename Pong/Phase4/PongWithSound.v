`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:23 11/11/2015 
// Design Name: 
// Module Name:    PongWithSound 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PongWithSound(
   input Clock, Reset, rota, rotb, partyMode, growSquares, shiftX, shiftY,
	output [2:0] red,
   output [2:0] green,
   output [1:0] blue,
   output hsync, vsync,
	output Speaker
);

	wire [9:0] xpos;
	wire [9:0] ypos;

	parameter [9:0] NumberofPixels=10'd640, NumberofLines=10'd480;
	parameter [9:0] SystemClockFreq=10'd100, CRTClockFreq=10'd25; //MHz 
	
	CRTcontroller2015fall VGAdisplay(NumberofPixels, NumberofLines, SystemClockFreq, CRTClockFreq, hsync, vsync, xpos, ypos, Reset, Clock);
	GameWithSound game_inst(Clock, Reset, xpos, ypos, rota, rotb, partyMode, growSquares, shiftX, shiftY, red, green, blue, Speaker);
endmodule
