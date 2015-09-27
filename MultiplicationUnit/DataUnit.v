`timescale 1ns / 100ps

// File name	: p3hw3fall2015DataUnit.v
// Jianjian Song
// Data Unit of a 4-bit serial multiplier with adder and shift regissters
module DataUnit(Product, Multiplicant, Multiplier, Shift1, Shift0, reset, clock);
	input	clock, reset;
	input [3:0] Multiplicant, Multiplier;
	input [2:0] Shift1, Shift0;
	output [7:0] Product;

	//Multiplier shift register
	wire [3:0] MultiplierOut;
	SN74194 MultiplierRegister(Multiplier,MultiplierOut,1'b0,1'b0,Shift1[2],Shift0[2],reset,clock);
	SN74157 MultiplicantMux(Multiplicant[3],1'b0,Multiplicant[2],1'b0,Multiplicant[1],1'b0,Multiplicant[0],1'b0,1'b0,MultiplierOut[0],QA,QB,QC,QD);

	//upper product
	wire [3:0] Sum;
	reg CarryOut;
	SN74194 UpperProductRegister(Sum,Product[7:4],1'b0,CarryOut,Shift1[1],Shift0[1],reset,clock);
	
	//lower product
	SN74194 LowerProductRegister(4'd0,Product[3:0],1'b0,Product[4],Shift1[0],Shift0[0],reset,clock);
	
	wire CO;
	SN7483 Adder({QA,QB,QC,QD},Product[7:4],1'b0,CO,Sum);

	always@(posedge clock or negedge reset)
		if(reset==0) CarryOut<=0;
		else CarryOut<=CO;
endmodule
