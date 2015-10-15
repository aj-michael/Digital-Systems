`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
// Date:     10/15/2015
// Summary:  Determines the RAM operation mode
//////////////////////////////////////////////////////////////////////////////////
module ModeController(DataIn, RAMaddressSend, RAMaddressUpdate, Mode, WriteOrReadSend, NumberOfChars, RAMaddress, WriteOrRead);
	input [6:0] DataIn;
	input [5:0] RAMaddressSend;
	input [5:0] RAMaddressUpdate;
	input Mode;
	input WriteOrReadSend;
	output [5:0] NumberOfChars;
	output [5:0] RAMaddress;
	output WriteOrRead;
endmodule
