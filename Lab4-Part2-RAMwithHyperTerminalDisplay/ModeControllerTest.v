`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
// Create Date:   08:03:32 10/22/2015
// Design Name:   ModeController
// Project Name:  Lab4-Part2-RAMwithHyperTerminalDisplay
////////////////////////////////////////////////////////////////////////////////
module ModeControllerTest;
	reg [6:0] DataIn;
	reg [5:0] RAMaddressSend;
	reg [5:0] RAMaddressUpdate;
	reg Mode;
	reg WriteOrReadSend;
	wire [5:0] NumberOfChars;
	wire [5:0] RAMaddress;
	wire WriteOrRead;
	ModeController uut (
		.DataIn(DataIn), 
		.RAMaddressSend(RAMaddressSend), 
		.RAMaddressUpdate(RAMaddressUpdate), 
		.Mode(Mode), 
		.WriteOrReadSend(WriteOrReadSend), 
		.NumberOfChars(NumberOfChars), 
		.RAMaddress(RAMaddress), 
		.WriteOrRead(WriteOrRead)
	);

	initial begin
		DataIn = 6'd12; RAMaddressSend = 0; RAMaddressUpdate = 0; Mode = 0; WriteOrReadSend = 0; #10;
		WriteOrReadSend = 1; #10;
		RAMaddressUpdate = 29; #10;
		Mode = 1; #10;
		RAMaddressUpdate = 22; #10;
		$stop;
	end
endmodule

