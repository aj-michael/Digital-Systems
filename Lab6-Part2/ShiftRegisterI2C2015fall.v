`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  		Rose-Hulman Institute of Technology
// Engineer: 		Adam and Mohammad
// Create Date:   20:22:39 10/24/2015 
// Design Name: 	I2C Shift Register
// Module Name:   ShiftRegisterI2C2015fall 
// Summary:			This module is used to both write data to I2C and read data from I2c
//////////////////////////////////////////////////////////////////////////////////
module ShiftRegisterI2C2015fall(SentData,Clock,Reset,ShiftIn,ShiftOrHold,WriteLoad,ReceivedData,ShiftOut,ClockI2C);
	input [7:0] SentData;
	input Clock;
	input ClockI2C;
	input Reset;
	input ShiftIn;
	input ShiftOrHold;
	input WriteLoad;
	output reg [7:0] ReceivedData;
	output reg ShiftOut;
	
	wire OneShotClockI2C;
	
	ClockedNegativeOneShot OneShotUnit1(ClockI2C, OneShotClockI2C, Reset, Clock) ;
	
	always @ (posedge Clock)
		if (Reset == 1) begin ShiftOut <= 0; ReceivedData <= 8'b0; end
		else if (WriteLoad) begin
				ReceivedData <= SentData;
				ShiftOut <= SentData[7];
			end
		else case ({OneShotClockI2C, ShiftOrHold})
		2'b01: begin
			ReceivedData <={ReceivedData[6:0],ShiftIn};
			ShiftOut <= ReceivedData[6];
		end
		endcase
endmodule
