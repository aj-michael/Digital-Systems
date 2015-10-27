`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
// Date:     10/15/2015
// Summary:  Iterates through the RAM addresses, sending each to UART until it
//               reaches NumberOfChars
//////////////////////////////////////////////////////////////////////////////////
module SendChars(NumberOfChars, Clock, Reset, Start, tx_full, uartClock, RAMAddress, Transmitting, write_to_uart);
	input [5:0] NumberOfChars;
	input Clock, Reset, Start, tx_full, uartClock;
	output reg [5:0] RAMAddress;
	output reg Transmitting, write_to_uart;
	
	reg [1:0] specialCharacter;
	parameter [5:0] newline = 6'd32;
	parameter [5:0] carriagereturn = 6'd33;

	always @ (posedge Clock)
		if (Reset == 1) begin write_to_uart <= 1'b0; RAMAddress <= 6'd0; specialCharacter <= 2'd0; Transmitting <= 1'b0; end
		else if (Start == 1'b1 && Transmitting == 1'b0) begin Transmitting <= 1'b1; write_to_uart <= 1; end
		else case ({tx_full, Transmitting, uartClock, specialCharacter})
			5'b01100: begin
				write_to_uart <= 1;
				if (RAMAddress+2>NumberOfChars) begin RAMAddress <= newline; specialCharacter <= 2'd1; end
				else RAMAddress <= RAMAddress + 1'b1;
				end
			5'b01101: begin
				write_to_uart <= 1;
				RAMAddress <= carriagereturn;
				specialCharacter <= 2'd2;
				end
			5'b01110: begin
				write_to_uart <= 0;
				Transmitting <= 1'b0;
				RAMAddress <= 6'd0;
				specialCharacter <= 2'd0;
				end
			default: begin
				write_to_uart <= 1'b0;
				end
		endcase
endmodule
