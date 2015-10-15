`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
// Date:     10/15/2015
// Summary:  Updates the address into the RAM
//////////////////////////////////////////////////////////////////////////////////
module RAMAddressUpdate(Clock, NextAddress, Reset, RAMaddress);
	input Clock, NextAddress, Reset;
	output [5:0] RAMaddress;
endmodule
