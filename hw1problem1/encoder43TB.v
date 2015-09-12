`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
//
// Create Date:   15:44:08 09/12/2015
// Design Name:   4:3 Encoder
// Module Name:   C:/Users/adam/Documents/GitHub/Digital Systems/hw1problem1/encoder43TB.v
// Project Name:  hw1problem1
////////////////////////////////////////////////////////////////////////////////
module encoder43TB;
	reg A, B, C, D;
	wire [2:0] Ygates, Yexpression, Ytable;

	encoder43gates Encoder43Gates(A, B, C, D, Ygates[2], Ygates[1], Ygates[0]);
	encoder43expression Encoder43Expression(A, B, C, D, Yexpression[2], Yexpression[1], Yexpression[0]);
	encoder43table Encoder43Table(A, B, C, D, Ytable[2], Ytable[1], Ytable[0]);

	initial fork
		#0 A = 0;
		#0 B = 0;
		#0 C = 0;
		#0 D = 0;
		
		#1 A = 0;
		#1 B = 0;
		#1 C = 1;
		#1 D = 0;
		
		#2 A = 0;
		#2 B = 0;
		#2 C = 0;
		#2 D = 1;
		
		#3 A = 0;
		#3 B = 0;
		#3 C = 1;
		#3 D = 1;
		
		#4 A = 0;
		#4 B = 1;
		#4 C = 0;
		#4 D = 0;
		
		#5 A = 0;
		#5 B = 1;
		#5 C = 1;
		#5 D = 0;
		
		#6 A = 0;
		#6 B = 1;
		#6 C = 0;
		#6 D = 1;
		
		#7 A = 0;
		#7 B = 1;
		#7 C = 1;
		#7 D = 1;
		
		#8 A = 1;
		#8 B = 0;
		#8 C = 0;
		#8 D = 0;
		
		#9 A = 1;
		#9 B = 0;
		#9 C = 1;
		#9 D = 0;
		
		#10 A = 1;
		#10 B = 0;
		#10 C = 0;
		#10 D = 1;
		
		#11 A = 1;
		#11 B = 0;
		#11 C = 1;
		#11 D = 1;
		
		#12 A = 1;
		#12 B = 1;
		#12 C = 0;
		#12 D = 0;
		
		#13 A = 1;
		#13 B = 1;
		#13 C = 1;
		#13 D = 0;
		
		#14 A = 1;
		#14 B = 1;
		#14 C = 0;
		#14 D = 1;
		
		#15 A = 1;
		#15 B = 1;
		#15 C = 1;
		#15 D = 1;
		
		#16 $stop;
	join
endmodule
