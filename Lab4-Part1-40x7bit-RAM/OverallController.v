`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
//////////////////////////////////////////////////////////////////////////////////
module OverallController(Clock, IncrementData, LoadData, Reset, AddOne, WriteOrRead);
	input Clock, IncrementData, LoadData, Reset;
	output AddOne, WriteOrRead;
endmodule
