`timescale 1ns / 1ps
module ShiftRegisterI2C_tb;
	reg WriteLoad;
	reg [7:0] SentData;
	reg ShiftIn, ShiftorHold;
	reg Reset, CLOCK;
	wire [7:0] ReceivedData;
	wire ShiftOut;
	
	ShiftRegisterI2C2015fall uut (SentData,CLOCK,Reset,ShiftIn,ShiftorHold,WriteLoad,ReceivedData,ShiftOut,CLOCK);

	initial begin WriteLoad = 0; SentData = 0; ShiftIn = 0; ShiftorHold = 0; Reset = 0; CLOCK = 0; end
	
	always #2 CLOCK=~CLOCK;

	initial fork
		#0 Reset = 0; #6 Reset = 1; #14 Reset = 0;
		#0 WriteLoad = 0; #11 WriteLoad = 1; #22 WriteLoad = 0; #66 WriteLoad = 1; #76 WriteLoad = 0;
		#0 SentData = 8'b10101011; #56 SentData = 8'b00110101;
		#0 ShiftIn = 1; #13 ShiftIn = 1; #19 ShiftIn = 0; #24 ShiftIn = 1; #38 ShiftIn = 0; #46 ShiftIn = 1;
		#67 ShiftIn = 0; #98 ShiftIn = 1;
		#0 ShiftorHold = 0; #12 ShiftorHold = 1;
		#17 ShiftorHold = 0; #45 ShiftorHold = 1; #55 ShiftorHold = 0; #65 ShiftorHold = 1; #75 ShiftorHold =
		0; #85 ShiftorHold = 1;
		#95 ShiftorHold = 0; #105 ShiftorHold = 1; #115 ShiftorHold = 0; #125 ShiftorHold = 1; #135 ShiftorHold
		= 0; #145 ShiftorHold = 1;
		#120 $stop;
	join
endmodule