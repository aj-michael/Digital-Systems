`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
//
// Create Date:   18:38:26 09/18/2015
// Design Name:   KeyEncoderAJM
// Module Name:   C:/Users/adam/Documents/GitHub/Digital Systems/Lab2-ManualKeypadScannerAndEncoder/KeyEncoderAJMTest.v
// Project Name:  Lab2-ManualKeypadScannerAndEncoder
////////////////////////////////////////////////////////////////////////////////
module KeyEncoderAJMTest;
	reg [3:0] Columns, Rows;
	wire [4:0] KeyNumber;

	KeyEncoderAJM uut(Columns, Rows, KeyNumber);

	initial begin
		Columns = 4'b0111; Rows = 4'b0111; #1;
		Columns = 4'b1011; Rows = 4'b0111; #1;
		Columns = 4'b1101; Rows = 4'b0111; #1;
		Columns = 4'b0111; Rows = 4'b1011; #1;
		Columns = 4'b1011; Rows = 4'b1011; #1;
		Columns = 4'b1101; Rows = 4'b1011; #1;
		Columns = 4'b0111; Rows = 4'b1101; #1;
		Columns = 4'b1011; Rows = 4'b1101; #1;
		Columns = 4'b1101; Rows = 4'b1101; #1;
		Columns = 4'b1110; Rows = 4'b0111; #1;
		Columns = 4'b1110; Rows = 4'b1011; #1;
		Columns = 4'b1110; Rows = 4'b1101; #1;
		Columns = 4'b1110; Rows = 4'b1110; #1;
		Columns = 4'b0111; Rows = 4'b1110; #1;
		Columns = 4'b1011; Rows = 4'b1110; #1;
		Columns = 4'b1101; Rows = 4'b1110; #1;
		Columns = 4'b1101; Rows = 4'b1010; #1;
		$stop;
	end
endmodule

