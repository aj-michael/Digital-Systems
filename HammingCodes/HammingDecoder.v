`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// 
// Create Date:    19:56:24 09/18/2015 
// Design Name:    Hamming(7,4) Decoder
// Module Name:    HammingDecoder 
//////////////////////////////////////////////////////////////////////////////////
module HammingDecoder(code, data);
	input [6:0] code;
	output [3:0] data;
	
	wire [2:0] syndrome;		// Name from Wikipedia

	assign syndrome[2] = code[6] ^ code[5] ^ code[4] ^ code[2];
	assign syndrome[1] = code[6] ^ code[5] ^ code[3] ^ code[1];
	assign syndrome[0] = code[6] ^ code[4] ^ code[3] ^ code[0];
	assign data = (syndrome == 3'b111) ? { ~code[6], code[5], code[4], code[3] } :
					  (syndrome == 3'b110) ? { code[6], ~code[5], code[4], code[3] } :
					  (syndrome == 3'b101) ? { code[6], code[5], ~code[4], code[3] } :
					  (syndrome == 3'b011) ? { code[6], code[5], code[4], ~code[3] } :
					  { code[6], code[5], code[4], code[3] };
endmodule
