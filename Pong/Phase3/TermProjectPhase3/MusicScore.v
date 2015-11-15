`timescale 1ns / 1ps
//Music score in RAM
module MusicScore(ReadOrWrite, Address, KeyInput, KeyOutput, TimeInput, TimeOutput,Clock, Reset, Choice);
input ReadOrWrite, Clock, Reset;
parameter DataLength=4;
input [DataLength-1:0] KeyInput, TimeInput;
output reg [DataLength-1:0] KeyOutput, TimeOutput;
parameter AddressBits=5;
input [AddressBits-1:0] Address;
parameter MemorySize=40;
input [1:0] Choice;

parameter Music1 = 0;
parameter Music2 = 12;
parameter Music3 = 24;

wire [3:0] MusicOffset;
assign MusicOffset = Choice[1] ? Music3 : (Choice[0]? Music1 : Music2);

reg [DataLength-1:0] Keys [0:MemorySize-1];
reg [DataLength-1:0] Times [0:MemorySize-1];
//stores key number and its time duration
always@(posedge Clock or posedge Reset)
	if(Reset==1) begin
		Keys[0]<=1; Times[0]<=4;
		Keys[1]<=0; Times[1]<=0;
		Keys[2]<=3; Times[2]<=1;
		Keys[3]<=3; Times[3]<=2;
		Keys[4]<=2; Times[4]<=3;
		Keys[5]<=1; Times[5]<=1;
		Keys[6]<=1; Times[6]<=1;
		Keys[7]<=2; Times[7]<=1;
		Keys[8]<=3; Times[8]<=1;
		Keys[9]<=2; Times[9]<=1;
		Keys[10]<=1; Times[10]<=2;
		Keys[11]<=0; Times[11]<=0;
		Keys[12]<=2; Times[12]<=4;
		Keys[13]<=0; Times[13]<=0;
		Keys[14]<=3; Times[14]<=2;
		Keys[15]<=1; Times[15]<=1;
		Keys[16]<=2; Times[16]<=1;
		Keys[17]<=1; Times[17]<=1;
		Keys[18]<=3; Times[18]<=4;
		Keys[19]<=2; Times[19]<=1;
		Keys[20]<=2; Times[20]<=1;
		Keys[21]<=3; Times[21]<=1;
		Keys[22]<=2; Times[23]<=1;
		Keys[23]<=0; Times[23]<=0;
		Keys[24]<=3; Times[24]<=4;
		Keys[25]<=0; Times[25]<=0;
		Keys[26]<=1; Times[26]<=1;
		Keys[27]<=3; Times[27]<=3;
		Keys[28]<=2; Times[28]<=3;
		Keys[29]<=3; Times[29]<=1;
		Keys[30]<=3; Times[30]<=1;
		Keys[31]<=2; Times[31]<=1;
		Keys[32]<=2; Times[32]<=4;
		Keys[33]<=3; Times[33]<=1;
		Keys[34]<=2; Times[34]<=1;
		Keys[35]<=1; Times[35]<=1;
		Keys[36]<=2; Times[36]<=4;
		Keys[37]<=0; Times[37]<=0;
	end
	else if (ReadOrWrite==1) begin	//read memory
		KeyOutput<=Keys[Address+MusicOffset]; TimeOutput<=Times[Address+MusicOffset];
	end
	else begin
		Keys[Address]<=KeyInput; Times[Address]<=TimeInput;
	end
endmodule
