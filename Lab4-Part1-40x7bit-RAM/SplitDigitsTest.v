`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company:  Adam LLC
// Engineer: Adam Michael
////////////////////////////////////////////////////////////////////////////////
module SplitDigitsTest;
	reg [6:0] Number;
	wire [3:0] Hundreds;
	wire [3:0] Tens;
	wire [3:0] Ones;

	SplitDigits uut(Number, Hundreds, Tens, Ones);

	initial begin
		Number = 0; #10;
		Number = 249; #10;
		Number = 112; #10;
		Number = 98; #10;
		Number = 2; #10;
		Number = 4; #10;
		Number = 99; #10;
		Number = 11; #10;
		$stop;
	end
      
endmodule

