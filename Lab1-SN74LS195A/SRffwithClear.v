`timescale 1ns / 1ps
//Gate level implementation of SR flip-flop with asynchrnous active-low clear
//Author: Jianjian Song
//Date: August 20, 2012
//ECE333, Fall 2012
module SRffwithClear(
input S, R, Clock, Clear,
output Q
);

wire w12, w23, w56, w26, w62;
wire w93, w67, w34, w48, w84, w78;

nand U1 (w12,S,Clock);
nand #1 U2 (w26, w12, w62);
nand U3 (w34,w26, w93, Clear);
nand U4 (Q,w34,w84);
nand U5 (w56, Clock, R);
nand #1 U6 (w62, w26, w56);
nand U7 (w78, w62, w93);
nand U8 (w84, w78, Q, Clear);
not  U9 (w93, Clock);

endmodule
