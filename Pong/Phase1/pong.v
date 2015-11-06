`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  Rose-Hulman Institute of Technology
// Engineer: Adam Michael
//
//	Term Project - Phase 1
//////////////////////////////////////////////////////////////////////////////////

// -----------------------------------------------
// top-level module
// -----------------------------------------------
module PongNexys3(
    input InputClock,
    input rota,
    input rotb,
    output [2:0] red,
    output [2:0] green,
    output [1:0] blue,
    output hsync,
    output vsync
    );

	//reg clk50_int;
	//always @(posedge InputClock) begin
	//	clk50_int <= ~clk50_int;
	//end
	//Clock50MHz ClockUnit(InputClock, clk50_int);
	//wire clk50;
	//BUFG bufg_inst(clk50, clk50_int);
	
	
	wire clk50;
	Clock50MHz ClockUnit(InputClock, clk50);
	reg clk25_int;
	always @(posedge clk50) begin
		clk25_int <= ~clk25_int;
	end
	wire clk25;
	BUFG bufg_inst(clk25, clk25_int);

	wire [9:0] xpos;
	wire [9:0] ypos;

	video_timer video_timer_inst(clk25, hsync, vsync, xpos, ypos);
	game game_inst(clk25, xpos, ypos, rota, rotb, red, green, blue);
					
endmodule

