`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
// Date:     10/15/2015
// Summary:  The overall top module for Lab 4 Part 2
//////////////////////////////////////////////////////////////////////////////////
module lab4part2overall(NextAddress,Reset,DataIn,Clock,SendWrite,Mode,Locked,Display,Transistors,RAMaddress,Transmitting,tx);
	input NextAddress, Reset, Clock, SendWrite, Mode;
	input [6:0] DataIn;
	output Locked, Transmitting, tx;
	output [7:0] Display;
	output [3:0] Transistors;
	output [5:0] RAMaddress;
	
	wire DebouncedNextAddress;
	wire OneshotNextAddress;
	wire DebouncedSendWrite;
	wire OneshotSendWrite;
	wire [6:0] RAMDout;
	wire RAMShouldRead;
	wire [7:0] Bit3_0out;
	wire [7:0] Bit7_4out;
	wire ClockOut;
	wire [5:0] ModeControllerNumberOfChars;
	wire write_to_uart;
	wire [5:0] UpdatedRAMAddress;
	wire [5:0] SendCharsRAMAddress;
	wire tx_buffer_full;
	wire tx_buffer_half_full;
	wire UARTClock;
	
	parameter baudRate = 20'd38400;
	parameter clockFrequency = 30'd70000000;
	
	Clock70MHz Clock70MHzUnit(Clock,ClockOut,Locked);
	//module DebouncerWithoutLatch(InputPulse, DebouncedOuput, Reset, CLOCK) ;

	DebouncerWithoutLatch NextDebounceUnit(NextAddress,DebouncedNextAddress,Reset,ClockOut);
	ClockedOneShot NextOneShot(DebouncedNextAddress,OneshotNextAddress,Reset,ClockOut);
	RAM40x7bits RAMUnit(RAMaddress,DataIn,ClockOut,Reset,RAMShouldRead,RAMDout);
	HEXto7Segment Bit3_0Unit(RAMDout[3:0],Bit3_0out);
	HEXto7Segment Bit7_4Unit({1'b0,RAMDout[6:4]},Bit7_4out);
	DebouncerWithoutLatch SendDebounceUnit(SendWrite,DebouncedSendWrite,Reset,ClockOut);
	ClockedOneShot SendOneShot(DebouncedSendWrite,OneshotSendWrite,Reset,ClockOut);
	SevenSegDriver DisplayUnit(8'b11111111,8'b11111111,Bit7_4out,Bit3_0out,Display,Reset,ClockOut,Transistors);
	RAMAddressUpdate UpdateAddress(ClockOut,OneshotNextAddress,Reset,UpdatedRAMAddress);
	ModeController ModeUnit(DataIn,SendCharsRAMAddress,UpdatedRAMAddress,Mode,OneshotSendWrite,ModeControllerNumberOfChars,RAMaddress,RAMShouldRead);
	SendChars SendCharsUnit(ModeControllerNumberOfChars,ClockOut,Reset,Mode&OneshotSendWrite,tx_buffer_full,UARTClock,SendCharsRAMAddress,Transmitting,write_to_uart);
	uart_tx TransmitUnit({1'b0,RAMDout},write_to_uart,1'b0,UARTClock,tx,tx_buffer_full,tx_buffer_half_full,ClockOut);
	BaudRateGenerator BaudRateUnit(UARTClock,Reset,ClockOut,baudRate,clockFrequency);
endmodule
