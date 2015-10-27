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
	wire buffer_half_full;
	wire write_to_uart;
	wire [6:0] dout;
	wire baudout;
	parameter baudrate = 20'd38400;
	parameter frequency = 30'd70000000;

	Clock70MHz ClockUnit(Clock,ClockOut,Locked);
	SendChars SendCharsUnit(NumberOfChars,ClockOut,Reset,OneshotSend,buffer_full,baudout,RAMaddress,Transmitting,write_to_uart);
	uart_tx TransmitUnit({1'b0, dout},write_to_uart,1'b0,baudout,tx,buffer_full,buffer_half_full,ClockOut);
	RAM40x7bits RAMUnit(RAMaddress,7'd0,ClockOut,Reset,1'b0,dout);
	BaudRateGenerator BaudRateUnit(baudout,Reset,ClockOut,baudrate,frequency);
	ClockedOneShot PrintOneShot(DebouncedSend,OneshotSend,Reset,ClockOut);
	DebouncerWithoutLatch PrintDebounceUnit(Send,DebouncedSend,Reset,ClockOut);
	//module BaudRateGenerator (uartClock, Reset, clock, BaudRate, ClockFrequency);
	//module uart_tx (
//input [7:0]  data_in,
//input        write_buffer,
//input        reset_buffer,
//input        en_16_x_baud,
//output       serial_out,
//output       buffer_full,
//output       buffer_half_full,
//input        clk);
endmodule
