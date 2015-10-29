//File Name: lab6phase2I2C2015.v
//Author: Jianjian Song
//Date: October 27, 2015
//ECE333 Fall 2015
//ChipSelect is the lower 3-bit address of TM101
//Read one of TMP101 temperature sensor
//send first byte to I2C bus with slave address
//Receive first byte from I2C bus as temperature
//Display the 8-bit temperatue in Celsius on LEDs LD7-0
//Display 2-digit temperature in Fahrenheit and 2-digit in Celsius
//on 4-digit 7-segment display
module lab6phase2I2C2015(ChipSelect,Start,Mode,ReceivedData,SCL,SDA,Reset,SystemClock,ClockLocked,DONE,Display,Transistors);
	input Reset, Mode, SystemClock, Start;
	input [2:0] ChipSelect;
	output SCL, ClockLocked, DONE;
	inout SDA;
	output [7:0] ReceivedData;
	output [3:0] Transistors;
	output [7:0] Display;

	parameter BaudRate=20'd40000, ClockFrequency=30'd65000000;
	parameter FirstByte = 8'b10010011;

	wire clock;
	//simulation parameter
	//parameter BaudRate=2, ClockFrequency=12;
	SystemClockUnit Clock65MHz(SystemClock,clock,ClockLocked);
	ClockedPositiveOneShot StartOneShot(Start, StartReading, Reset, clock) ;
	wire [7:0] Chip;
	wire WriteLoad, ReadorWrite, ShiftorHold, Select, BaudEnable, StartStopAck;
	//module ReadTempI2C2015fall(Start, Address, ReceivedData, Done, SCL, SDA,
	 //BaudRate, ClockFrequency, Reset, clock);
	assign Chip = {4'b1001,ChipSelect,1'b1};
	ReadTempI2C ReadUnit(BaudRate,ClockFrequency,FirstByte,clock,Reset,StartReading||Mode,ReceivedData,DONE,SCL,SDA);

	wire [3:0] First1, First0, Second1, Second0;
	wire [7:0] F1code,F0code,S1code,S0code;
	reg [7:0] Temperature;
	
	always@(posedge clock)
		if(DONE==1) Temperature<=ReceivedData;
		else Temperature<=Temperature;

	OneTemperatureConverter ConvertUnit(Temperature, First1, First0, Second1, Second0);
	BCDto7Segment F1Unit(First1,F1code);
	BCDto7Segment F0Unit(First0,F0code);
	BCDto7Segment C1Unit(Second1,S1code);
	BCDto7Segment C0Unit(Second0,S0code);
	//7-segment display
	//module SevenSegDriver(D3, D2, D1, D0, Display, Reset, Clock, Select);
	SevenSegDriver DisplayUnit(F1code,F0code,S1code,S0code,Display,Reset,clock,Transistors);
endmodule