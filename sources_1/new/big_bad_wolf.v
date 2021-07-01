`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2021 21:32:36
// Design Name: 
// Module Name: big_bad_wolf
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "define.vh"
`define LVL1 6
`define LVL2 4
`define LVL3 2

module big_bad_wolf(
	input game_reset, enable_bbw,
	input clock_25hz, clock_6pt25mhz,
    input buttonU, 
    input [7:0]x, y,
	input [12:0] pixel_index,
	input [3:0] volume,
    output reg [15:0] oled_data
    );	
	

	reg[2:0] screen_state = 0; //0: instructions, 1: straw, 2: stick, 3: bricks, 4: win
	reg[7:0] progress = 0;
	reg[2:0] difficulty = 1;
	
	//Print
	wire print_wind, print_blow, print_progress;
	wire [15:0] oled_wind, oled_blow;
	print_wind print_wind(.x(x), .y(y), .x_start(33), .y_start(29), .print_wind(print_wind), .oled_data(oled_wind));
	print_blow print_blow(.x(x), .y(y), .x_start(0), .y_start(0), .print_blow(print_blow), .oled_data(oled_blow));
	print_progress print_progress(.x(x), .y(y), .x_end(83), .y_start(0), .progress(progress), .print_progress(print_progress));
	reg show_wind = 0; 
	reg show_blow = 0; 
	reg show_progress = 0;;
	reg [8:0] blink_wind = 0;
	reg [8:0] blink_blow = 0;
	reg [8:0] screen_delay = 0;
	
	reg blowing = 0; 
	reg delaying = 0;
	reg complete_stage1 = 0;
	reg complete_stage2 = 0;
	reg complete_stage3 = 0;
	
	//Memory
	reg[15:0] bbw_stick [0:6143];
	// reg[15:0] bbw_stick[0:6143];
	// reg[15:0] bbw_brick[0:6143];
	reg[15:0] bbw_pigdie_full[0:6143];
	
	initial 
	begin
		$readmemh("bbw_stick.mem", bbw_stick);
		$readmemh("bbw_pigdie_full.mem", bbw_pigdie_full);
		
	end
	
	reg [3:0] blow = 8;
	reg [3:0] blow_amt = 0;
	reg gravity = 0;
	
	
	always @(posedge clock_25hz)
	begin
	
	if ((screen_state == 1 && buttonU) || game_reset) 
	begin
		screen_state <= 0;
		complete_stage1 <= 0;
		complete_stage2 <= 0;
		complete_stage3 <= 0;
		delaying <= 0;
		show_wind <= 0;
		show_blow <= 0;
		progress <= 0;
		screen_delay <= 0;
		gravity <= 0;
	end
	
	if (screen_state == 0 && !complete_stage1 && enable_bbw) 
	begin
		gravity <= (progress == 0 || progress == 1)? 0 : 1;
		progress <= progress + blow_amt - gravity;
		if (progress >= 72)
		begin
			complete_stage1 <= 1;
			screen_state <= 1;
		end	
	end
	
	if (volume > 0) 
	begin	
		show_wind <= 1;
		show_blow <= 0;
		blow_amt <= 2;
			
	end
	else if (volume == 0)
	begin	
		show_wind <= 0;
		show_blow <= 1;
		blow_amt <= 0;
	end
	
	
	end
	
	
	always @(posedge clock_6pt25mhz)
	begin
		
		if (screen_state == 1 && progress >= 72) oled_data <= bbw_pigdie_full[pixel_index];
		else if (screen_state == 0)
		begin
			if (print_wind && show_wind) oled_data <= oled_wind;	
			else if (print_blow && show_blow) oled_data <= oled_blow;
			else if (print_progress) oled_data <=  `DYING_COLOUR;
			else oled_data <= bbw_stick[pixel_index];	
		end
	end
	
	
	
	
endmodule