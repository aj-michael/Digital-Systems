`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// 
// Create Date:    17:19:44 09/26/2015 
// Design Name:    Short Hamming Encoder
// Module Name:    NewHammingEncoder 
//////////////////////////////////////////////////////////////////////////////////
module NewHammingEncoder(data, code);
	input [3:0] data;
	output [6:0] code;
	assign code = { data, data[1]^data[2]^data[3], data[0]^data[2]^data[3], data[0]^data[1]^data[3] };
endmodule
