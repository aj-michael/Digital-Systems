`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  		Rose-Hulman Institute of Technology
// Engineer: 		Adam and Mohammad
// Create Date:	20:09:31 10/24/2015 
// Design Name: 	Phase 1 I2C controller
// Module Name:   ControllerI2C 
// Summary:			Determines the signals to send to the Data Unit
//////////////////////////////////////////////////////////////////////////////////
module ControllerI2C(Clock,ClockI2C,Go,Reset,BaudEnable,ReadOrWrite,Select,ShiftOrHold,StartStopAck,WriteLoad);
	input Clock, ClockI2C, Go, Reset;
	output reg BaudEnable, ReadOrWrite, Select, ShiftOrHold, StartStopAck, WriteLoad;
	
	parameter InitialState = 3'd0;
	parameter StartState = 3'd1;
	parameter LoadState = 3'd2;
	parameter SendState = 3'd3;
	parameter AckState = 3'd4;
	parameter DelayState = 3'd5;
	parameter StopState = 3'd6;
	
	reg [2:0] State;
	reg [2:0] NextState;
	
	reg [3:0] DataCounter;
	reg DelayLoopStart;
	wire Timeout;
	
	wire OneShotI2C;
	NegClockedOneShot OneShotUnit(ClockI2C, OneShotI2C, Reset, Clock);
	
	DelayLoop Timer(DelayLoopStart,Timeout,Clock);

	always @ (State)
		case (State)
		InitialState: begin
				ReadOrWrite <= 0;
				Select <= 0;
				BaudEnable <= 0;
				StartStopAck <= 1;
				DelayLoopStart <= 1;
			end
		StartState: begin
				BaudEnable <= 0;
				StartStopAck <= 0;
				DelayLoopStart <= 0;
			end
		LoadState: begin
				DelayLoopStart <= 1;
				BaudEnable <= 1;
			end
		SendState: begin
				BaudEnable <= 1;
				Select <= 1;
			end
		AckState: begin
				BaudEnable <= 1;
				ReadOrWrite <= 1;
				Select <= 0;
				StartStopAck <= 0;
				DelayLoopStart <= 1;
			end
		DelayState: begin
				BaudEnable <= 0;
				Select <= 0;
				ReadOrWrite <= 0;
				StartStopAck <= 0;
				DelayLoopStart <= 0;
			end
		StopState: begin
				BaudEnable <= 0;
				ReadOrWrite <= 1;
				StartStopAck <= 1;
				DelayLoopStart <= 1;
			end
		endcase
		
	always @ (State or Go or ClockI2C or Timeout or DataCounter)
		case (State)
		InitialState: NextState <= Go == 0 ? InitialState : (ClockI2C == 0 ? InitialState : StartState);
		StartState: NextState <= Timeout == 0 ? StartState : LoadState;
		LoadState: NextState <= DataCounter <= 4'd8 ? SendState : LoadState;
		SendState: NextState <= OneShotI2C == 1 ? NextState : (DataCounter == 0 ? AckState : SendState);
		AckState: NextState <= OneShotI2C == 0 ? NextState : (DataCounter == 15 ? DelayState : AckState);
		//AckState: NextState <= ClockI2C == 1 ? DelayState : AckState;
		DelayState: NextState <= Timeout == 0 ? StopState : DelayState;
		StopState: NextState <= ClockI2C == 0 ? StopState : InitialState;
		endcase

	always @ (OneShotI2C)
		if (OneShotI2C == 1) begin ShiftOrHold <= 0; WriteLoad <= 0; end
		else case (State)
		SendState: ShiftOrHold <= 1;
		LoadState: WriteLoad <= 1;
		endcase
		
	always @ (posedge Clock or posedge Reset)
		if (Reset == 1) begin DataCounter <= 4'd9; end
		else
			case (State)
			LoadState: DataCounter <= OneShotI2C == 0 ? DataCounter - 1 : DataCounter;
			SendState: DataCounter <= OneShotI2C == 0 ? DataCounter - 1 : DataCounter;
			AckState: DataCounter <= OneShotI2C == 0 ? DataCounter - 1 : DataCounter;
			default: DataCounter <= 4'd9;
		endcase

	always @ (posedge Clock or posedge Reset)
		if (Reset == 1) State <= InitialState;
		else State <= NextState;
endmodule

