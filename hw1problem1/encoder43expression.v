`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// 
// Create Date:    15:27:11 09/12/2015 
// Design Name:    Expression-level implementation of 4:3 encoder.
// Module Name:    encoder43expression 
//////////////////////////////////////////////////////////////////////////////////
module encoder43expression(A, B, C, D, Y2, Y1, Y0);
	input A, B, C, D;
	output Y2, Y1, Y0;
	
	assign Y2 = A&B&C&D;
	assign Y1 = (~A&B&D)|(A&B&~C)|(A&~B&D)|(A&~B&C)|(~A&C&D)|(B&C&~D);
	assign Y0 = (~A&~B&~C&D)|(~A&~B&C&~D)|(~A&B&~C&~D)|(A&~B&~C&~D)|(~A&B&C&D)|(A&~B&C&D)|(A&B&~C&D)|(A&B&C&~D);
endmodule
