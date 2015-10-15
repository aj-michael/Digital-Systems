`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
// Date:     10/15/2015
// Summary:  Sends chars via UART to HyperTerminal
//////////////////////////////////////////////////////////////////////////////////
module SendChars(NumberOfChars, Clock, Reset, Start, tx_full, uartClock, RAMAddress, Transmitting, write_to_uart);
	input [5:0] NumberOfChars;
	input Clock, Reset, Start, tx_full, uartClock;
	output [5:0] RAMAddress;
	output Transmitting, write_to_uart;
endmodule
