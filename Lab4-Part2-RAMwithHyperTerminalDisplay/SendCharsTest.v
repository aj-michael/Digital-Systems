`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
// Date:     10/22/2015
// Design Name:   SendChars
////////////////////////////////////////////////////////////////////////////////
module SendCharsTest;
	reg [5:0] NumberOfChars;
	reg Clock, Reset, Start, tx_full, uartClock;
	
	wire [5:0] RAMAddress;
	wire Transmitting, write_to_uart;

	SendChars uut (
		.NumberOfChars(NumberOfChars), 
		.Clock(Clock), 
		.Reset(Reset), 
		.Start(Start), 
		.tx_full(tx_full), 
		.uartClock(uartClock), 
		.RAMAddress(RAMAddress), 
		.Transmitting(Transmitting), 
		.write_to_uart(write_to_uart)
	);
	
	always #5 Clock = ~Clock;
	always #21 uartClock = ~uartClock;

	initial begin
		NumberOfChars = 0; Clock = 0; Reset = 1; Start = 0; tx_full = 0; uartClock = 0; #10;
		Reset = 0; # 10;
		NumberOfChars = 10; #10;
		Start = 1; #10;
		Start = 0; #250;
		tx_full = 1; #100;
		tx_full = 0; #200;
		$stop;
	end
      
endmodule

