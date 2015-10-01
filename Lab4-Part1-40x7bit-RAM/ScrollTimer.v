`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
// Date:     10/1/2015
// Summary:  This module generates a one-period pulse for every half second that
//           Enable == 1.
//////////////////////////////////////////////////////////////////////////////////
module ScrollTimer(Clock, Enable, Reset, PulseOutput);
	input Clock, Enable, Reset;
	output PulseOutput;
	reg [24:0] counter;
	param CLOCK_CYCLES = 17500000;
	initial PulseOutput = 0;
	initial counter = 0;
	always@(posedge Clock)
		if (Enable==0|Reset==1) begin counter <= 0; PulseOutput <= 0; end
		else if (counter == CLOCK_CYCLES) begin counter <= 0; PulseOutput <= 1; end
		else begin counter <= counter + 1; PulseOutput <= 0; end
endmodule
