`timescale 1ns / 1ps
module ControllerReadTempI2C_tb;
	reg Go, SDA, Reset, ClockI2C, clock;
	wire WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck,DONE;
	wire [3:0] State=uut.State;
	wire [3:0] DataCounter=uut.DataCounter;
	wire TimeOut=uut.TimeOut, ACKbit=uut.ACKbit;
	wire OneShotPositive=uut.OneShotPositive, OneShotNegative=uut.OneShotNegative;

	ControllerReadTempI2C uut(Clock,ClockI2C,Reset,SDA,Go,BaudEnable,DONE,ReadorWrite,Select,ShiftorHold,StartStopAck,WriteLoad);

	initial begin Go = 0; Reset = 0; ClockI2C = 0; clock = 0; end

	always #4 clock=~clock;
	always #12 ClockI2C=~ClockI2C;

	initial fork
		#0 Go = 0; #12 Go = 1;
		#0 Reset = 1; #6 Reset = 0;
		#0 SDA=0; #13 SDA=1; #25 SDA=0; #56 SDA=1; #134 SDA=0; #189 SDA=1; #300 SDA=0;
		#850 $stop;
	join
endmodule