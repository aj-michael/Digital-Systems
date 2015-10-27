`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
// Date:     10/15/2015
// Summary:  Updates the address into the RAM
//////////////////////////////////////////////////////////////////////////////////
module RAMAddressUpdate(Clock, NextAddress, Reset, RAMaddress);
	input Clock, NextAddress, Reset;
	output reg [5:0] RAMaddress;
	
	always @ (posedge Clock or posedge Reset)
	if (Reset == 1) RAMaddress <= 0;
	else if (NextAddress) RAMaddress <= RAMaddress + 1;
endmodule
