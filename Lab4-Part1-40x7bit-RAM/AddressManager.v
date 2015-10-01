`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
//////////////////////////////////////////////////////////////////////////////////
module AddressManager(Clock, IncrementAddress, Reset, Address);
	input Clock, IncrementAddress, Reset;
	output reg [5:0] Address;

	initial Address = 6'b0;
	always@(posedge Clock)
		if (Reset == 1) Address <= 6'b0;
		else if (IncrementAddress == 1 & Address == 29) Address <= 0;
		else if (IncrementAddress == 1) Address <= Address + 1;
endmodule
