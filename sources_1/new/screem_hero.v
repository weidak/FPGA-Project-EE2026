`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2021 23:39:06
// Design Name: 
// Module Name: screem_hero
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

module screem_hero(
	input game_reset,
	input game_enable,
	input clock_5hz, clock_25hz, clock_6pt25mhz,
    input buttonU, buttonL,
	input [3:0] volume,
	input [7:0] x, y,
	input [12:0] pixel_index,
	output reg [15:0] oled_data
    );
	
	//RNG 
	wire [3:0] block_height_case;
	reg [7:0] random_block_y_start;
	rng_generator random_block_height(.clock(CLK100MHZ), .random_number(block_height_case));

	//Background
	reg [15:0]screemhero_bg[0:6143];
	reg [15:0]gameover[0:6143];

	//Objects
	reg [7:0] cat_y_start = 14;
	reg [7:0] cat_x_start = 1;
	reg [7:0] block1_x_end = 75;
	reg [7:0] block2_x_end = 140;
	reg [7:0] block3_x_end = 200;
	reg [7:0] block4_x_end = 0;
	reg [7:0] block1_y_start = 30;
	reg [7:0] block2_y_start = 35;
	reg [7:0] block3_y_start = 55;
	reg [7:0] block4_y_start = 45;
	reg [7:0] cloud1_x_start = 10;
	reg [7:0] cloud1_y_start = 5;
	reg [7:0] cloud2_x_start = 90;
	reg [7:0] cloud2_y_start = 3;	
	reg [7:0] cloud3_x_start = 180;
	reg [7:0] cloud2_y_start = 9;
	
	wire print_cat,print_pig, print_block1, print_block2, print_block3, print_block4, print_cloud1, print_cloud2, print_cloud3;
	wire [15:0] oled_cat, oled_pig, oled_block1, oled_block2, oled_block3, oled_block4, oled_cloud1, oled_cloud2, oled_cloud3;
	
	print_pighero pig(.x(x), .y(y), .x_start(cat_x_start), .y_start(cat_y_start), .print_pighero(print_pig), .oled_data(oled_pig));
	print_cathero cat(.x(x), .y(y), .x_start(cat_x_start), .y_start(cat_y_start), .print_cat(print_cat), .oled_data(oled_cat));
	print_block block1(.x(x+35), .y(y), .x_end(block1_x_end), .y_start(block1_y_start), .print_block(print_block1), .oled_data(oled_block1));
	print_block block2(.x(x+35), .y(y), .x_end(block2_x_end), .y_start(block2_y_start), .print_block(print_block2), .oled_data(oled_block2));
	print_block block3(.x(x+35), .y(y), .x_end(block3_x_end), .y_start(block3_y_start), .print_block(print_block3), .oled_data(oled_block3));
	print_block block4(.x(x+35), .y(y), .x_end(block4_x_end), .y_start(block4_y_start), .print_block(print_block4), .oled_data(oled_block4));
	print_cloud cloud1(.x(x+21), .y(y), .x_start(cloud1_x_start),.y_start(cloud1_y_start), .print_cloud(print_cloud1),.oled_data(oled_cloud1));
	print_cloud cloud2(.x(x+21), .y(y), .x_start(cloud2_x_start),.y_start(cloud2_y_start), .print_cloud(print_cloud2),.oled_data(oled_cloud2));
	print_cloud cloud3(.x(x+21), .y(y), .x_start(cloud3_x_start),.y_start(cloud3_y_start), .print_cloud(print_cloud3),.oled_data(oled_cloud3));
	
	wire [7:0] actual_block1_x_end, actual_block2_x_end, actual_block3_x_end, actual_block4_x_end;
	assign actual_block1_x_end = block1_x_end - `BLOCKWIDTH; 
	assign actual_block2_x_end = block2_x_end - `BLOCKWIDTH; 
	assign actual_block3_x_end = block3_x_end - `BLOCKWIDTH; 
	assign actual_block4_x_end = block4_x_end - `BLOCKWIDTH; 
	
	
	//Score
	wire [7:0] score_digit_1_x_start, score_digit_2_x_start;
	reg [7:0] score_y_start = 5;
	reg [7:0] game_over_score_digit_1_x_start;
	reg [6:0] score = 0;
	wire [6:0] score_digit_1, score_digit_2;
	assign score_digit_1_x_start = (stop) ? game_over_score_digit_1_x_start : (score >= 10) ? 41 : 45; 
	assign score_digit_2_x_start = score_digit_1_x_start + 6;
	assign score_digit_1 = (score >= 10) ? score/10 : score;
	assign score_digit_2 = (score < 10) ? 0 : score%10; 
	print_number score_digit_1(.num(score_digit_1), .x(x), .y(y), .num_x_start(score_digit_1_x_start), .num_y_start(score_y_start), .print(print_score_digit_1));
	print_number score_digit_2(.num(score_digit_2), .x(x), .y(y), .num_x_start(score_digit_2_x_start), .num_y_start(score_y_start), .print(print_score_digit_2));
	
	
	//Boolean for collision detections
	wire collide, on_platform, on_platform_1, on_platform_2, on_platform_3, on_platform_4;
	
	assign collide = ((cat_x_start == actual_block1_x_end - `BLOCKWIDTH - 17) && (cat_y_start + `CATHEIGHT + 1 >= block1_y_start)) || 
					 ((cat_x_start == actual_block2_x_end - `BLOCKWIDTH - 17) && (cat_y_start + `CATHEIGHT + 1 >= block2_y_start)) ||
					 ((cat_x_start == actual_block3_x_end - `BLOCKWIDTH - 17) && (cat_y_start + `CATHEIGHT + 1 >= block3_y_start)) ||
					 ((cat_x_start == actual_block4_x_end - `BLOCKWIDTH - 17) && (cat_y_start + `CATHEIGHT + 1 >= block4_y_start)) ||
				     (cat_y_start + `CATHEIGHT == 62); 
					  
					  
	wire [7:0] min_block1_x, min_block2_x, min_block3_x, min_block4_x;
	assign min_block1_x = actual_block1_x_end >= `BLOCKWIDTH ? actual_block1_x_end - `BLOCKWIDTH : 0;
	assign min_block2_x = actual_block2_x_end >= `BLOCKWIDTH ? actual_block2_x_end - `BLOCKWIDTH : 0;
	assign min_block3_x = actual_block3_x_end >= `BLOCKWIDTH ? actual_block3_x_end - `BLOCKWIDTH : 0;
	assign min_block4_x = actual_block4_x_end >= `BLOCKWIDTH ? actual_block4_x_end - `BLOCKWIDTH : 0;
	
	assign on_platform_1 = ((cat_y_start + `CATHEIGHT == block1_y_start) && //cat legs overlap first layer of block 
							(cat_x_start + `CATWIDTH >= min_block1_x)); //cat's 2nd leg reaches the x_start of block
	assign on_platform_2 = ((cat_y_start + `CATHEIGHT == block2_y_start) && //cat legs overlap first layer of block 
							(cat_x_start + `CATWIDTH >= min_block2_x)); //cat's 2nd leg reaches the x_start of block						
	assign on_platform_3 = ((cat_y_start + `CATHEIGHT == block3_y_start) && //cat legs overlap first layer of block 
							(cat_x_start + `CATWIDTH >= min_block3_x)); //cat's 2nd leg reaches the x_start of block			
	assign on_platform_4 = ((cat_y_start + `CATHEIGHT == block4_y_start) && //cat legs overlap first layer of block 
							(cat_x_start + `CATWIDTH >= min_block4_x)); //cat's 2nd leg reaches the x_start of block										
	assign on_platform = on_platform_1 || on_platform_2 || on_platform_3 || on_platform_4;
	
	reg stop = 0;
	reg startjump = 0;
	reg [7:0] jumpheight;
	reg [3:0] i = 0;
	reg [7:0] prev_cat_y_start;
	
	reg switch_char = 0;
	
	initial begin
		$readmemh("print_bg.mem", screemhero_bg);
		$readmemh("gameover.mem", gameover);
	end
	
	always @ (posedge clock_5hz) begin
		if (stop == 0 & game_enable) begin
		cloud1_x_start <= cloud1_x_start - 1;
		cloud2_x_start <= cloud2_x_start - 1;
		cloud3_x_start <= cloud3_x_start - 1;
		end
	end
	
	always @(posedge clock_25hz) begin
		if (!stop && game_enable) 
		begin
			
			if(buttonL) switch_char <= ~switch_char;
			
			block1_x_end <= block1_x_end -1;
			block2_x_end <= block2_x_end -1;
			block3_x_end <= block3_x_end -1;
			block4_x_end <= block4_x_end -1;
			
			if (actual_block1_x_end <= 0) 
			begin
				block1_y_start <= random_block_y_start;
				score <= score + 1;
			end
			
			if (actual_block2_x_end <= 0) 
			begin
				block2_y_start <= random_block_y_start;
				score <= score + 1;
			end
			
			if (actual_block3_x_end <= 0) 
			begin
				block3_y_start <= random_block_y_start;
				score <= score + 1;
			end
			
			if (actual_block4_x_end <= 0) 
			begin
				block4_y_start <= random_block_y_start;
				score <= score + 1;
			end
			
			//Measure new jumpheight when on platform
			if (on_platform) 
			begin
				if (volume >= 2) 
				begin
					jumpheight <= volume*2;
					startjump <= 1; 
					prev_cat_y_start <= cat_y_start;
				end
			end
			
			//Alter cat's trajectory
			if (startjump) 
			begin
				cat_y_start <= cat_y_start - 1;
				startjump <= (prev_cat_y_start - cat_y_start == jumpheight || cat_y_start == 1) ? 0 : startjump;
			end
			
			if (!on_platform && !startjump)
			begin
				cat_y_start <= cat_y_start + 1;
			end

			if (collide) stop <= 1;
		end
		
		if (stop) 
		begin
			game_over_score_digit_1_x_start <= (score >= 10) ? 57 : 60;
			score_y_start <= 37;
		end
		
		if ((stop && buttonU == 1) || game_reset == 1) 
		begin 
				stop <= 0;
				cat_y_start <= 0;
				startjump <= 0;
				score <= 0; 
				score_y_start <= 5;
				block1_y_start <= 30;
				block2_y_start <= 35;
				block3_y_start <= 55;
				block4_y_start <= 45;
				if (game_reset == 1) switch_char <= 0;
		end
		
	end

	
	always @(posedge clock_6pt25mhz)
	begin
		
	    if (print_score_digit_1 && (score < 10 || (score >= 10 && score_digit_1 != 0))) oled_data <= (stop) ? `WHITE : `BLACK;
		else if (score >= 10 && print_score_digit_2) oled_data <= (stop) ? `WHITE: `BLACK;
		else if (stop && gameover[pixel_index] != `TRANSPARENT) oled_data <= gameover[pixel_index]; 
		else if (print_cat && switch_char == 0) oled_data <= oled_cat;
		else if (print_pig && switch_char == 1) oled_data <= oled_pig;
		else if (print_block1) oled_data <= oled_block1;
		else if (print_block2) oled_data <= oled_block2;
		else if (print_block3) oled_data <= oled_block3;
		else if (print_block4) oled_data <= oled_block4;
		else if (print_cloud1) oled_data <= oled_cloud1;
		else if (print_cloud2) oled_data <= oled_cloud2;
		else if (print_cloud3) oled_data <= oled_cloud3;
		else 
			oled_data = screemhero_bg[pixel_index];
			
			
		case (block_height_case)
			0: random_block_y_start <= 30;
			1: random_block_y_start <= 32;
			2: random_block_y_start <= 35;
			3: random_block_y_start <= 38;
			4: random_block_y_start <= 40;
			5: random_block_y_start <= 42;
			6: random_block_y_start <= 44;
			7: random_block_y_start <= 46;
			8: random_block_y_start <= 48;
			9: random_block_y_start <= 50;
			10: random_block_y_start <= 52;
			11: random_block_y_start <= 54;
			12: random_block_y_start <= 56;
			13: random_block_y_start <= 41;
			14: random_block_y_start <= 34;
			15: random_block_y_start <= 58;
		endcase
	end
	
	
endmodule
