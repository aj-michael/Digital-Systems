`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
// Date:     October 15, 2015
// Summary:  The top level module for Phase 1
//////////////////////////////////////////////////////////////////////////////////
module lab4part2phase1(DataIn, Clock, NextAddress, Reset, WriteOrRead, Display, RAMaddress, Transistors, Locked);
	input [6:0] DataIn;
	input Clock, NextAddress, Reset, WriteOrRead;
	output [7:0] Display;
	output [5:0] RAMaddress;
	output [3:0] Transistors;
	output Locked;
	
	wire UpdateAddressAddress;
	wire DebouncedNextAddress;
	wire OneshotNextAddress;
	wire [6:0] RAMUnitDout;
	wire ClockOut;
	wire [7:0] segDout;
	wire [7:0] segZero;
	
	RAM40x7bits RAMUnit(UpdateAddressAddress,DataIn,ClockOut,WriteOrRead,RAMUnitDout);
	HEXto7Segment Bit3_0Unit(RAMUnitDout,segDout);
	Clock70MHz ClockUnit(Clock,ClockOut,Locked);
	HEXto7Segment Bit7_4Unit(7'b0,segZero);
	DebouncerWithoutLatch PrintDebounceUnit(NextAddress,DebouncedNextAddress,Reset,ClockOut);
	ClockedOneShot PrintOneShot(DebouncedNextAddress,OneshotNextAddress,Reset,ClockOut);
	SevenSegDriver DisplayUnit();
	RAMAddressUpdate UpdateAddress(ClockOut,OneshotNextAddress,Reset,UpdateAddressAddress);
endmodule
