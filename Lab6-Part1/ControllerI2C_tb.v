`timescale 1ns / 1ps
module ControllerI2C_tb;
	reg Go,Reset,ClockI2C,clock;
	wire WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck;
	wire [2:0] State=uut.State;
	wire [3:0] DataCounter=uut.DataCounter;
	wire Timeout=uut.Timeout;
	wire OneShotI2C = uut.OneShotI2C;

	ControllerI2C uut(clock,ClockI2C,Go,Reset,BaudEnable,ReadorWrite,Select,ShiftorHold,StartStopAck,WriteLoad);
	
	defparam uut.Timer.Divider = 2;
	
	initial begin Go = 0; Reset = 0; ClockI2C = 0; clock = 0; end
	
	always #4 clock = ~clock;
	always #12 ClockI2C = ~ClockI2C;
	
	initial fork
		#0 Go = 0; #12 Go = 1;
		#0 Reset = 1; #6 Reset = 0;
		#310 $stop;
	join
 endmodule 