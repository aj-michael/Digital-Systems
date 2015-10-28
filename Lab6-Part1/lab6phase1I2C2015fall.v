`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  		Rose-Hulman Institute of Technology
// Engineer: 		Adam and Mohammad
// Create Date:	20:04:56 10/24/2015 
// Design Name: 	Phase 1 Top Level Module
// Module Name:   lab6phase1I2C2015fall 
// Summary:			This module connects the controller and the master data unit together.
//////////////////////////////////////////////////////////////////////////////////
module lab6phase1I2C2015fall(Clock,Go,Reset,ClockLocked,SCL,SDA);
	input Clock, Go, Reset;
	output ClockLocked, SCL, SDA;
	
	wire ClockOut;
	wire ControllerBaudEnable;
	wire ControllerReadOrWrite;
	wire ControllerSelect;
	wire ControllerShiftOrHold;
	wire ControllerStartStopAck;
	wire ControllerWriteLoad;

	parameter BaudRate = 20'd40000;
	parameter ClockFrequency = 30'd65000000;
	parameter FirstByte = 8'b10101101;
	
	// Unconnected outputs
	wire [7:0] DataUnitReceivedData;

	ControllerI2C ControlUnit(ClockOut,SCL,Go,Reset,ControllerBaudEnable,ControllerReadOrWrite,ControllerSelect,ControllerShiftOrHold,ControllerStartStopAck,ControllerWriteLoad);
	MasterDataUnitI2C DataUnit(BaudRate,ClockFrequency,FirstByte,ControllerBaudEnable,ClockOut,ControllerReadOrWrite,Reset,ControllerSelect,ControllerShiftOrHold,ControllerStartStopAck,ControllerWriteLoad,DataUnitReceivedData,SCL,SDA);
	Clock65MHz SystemClock(Clock,ClockOut,ClockLocked);
endmodule
