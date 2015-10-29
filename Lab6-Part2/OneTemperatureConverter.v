`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  		Rose-Hulman Institute of Technology
// Engineer: 		Adam and Mohammad
// Create Date:   14:16:08 10/29/2015 
// Design Name:	I2C temperature converter
// Module Name:   OneTemperatureConverter 
// Summary:			Converts I2C temperature to Celsius and Fahrenheit.
//////////////////////////////////////////////////////////////////////////////////
module OneTemperatureConverter(Temp,First1,First0,Second1,Second0);
	input [7:0] Temp;
	output [3:0] First1, First0, Second1, Second0;
	
	assign First1 = (Temp*18/10+32)/10;
	assign First0 = (Temp*18/10+32)%10;
	
	assign Second1 = Temp/10;
	assign Second0 = Temp%10;
endmodule
