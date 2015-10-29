`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:			Rose-Hulman Institute of Technology
// Engineer: 		Adam and Mohammad
// Create Date:   14:23:58 10/29/2015 
// Design Name: 	Temperature reading module
// Module Name:   ReadTempI2C 
// Summary:			This module communicates via I2C with a thermometer and reports
//							the temperature.
//////////////////////////////////////////////////////////////////////////////////
module ReadTempI2C(BaudRate,ClockFrequency,FirstByte,Clock,Reset,Start,ReceivedData,Done,SCL,SDA);
	input [19:0] BaudRate;
	input [29:0] ClockFrequency;
	input [7:0] FirstByte;
	input Clock;
	input Reset;
	input Start;
	output [7:0] ReceivedData;
	output Done;
	output SCL;
	output SDA;
	
	wire BaudEnable;
	wire ReadOrWrite;
	wire Select;
	wire ShiftOrHold;
	wire StartStopAck;
	wire WriteLoad;

	ControllerReadTempI2C ControlUnit(Clock,SCL,Reset,SDA,Start,BaudEnable,Done,ReadOrWrite,Select,ShiftOrHold,StartStopAck,WriteLoad);
	MasterDataUnitI2C DataUnit(BaudRate,ClockFrequency,FirstByte,BaudEnable,Clock,ReadOrWrite,Reset,Select,ShiftOrHold,StartStopAck,WriteLoad,ReceivedData,SCL,SDA);
endmodule
