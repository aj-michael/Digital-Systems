`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  		Rose-Hulman Institute of Technology
// Engineer: 		Adam and Mohammad
// Create Date:   21:33:51 10/24/2015 
// Design Name: 	SDA Module
// Module Name:   SDAmodule 
// Summary: 		A tri-state module for reading and writing I2C.
//////////////////////////////////////////////////////////////////////////////////
module SDAmodule(SDA, ReadorWrite, Select, StartStopAck, ShiftIn, ShiftOut);
input ReadorWrite, Select, ShiftOut, StartStopAck;
output ShiftIn;
inout SDA;

assign SDA = (ReadorWrite) ? 1'bZ : ((Select) ? ShiftOut : StartStopAck);
assign ShiftIn = SDA;
endmodule
