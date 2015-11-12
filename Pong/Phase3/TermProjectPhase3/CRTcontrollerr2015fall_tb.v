`timescale 1ns / 1ps

module CRTcontroller2015fall_tb;
//change pixel clock to 10
	reg [9:0] Xresolution, Yresolution;
	reg [9:0] SystemClock;
	reg reset, clock;

	wire hsync, vsync;
	wire [9:0] xposition, yposition;
	wire PixelClock=uut.PixelClock;

	// Instantiate the Unit Under Test (UUT)
	CRTcontroller2015fall uut (
	Xresolution, Yresolution, SystemClock, hsync, vsync, xposition, yposition, reset, clock
	);

	initial begin
		// Initialize Inputs
		Xresolution = 5;
		Yresolution = 4;
		SystemClock = 50;
		reset = 0;
		clock=0;
	end
	always #1 clock=~clock;
	initial fork
	#0 reset=1; 	#5 reset=0; 
   #700 $stop;
	join
      
endmodule

