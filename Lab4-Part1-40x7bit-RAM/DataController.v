`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
// Description: This determines what value to pass to the RAM.
//////////////////////////////////////////////////////////////////////////////////
module DataController(InputData, MemData, AddOne, NewData);
	input [6:0] InputData;
	input [6:0] MemData;
	input AddOne;
	output [6:0] NewData;

	assign NewData = (AddOne == 0) ? InputData : MemData + 1;
endmodule
