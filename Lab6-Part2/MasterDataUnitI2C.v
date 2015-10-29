`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  		Rose-Hulman Institute of Technology
// Engineer: 		Adam and Mohammad
// Create Date:   20:16:03 10/24/2015 
// Design Name: 	The top-level data unit of the design
// Module Name:   MasterDataUnitI2C 
// Summary:			This holds all of the data that is read and written.
//////////////////////////////////////////////////////////////////////////////////
module MasterDataUnitI2C(BaudRate,ClockFrequency,SentData,BaudEnable,Clock,ReadOrWrite,Reset,Select,ShiftOrHold,StartStopAck,WriteLoad,ReceivedData,SCL,SDA);
	input [19:0] BaudRate;			// up to 1000000
	input [29:0] ClockFrequency;	// up to 1GHz
	input [LENGTH-1:0] SentData;
	input BaudEnable;
	input Clock;
	input ReadOrWrite;
	input Reset;
	input Select;
	input ShiftOrHold;
	input StartStopAck;
	input WriteLoad;
	output [LENGTH-1:0] ReceivedData;
	output SCL;
	inout SDA;
	
	parameter LENGTH = 8;
	
	assign SCL = ClockI2C;
	wire ClockI2C;
	
	BaudRateGeneratorI2C BaudUnit(BaudEnable,ClockI2C,Reset,Clock,BaudRate,ClockFrequency);
	
	wire ShiftDataIn, ShiftDataOut;
	ShiftRegisterI2C2015fall ShiftUnit(SentData,Clock,Reset,ShiftDataIn,ShiftOrHold,WriteLoad,ReceivedData,ShiftDataOut,ClockI2C);
	
	SDAmodule SDAUnit(SDA,ReadOrWrite,Select,StartStopAck,ShiftDataIn,ShiftDataOut);
endmodule
