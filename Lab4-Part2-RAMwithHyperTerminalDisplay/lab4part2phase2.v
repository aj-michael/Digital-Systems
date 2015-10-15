`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
// Date:     10/15/2015
// Summary:  The second phase of Lab 4
//////////////////////////////////////////////////////////////////////////////////
module lab4part2phase2(NumberOfChars, Clock, Reset, Send, RAMaddress, Locked, Transmitting, tx);
	input [5:0] NumberOfChars;
	input Clock, Reset, Send;
	output [5:0] RAMaddress;
	output Locked, Transmitting, tx;

	wire ClockOut;
	wire DebouncedSend;
	wire OneshotSend;
	wire buffer_full;
	wire write_to_uart;

	Clock70MHz ClockUnit(Clock,ClockOut,Locked);
	SendChars SendCharsUnit(NumberOfChars,ClockOut,Reset,OneshotSend,buffer_full,baud_clk,RAMaddress,Transmitting,write_to_uart);
	uart_tx TransmitUnit();
	RAM40x7bits RAMUnit();
	BaudRateGenerator BaudRateUnit();
	ClockedOneShot PrintOneShot(DebouncedSend,OneshotSend,Reset,ClockOut);
	DebouncerWithoutLatch PrintDebounceUnit(Send,DebouncedSend,Reset,ClockOut);
endmodule
