`timescale 1ns / 1ps

module BaudRateGeneratorI2C_tb;

	// Inputs
	reg Enable;
	reg Reset;
	reg clock;
	reg [19:0] BaudRate;
	reg [29:0] ClockFrequency;

	// Outputs
	wire ClockI2C;

	// Instantiate the Unit Under Test (UUT)
	BaudRateGeneratorI2C uut (
		.Enable(Enable), 
		.ClockI2C(ClockI2C), 
		.Reset(Reset), 
		.clock(clock), 
		.BaudRate(BaudRate), 
		.ClockFrequency(ClockFrequency)
	);

	initial begin  Enable = 0;  Reset = 0;  clock = 0;  BaudRate = 2;  ClockFrequency = 10; end
	always #4 clock = ~ clock;
	
	initial fork
	#0 Reset = 0; #12 Reset = 1; #19 Reset = 0; 
	#0 Enable = 0;  #23 Enable = 1;  #89 Enable = 0;  #120 Enable = 1;
	#300 $stop;
	join
      
endmodule
