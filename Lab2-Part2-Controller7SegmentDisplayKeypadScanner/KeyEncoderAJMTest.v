`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
//
// Create Date:   18:38:26 09/18/2015
// Design Name:   KeyEncoder
// Module Name:   C:/Users/adam/Documents/GitHub/Digital Systems/Lab2-ManualKeypadScannerAndEncoder/KeyEncoderAJMTest.v
// Project Name:  Lab2-ManualKeypadScannerAndEncoder
////////////////////////////////////////////////////////////////////////////////
module KeyEncoderTest;
	reg [3:0] Columns, Rows;
	reg Clock, Reset;
	wire [3:0] OnesDigit;
	wire [3:0] TensDigit;
	wire Found;
	KeyEncoder uut(Columns, Rows, Clock, Reset, OnesDigit, TensDigit, Found);
	always #5 Clock = ~Clock;
	initial begin
		Clock = 0; Reset = 1; #4;
		Reset = 0;
		Columns = 4'b0111; Rows = 4'b0111; #10;
		Columns = 4'b1011; Rows = 4'b0111; #10;
		Columns = 4'b1101; Rows = 4'b0111; #10;
		Columns = 4'b0111; Rows = 4'b1011; #10;
		Columns = 4'b1011; Rows = 4'b1011; #10;
		Columns = 4'b1101; Rows = 4'b1011; #10;
		Columns = 4'b0111; Rows = 4'b1101; #10;
		Columns = 4'b1011; Rows = 4'b1101; #10;
		Columns = 4'b1101; Rows = 4'b1101; #10;
		Columns = 4'b1110; Rows = 4'b0111; #10;
		Columns = 4'b1110; Rows = 4'b1011; #10;
		Columns = 4'b1110; Rows = 4'b1101; #10;
		Columns = 4'b1110; Rows = 4'b1110; #10;
		Columns = 4'b0111; Rows = 4'b1110; #10;
		Columns = 4'b1011; Rows = 4'b1110; #10;
		Columns = 4'b1101; Rows = 4'b1110; #10;
		Columns = 4'b1101; Rows = 4'b1010; #10;
		$stop;
	end
endmodule