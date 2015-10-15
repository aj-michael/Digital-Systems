`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael, based on BCDto7Segment by Jianjian Song
// Date:     10/15/2015
// Summary:  Converts HEX to 7 segment display
//////////////////////////////////////////////////////////////////////////////////
module HEXto7Segment(HEXnumber,Segments);
	input [3:0] HEXnumber;
	output reg [7:0] Segments;
	
	// This is wrong for 10-15.
	always @ (HEXnumber)
		case (HEXnumber)
		0:	Segments <= 8'B11000000;
		1:	Segments <= 8'B11111001;
		2:	Segments <= 8'B10100100;
		3:	Segments <= 8'B10110000;
		4:	Segments <= 8'B10011001;
		5:	Segments <= 8'B10010010;
		6:	Segments <= 8'B10000010;
		7:	Segments <= 8'B11111000;
		8:	Segments <= 8'B10000000;
		9:	Segments <= 8'B10010000;
		10: Segments <= 8'B10010000;
		11: Segments <= 8'B10010000;
		12: Segments <= 8'B10010000;
		13: Segments <= 8'B10010000;
		14: Segments <= 8'B10010000;
		15: Segments <= 8'B10010000;
		default:	Segments <= 8'B00000000;
		endcase


endmodule
