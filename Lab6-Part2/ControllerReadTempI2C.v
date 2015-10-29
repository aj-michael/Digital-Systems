`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:03:37 10/29/2015 
// Design Name: 
// Module Name:    ControllerReadTempI2C 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ControllerReadTempI2C(Clock,ClockI2C,Reset,SDA,Start,BaudEnable,Done,ReadOrWrite,Select,ShiftOrHold,StartStopAck,WriteLoad);
	input Clock;
	input ClockI2C;
	input Reset;
	input SDA;
	input Start;
	output BaudEnable;
	output Done;
	output ReadOrWrite;
	output Select;
	output ShiftOrHold;
	output StartStopAck;
	output WriteLoad;
	
	reg [3:0] DataCounter;
	
	reg [2:0] State;
	reg [2:0] NextState;
	parameter InitialState = 3'd0;
	parameter LoadState = 3'd1;
	parameter WriteState = 3'd2;
	parameter ReadState = 3'd3;

	wire OneShotNegative, OneShotPositive;
	ClockedNegativeOneShot OneShotNegativeUnit(ClockI2C, OneShotNegative, Reset, clock);
	ClockedPositiveOneShot OneShotPositiveUnit(ClockI2C, OneShotPositive, Reset, clock);

	reg ACKbit;

	always@(posedge clock)
		if(Reset==1) begin State<=InitialState; ACKbit<=1; end
		else begin
			State<=NextState;
			if(OneShotPositive==1) ACKbit<=SDA; else ACKbit<=ACKbit;
		end


	//count update
	always@(posedge clock)
		if(Reset==1) begin DataCounter<=4'd9; end
		else case (State)
		LoadState:
			if(OneShotNegative==0) DataCounter<=DataCounter-1'b1;
			else DataCounter<=DataCounter;
		WriteState:
			if(OneShotNegative==0) DataCounter<=DataCounter-1'b1;
			else DataCounter<=DataCounter;
		ReadState:
			if(OneShotPositive==1) DataCounter<=DataCounter-1'b1;
			else DataCounter<=DataCounter;
		default: DataCounter<=4'd9;
		endcase

endmodule