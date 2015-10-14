`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
// Description: This is a programmable RAM with load and increment.
//////////////////////////////////////////////////////////////////////////////////
module Lab4Part1TopLevel(Data,ClockIn,IncrementAddress,IncrementData,LoadData,Reset,ScrollEnable,Display,MemAddress,Transistors,Locked);
	input [6:0] Data;
	input ClockIn, IncrementAddress, IncrementData, LoadData, Reset, ScrollEnable;
	output [7:0] Display;
	output [5:0] MemAddress;
	output [3:0] Transistors;
	output Locked;

	wire Clock;
	wire DebouncedIncrementData;
	wire OneShottedIncrementData;
	wire [6:0] RAMDout;
	wire ControllerAddOne;
	wire [6:0] DataUnitNewData;
	wire WriteOrRead;
	wire DebouncedIncrementAddress;
	wire OneShottedIncrementAddress;
	wire ScrollTimerPulse;
	wire [3:0] Hundreds, Tens, Ones;
	wire [7:0] ThousandsSegments, HundredsSegments, TensSegments, OnesSegments;
	
	Clock35MHz Clock35HMzUnit(ClockIn,Clock,Locked);
	DebouncerWithoutLatch IncrementDataDebouncer(IncrementData,DebouncedIncrementData,Reset,Clock);
	ClockedOneShot IncrementDataOneShot(DebouncedIncrementData,OneShottedIncrementData,Reset,Clock);
	DataController DataUnit(Data,RAMDout,ControllerAddOne,DataUnitNewData);
	OverallController ManagerUnit(Clock,OneShottedIncrementData,LoadData,Reset,ControllerAddOne,WriteOrRead);
	DebouncerWithoutLatch IncrementAddressDebouncer(IncrementAddress,DebouncedIncrementAddress,Reset,Clock);
	RAM40x7bits MemoryUnit(MemAddress,DataUnitNewData,Clock,WriteOrRead,RAMDout);
	ScrollTimer AutoScrollTimer(Clock,ScrollEnable,Reset,ScrollTimerPulse);
	ClockedOneShot IncrementAddressOneShot(DebouncedIncrementAddress,OneShottedIncrementAddress,Reset,Clock);
	SplitDigits DataSplitter(RAMDout,Hundreds,Tens,Ones);
	BCDto7Segment DataThousands(4'd0,ThousandsSegments);
	BCDto7Segment DataHundreds(Hundreds,HundredsSegments);
	BCDto7Segment DataTens(Tens,TensSegments);
	BCDto7Segment DataOnes(Ones,OnesSegments);
	AddressManager AddressUnit(Clock,ScrollTimerPulse|OneShottedIncrementAddress,Reset,MemAddress);
	SevenSegDriver SevenSegUnit(ThousandsSegments,HundredsSegments,TensSegments,OnesSegments,Display,Reset,Clock,Transistors);
endmodule
