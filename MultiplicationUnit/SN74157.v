`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// 
// Create Date:    18:25:01 09/26/2015 
// Design Name:    SN74157 Multiplexer
// Module Name:    SN74157
//////////////////////////////////////////////////////////////////////////////////
module SN74157(A1,A0,B1,B0,C1,C0,D1,D0,EN,SEL,QA,QB,QC,QD);
	input A1, A0, B1, B0, C1, C0, D1, D0;
	input EN, SEL;
	output QA, QB, QC, QD;
	assign QA = SEL == 1'b1 ? A1 : A0;
	assign QB = SEL == 1'b1 ? B1 : B0;
	assign QC = SEL == 1'b1 ? C1 : C0;
	assign QD = SEL == 1'b1 ? D1 : D0;
endmodule
