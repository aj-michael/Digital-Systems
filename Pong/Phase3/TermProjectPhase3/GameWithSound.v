`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:50 11/11/2015 
// Design Name: 
// Module Name:    GameWithSound 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module GameWithSound(input clk25, input Reset,
				input [9:0] xpos,
				input [9:0] ypos,
				input rota,
				input rotb,
				output [2:0] red,
				output [2:0] green,
				output [1:0] blue,
				output Speaker);

reg PlayAgain;
reg PlayAgain1;
reg [1:0] Choice, Choice1;
// paddle movement		
reg [8:0] paddlePosition;
reg [2:0] quadAr, quadBr;

reg [3:0] score;
wire [3:0] scoreOnesDigit;
wire [3:0] scoreTensDigit;
assign scoreOnesDigit = score % 10;
assign scoreTensDigit = score / 10;
wire tensDigit;
wire onesDigit;
wire digitPixel;
assign digitPixel = tensDigit || onesDigit;	// 76
VGA7SegDisplay VGA7SegDisplayTens(9'd100,9'd300,xpos,ypos,scoreTensDigit,tensDigit);
VGA7SegDisplay VGA7SegDisplayOnes(9'd130,9'd300,xpos,ypos,scoreOnesDigit,onesDigit);

always @(posedge clk25) quadAr <= {quadAr[1:0], rota};
always @(posedge clk25) quadBr <= {quadBr[1:0], rotb};

always @(posedge clk25)
if(quadAr[2] ^ quadAr[1] ^ quadBr[2] ^ quadBr[1])
begin
	if(quadAr[2] ^ quadBr[1]) begin
		if(paddlePosition < 508)        // make sure the value doesn't overflow
			begin
			paddlePosition <= paddlePosition + 3'd4;
			Choice <= 2'b00;
			PlayAgain <= 1;
			end
		else
			PlayAgain <= 0;
	end
	else begin
		if(paddlePosition > 2'd3)        // make sure the value doesn't underflow
			begin
			paddlePosition <= paddlePosition - 3'd4;
			Choice <= 2'b01;
			PlayAgain <= 1;
			end
		else
			PlayAgain <= 0;
	end
end
		
// ball movement	
reg [9:0] ballX;
reg [8:0] ballY;
reg ballXdir, ballYdir;
reg bounceX, bounceY;
	
wire endOfFrame = (xpos == 0 && ypos == 480);
	
always @(posedge clk25) begin
	if (endOfFrame) begin // update ball position at end of each frame
		if (ballX == 0 && ballY == 0) begin // cheesy reset handling, assumes initial value of 0
			ballX <= 480;
			ballY <= 300;
		end
		else begin
			if (ballXdir ^ bounceX) 
				ballX <= ballX + 2'd2;
			else 
				ballX <= ballX - 2'd2;	

			if (ballYdir ^ bounceY) 
				ballY <= ballY + 2'd2;
			else
				ballY <= ballY - 2'd2;	
		end
	end	
end		
		
// pixel color	
reg [5:0] missTimer;	
wire visible = (xpos < 640 && ypos < 480);
wire top = (visible && ypos <= 3);
wire bottom = (visible && ypos >= 476);
wire left = (visible && xpos <= 3);
wire right = (visible && xpos >= 636);
wire border = (visible && (left || right || top));
wire paddle = (xpos >= paddlePosition+4 && xpos <= paddlePosition+124 && ypos >= 440 && ypos <= 447);
wire ball = (xpos >= ballX && xpos <= ballX+7 && ypos >= ballY && ypos <= ballY+7);
wire background = (visible && !(border || paddle || ball));
wire checkerboard = (xpos[5] ^ ypos[5]);
wire missed = visible && missTimer != 0;

assign red   = { missed || border || paddle, 2'b0 };
assign green = { !missed && (border || paddle || ball), digitPixel, digitPixel };
assign blue  = { !missed && (border || ball) || digitPixel, background && checkerboard || digitPixel}; 

		
// ball collision	
always @(posedge clk25) begin
	if (!endOfFrame) begin
		PlayAgain1 <= 0;
		if (ball && (left || right))
			bounceX <= 1;
		if (ball && (top || bottom || (paddle && ballYdir)))
			bounceY <= 1;
		if (ball && bottom)
			begin
			missTimer <= 63;
			score <= -1;
			end
	end
	else begin
		if (ballX == 0 && ballY == 0) begin // cheesy reset handling, assumes initial value of 0
			ballXdir <= 1;
			ballYdir <= 1;
			bounceX <= 0;
			bounceY <= 0;
			score <= -1;
			PlayAgain1 <= 0;
		end 
		else begin
			if (bounceX)
				ballXdir <= ~ballXdir;
			if (bounceY)
				if(ballYdir) begin
					score <= score + 1;
					//Choice1 <= 2'b10;
					PlayAgain1 <= 1;
					ballYdir <= ~ballYdir;
				end
				else
					begin
					ballYdir <= ~ballYdir;
					PlayAgain1 <= 0;
					end
			bounceX <= 0;
			bounceY <= 0;
			if (missTimer != 0)
				missTimer <= missTimer - 1'b1;
		end
	end
end

PlaySound PlayMusic(PlayAgain|PlayAgain1, Speaker, Reset, clk25, Choice);
		
endmodule
