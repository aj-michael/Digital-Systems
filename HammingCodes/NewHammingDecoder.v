`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// 
// Create Date:    17:28:36 09/26/2015 
// Design Name:    Short Hamming Decoder
// Module Name:    NewHammingDecoder 
//////////////////////////////////////////////////////////////////////////////////
module NewHammingDecoder(H, D);
	input [6:0] H;
	output [3:0] D;
	
	//assign D[3] =
	//assign D[2] =
	//assign D[1] = 
	assign D[3] = (H[6]^H[5]^H[4]^H[2])&(H[6]^H[5]^H[3]^H[1])&(H[6]^H[4]^H[3]^H[0])  ? ~H[6] : H[6];
	assign D[2] = (H[6]^H[5]^H[4]^H[2])&(H[6]^H[5]^H[3]^H[1])&!(H[6]^H[4]^H[3]^H[0]) ? ~H[5] : H[5];
	assign D[1] = (H[6]^H[5]^H[4]^H[2])&!(H[6]^H[5]^H[3]^H[1])&(H[6]^H[4]^H[3]^H[0]) ? ~H[4] : H[4];
	assign D[0] = !(H[6]^H[5]^H[4]^H[2])&(H[6]^H[5]^H[3]^H[1])&(H[6]^H[4]^H[3]^H[0]) ? ~H[3] : H[3];

//	assign syndrome[2] = code[6] ^ code[5] ^ code[4] ^ code[2];
//	assign syndrome[1] = code[6] ^ code[5] ^ code[3] ^ code[1];
//	assign syndrome[0] = code[6] ^ code[4] ^ code[3] ^ code[0];
//	assign data = (syndrome == 3'b111) ? { ~code[6], code[5], code[4], code[3] } :
//					  (syndrome == 3'b110) ? { code[6], ~code[5], code[4], code[3] } :
//					  (syndrome == 3'b101) ? { code[6], code[5], ~code[4], code[3] } :
//					  (syndrome == 3'b011) ? { code[6], code[5], code[4], ~code[3] } :
//					  { code[6], code[5], code[4], code[3] };

endmodule
