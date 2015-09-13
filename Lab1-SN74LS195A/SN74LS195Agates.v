`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// 
// Create Date:    20:40:34 09/08/2015 
// Design Name:    SN74LS195A Gate Level Module
// Module Name:    SN74LS195Agates 
//////////////////////////////////////////////////////////////////////////////////
module SN74LS195Agates(Q, P, Q3not, PE, J, K, CP, MR);
	parameter LENGTH = 4;
	input PE, J, K, CP, MR;
	input [LENGTH-1:0] P;
	output [LENGTH-1:0] Q;
	output Q3not;
	wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;
	wire w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21;
	wire Ki, PEi, CPi;
	wire Clear;
	
	not N1(Ki, K);
	not N2(PEi, PE);
	not N3(CPi, CP);
	buf B1(Clear, MR);

	and U1(w1, w18, J, PE);
	and U2(w2, PE, K, Q[0]);
	and U3(w3, PEi, P[0]);
	and U4(w4, Q[0], PE);
	and U5(w5, PEi, P[1]);
	and U6(w6, Q[1], PE);
	and U7(w7, PEi, P[2]);
	and U8(w8, Q[2], PE);
	and U9(w9, PEi, P[3]);
	
	nor U10(w10, w1, w2, w3);
	nor U11(w11, w4, w5);
	nor U12(w12, w6, w7);
	nor U13(w13, w8, w9);
	
	not U14(w14, w10);
	not U15(w15, w11);
	not U16(w16, w12);
	not U17(w17, w13);
	
	not U18(w18, Q[0]);
	not U19(Q3not, Q[3]);

	SRffwithClear RS0(w14, w10, CPi, MR, Q[0]);
	SRffwithClear RS1(w15, w11, CPi, MR, Q[1]);
	SRffwithClear RS2(w16, w12, CPi, MR, Q[2]);
	SRffwithClear RS3(w17, w13, CPi, MR, Q[3]);
endmodule
