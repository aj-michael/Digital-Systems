`timescale 1ns / 1ps

module lab6phase1I2C2015fall_tb;

	reg Go, Reset, clock;

	wire SCL, ClockLocked;
	wire [2:0] State=uut.ControlUnit.State;
	wire [2:0] NextState=uut.ControlUnit.NextState;
	wire ControlClock=uut.ControlUnit.Clock;
	wire ClockI2C=uut.ControlUnit.ClockI2C;
	wire BaudEnable=uut.ControlUnit.BaudEnable;
	wire StartStopAck=uut.ControlUnit.StartStopAck;
	wire ShiftOrHold=uut.DataUnit.ShiftOrHold;
	
	wire SDA;

	lab6phase1I2C2015fall uut(1'b0,Go,Reset,ClockLocked,SCL,SDA);
	
	assign uut.ClockOut=clock;
	defparam uut.ControlUnit.Timer.Divider=2;
	defparam uut.BaudRate=3;
	defparam uut.ClockFrequency=12;

	
	wire Timeout=uut.ControlUnit.Timeout;
	wire [3:0] DataCounter = uut.ControlUnit.DataCounter;
	
	wire [15:0] baud_count = uut.DataUnit.BaudUnit.baud_count;

	initial begin Go = 0;  Reset = 0;  clock = 0; end
	always #4 clock=~clock;
	initial fork
	#0 Reset=1;  #12 Reset=0;
	#0 Go=0;  #21 Go=1;     #61 Go=0;   #470 Go=1;  #479 Go=0;
	#600 $stop;
	join
      
endmodule
