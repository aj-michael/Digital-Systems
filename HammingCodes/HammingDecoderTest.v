`timescale 1ns / 1ps
module HammingDecoderTest;
	reg [6:0] ReceivedHammingCode;
	wire [3:0] DecodedWord;

	HammingDecoder DUT1 (ReceivedHammingCode, DecodedWord);
	
	wire [2:0] syndrome = DUT1.syndrome;

	initial begin
	ReceivedHammingCode = 7'b0000000; #5; //0
	ReceivedHammingCode = 7'b0001011; #5; //1
	ReceivedHammingCode = 7'b0010101; #5; //2
	ReceivedHammingCode = 7'b0011110; #5; //3
	ReceivedHammingCode = 7'b0100110; #5; //4
	ReceivedHammingCode = 7'b0101101; #5; //5
	ReceivedHammingCode = 7'b0110011; #5; //6
	ReceivedHammingCode = 7'b0111000; #5; //7
	ReceivedHammingCode = 7'b1000111; #5; //8
	ReceivedHammingCode = 7'b1001100; #5; //9
	ReceivedHammingCode = 7'b1010010; #5; //10
	ReceivedHammingCode = 7'b1011001; #5; //11
	ReceivedHammingCode = 7'b1100001; #5; //12
	ReceivedHammingCode = 7'b1101010; #7; //13
	ReceivedHammingCode = 7'b1110100; #7; //14
	ReceivedHammingCode = 7'b1111111; #10; //15
	ReceivedHammingCode = 7'b1010100; #7; //14 bit 6 in error
	$monitor ("Number 14 with bit 6 in error.");
	ReceivedHammingCode = 7'b1001111; #7; //8 bit 3 in error
	ReceivedHammingCode = 7'b0011111; #7; //3 bit 0 in error
	ReceivedHammingCode = 7'b0111100; #7; //7 bit 2 in error
	ReceivedHammingCode = 7'b0001101; #7; //5 bit 5 in error
	ReceivedHammingCode = 7'b0100101; #7; //5 bit 3 in error
	ReceivedHammingCode = 7'b0101111; #7; //5 bit 1 in error
	$stop;
	end   
endmodule
