`timescale 1ns / 1ps
module MasterDataUnitI2C_tb;
	reg WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable;
	reg [7:0] SentData;
	reg StartStopAck, Reset, clock;
	reg [19:0] BaudRate;
	reg [29:0] ClockFrequency;
	wire [7:0] ReceivedData;
	wire SCL, SDA;
	wire ClockI2C=uut.ClockI2C;

	MasterDataUnitI2C uut(BaudRate,ClockFrequency,SentData,BaudEnable,clock,ReadorWrite,Reset,Select,ShiftorHold,StartStopAck,WriteLoad,ReceivedData,SCL,SDA);

	initial begin
		WriteLoad = 0;
		ReadorWrite = 0;
		ShiftorHold = 0;
		Select = 0;
		BaudEnable = 0;
		SentData = 0;
		StartStopAck = 0;
		Reset = 0;
		clock = 0;
		BaudRate = 0;
		ClockFrequency = 0;
	end
	
	
	always #4 clock=~clock;
	
	initial fork
		#0 Reset = 1; #13 Reset = 0;
		#0 BaudRate = 2;
		#0 ClockFrequency = 12;
		#0 WriteLoad = 0; #15 WriteLoad = 1; #23 WriteLoad = 0;
		#0 SentData = 8'b11001010;
		#0 Select = 0; #34 Select = 1; #484 Select = 0;
		#0 StartStopAck = 1; #21 StartStopAck = 0; #34 StartStopAck = 1; #484 StartStopAck = 0;
		#494 StartStopAck = 1;
		#0 BaudEnable = 0; #30 BaudEnable = 1; #484 BaudEnable = 0;
		#0 ReadorWrite = 0; #430 ReadorWrite = 1; #484 ReadorWrite = 0;
		#0 ShiftorHold = 0; #90 ShiftorHold = 1; #442 ShiftorHold = 0;
		#510 $stop;
	join
endmodule 