`timescale 1ns / 1ps
// File name	: DelayLoop.v
// Written by	: Jianjian Song
// Generate an elapse time that is controlled by
// Divider, i.e., the elapse time is Divider*(Clock Period).
// The counter is in reset state if MR==1 and Timeout==0.
// it will start counting when MR==0 until the count is 
// equal to Divider, which will set Timeout to "1".

module DelayLoop(MR,Timeout,Clock) ;
parameter	Divider = 250000;	//delay time in number of clock cycles
parameter 	NumberOfBits = 18;
input			MR, Clock;
output reg	Timeout;
reg 	[NumberOfBits-1:0]	count;
	
always @ (count)
	if(count==Divider) Timeout<=1;
	else Timeout<=0;
	
always @ (posedge Clock)
	if(MR==1)		begin count <= 0; end
	else if (count>=Divider)	count<=0;
		else count <= count+1'b1;
endmodule
