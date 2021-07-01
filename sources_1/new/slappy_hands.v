`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2021 15:29:45
// Design Name: 
// Module Name: slappy_hands
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

module slappy_hands(
	input game_reset, game_enable,
	input clock_350hz, clock_6pt25mhz,
	input buttonL, buttonR, buttonU, buttonD,
	input [7:0] x, y,
	input [12:0] pixel_index,
	output reg [15:0] oled_data
    );
	
	reg controls_enable = 1;
	reg[15:0] player1_attack_bg [0:6143];
	reg[15:0] player2_attack_bg [0:6143];
	reg[15:0] player1_attack [0:6143];
	reg[15:0] player2_attack [0:6143];
	reg[15:0] player1_free_hit [0:6143];
	reg[15:0] player2_free_hit [0:6143];
	reg[15:0] player1_won [0:6143];
	reg[15:0] player2_won [0:6143];
	wire print_player_1_score, print_player_2_score, print_player_1_hand_black, print_player_2_hand_black, print_player_1_hand_white, print_player_2_hand_white, print_player_1_hand_colour, print_player_2_hand_colour, print_player_1_penalty, print_player_2_penalty;
	reg [3:0] player_1_score = 0;
	reg [3:0] player_2_score = 0;
	reg [3:0] player_1_penalty = 0;
	reg [3:0] player_2_penalty = 0;
	reg [7:0] player_1_x_start = 35; //if player 1 attack, x ++
	reg [7:0] player_2_x_start = 61; //if player 2 attack, x --
	
	
	print_number player_1_num(.num(player_1_score), .x(x), .y(y), .num_x_start(40), .num_y_start(2), .print(print_player_1_score));
	print_number player_2_num(.num(player_2_score), .x(x), .y(y), .num_x_start(51), .num_y_start(2), .print(print_player_2_score));
	print_hand player_1_hand(.player_num(1), .x(x), .y(y), .x_start(player_1_x_start), .y_start(23), .print_black(print_player_1_hand_black), .print_white(print_player_1_hand_white), .print_colour(print_player_1_hand_colour));
	print_hand player_2_hand(.player_num(2), .x(x), .y(y), .x_start(player_2_x_start), .y_start(24), .print_black(print_player_2_hand_black), .print_white(print_player_2_hand_white), .print_colour(print_player_2_hand_colour));
	print_penalty player_1_penalty_mod(.penalty_num(player_1_penalty), .x(x), .y(y), .x_start(43), .y_start(50), .print_black(print_player_1_penalty));
	print_penalty player_2_penalty_mod(.penalty_num(player_2_penalty), .x(x), .y(y), .x_start(51), .y_start(50), .print_black(print_player_2_penalty));
	
	
	
	initial 
	begin
		$readmemh("player1_attack_bg1.mem", player1_attack_bg);
		$readmemh("player2_attack_bg1.mem", player2_attack_bg); 
		$readmemh("player1_attack.mem", player1_attack);
		$readmemh("player2_attack.mem", player2_attack);
		$readmemh("player1_free_hit.mem", player1_free_hit);
		$readmemh("player2_free_hit.mem", player2_free_hit);
		$readmemh("player1_won.mem", player1_won);
		$readmemh("player2_won.mem", player2_won);
	end
	
	reg player_1_attacking = 1;
	reg player_2_attacking = 0;
	reg player_1_attack_animate = 0;
	reg player_1_retreat_animate = 0;
	reg player_2_attack_animate = 0;
	reg player_2_retreat_animate = 0;
	reg player_1_free_hit = 0;
	reg player_2_free_hit = 0;
	reg player_1_attacked = 0;
	reg player_2_attacked = 0;
	reg player_1_won = 0;
	reg player_2_won = 0;
	reg attack_success = 0;
	reg [8:0] attack_screen_count = 0;
	reg [8:0] win_screen_delay = 0;
	
	integer p1_dx = 0;
	integer p2_dx = 0;
	
	always @(posedge clock_350hz)
	begin
		//Reset game upon entering from menu
		if (game_reset == 1)
		begin
				player_1_score <= 0;
				player_2_score <= 0;
				player_1_attacking <= 1;
				player_2_attacking <= 0;
				player_1_penalty <= 0;
				player_2_penalty <= 0;
				player_1_won <= 0;
				player_2_won <= 0;
				controls_enable <= 1;
				p1_dx <= 0;
				p2_dx <= 0;
		end
		
		//Enter animation states that corresponds to button press
		if (buttonL == 1 && player_1_penalty < 3 && player_2_penalty < 3 && controls_enable && game_enable)
		begin
			if (player_1_attacking) 
				player_1_attack_animate <= 1;
			else 
				player_1_retreat_animate <= 1;
		end
		
		if (buttonR == 1 && player_1_penalty < 3 && player_2_penalty < 3 && controls_enable && game_enable)
		begin
			if (player_2_attacking)
				player_2_attack_animate <= 1;
			else
				player_2_retreat_animate <= 1;
		end
			
		//Animation for player 1 attack	
		if (player_1_attack_animate)
		begin
			if (player_2_penalty == 3) player_2_penalty <= 0;
			player_1_x_start <= (p1_dx < 29) ? player_1_x_start + 1 : player_1_x_start - 1; //After travelling 29 pixels forward, the hand will go back
			if (p1_dx == 29 && !player_1_attacked) //Check if attack is unsuccessful 
			begin
				player_1_attacking <= 0;
				player_2_attacking <= 1;
				attack_success <= 0;
				player_1_penalty <= 0;
				player_2_penalty <= 0;
			end
			if (p1_dx == 57) 
			begin
				player_1_attack_animate <= 0;
			end
			p1_dx <= (p1_dx == 57) ? 0 : p1_dx + 1;
		end
		
		//Animation for player 1 retreat
		if (player_1_retreat_animate)
		begin
			player_1_x_start <= (p1_dx < 29) ? player_1_x_start - 1 : player_1_x_start + 1; //After travelling 29 pixels backwards, the hand will go forward
			if (p1_dx == 29 && !player_2_attack_animate) player_1_penalty <= player_1_penalty + 1;
			if (p1_dx == 57) player_1_retreat_animate <= 0;
			p1_dx <= (p1_dx == 57) ? 0 : p1_dx + 1;
		end

		//Animation for player 2 attack
		if (player_2_attack_animate)
		begin
			if (player_1_penalty == 3) player_1_penalty <= 0;
			player_2_x_start <= (p2_dx < 29) ? player_2_x_start - 1 : player_2_x_start + 1; //After travelling 29 pixels forwards, the hand will go back
			if (p2_dx == 29 && !player_2_attacked)
			begin
				player_1_attacking <= 1;
				player_2_attacking <= 0;
				attack_success <= 0;
				player_1_penalty <= 0;
				player_2_penalty <= 0;
			end
			if (p2_dx == 57) 
			begin
				player_2_attack_animate <= 0;
			end
			p2_dx <= (p2_dx == 57) ? 0 : p2_dx + 1;
		end
		
		//Animation for player 2 retreat
		if (player_2_retreat_animate)
		begin
			player_2_x_start <= (p2_dx < 29) ? player_2_x_start + 1 : player_2_x_start - 1; //After travelling 29 pixels backwards, the hand will go forward
			if (p2_dx == 29 && !player_1_attack_animate) player_2_penalty <= player_2_penalty + 1;
			if (p2_dx == 57) player_2_retreat_animate <= 0;
			p2_dx <= (p2_dx == 57) ? 0 : p2_dx + 1;
		end
		
		//Detect collision between hands
		if (player_1_x_start == player_2_x_start && !attack_success)
		begin
			if (player_1_attacking)
			begin
				player_1_score <= player_1_score + 1;
				attack_success <= 1;
				player_1_attacked <= 1;
			end	
			else if (player_2_attacking)
			begin
				player_2_score <= player_2_score + 1;
				attack_success <= 1;
				player_2_attacked <= 1;
			end
		end
	
		//If penalty hits 3, retreating player gets free hit
		if (player_1_penalty == 3 && !player_2_free_hit)
		begin
			player_2_free_hit <= 1;
			player_2_score <= player_2_score + 1;
		end
		
		if (player_2_penalty == 3 && !player_1_free_hit)
		begin
			player_1_free_hit <= 1;
			player_1_score <= player_1_score + 1;
		end
		
		//If attack is successful/free hit, keep frame for a certain time
		if (attack_success || player_1_free_hit || player_2_free_hit)
		begin
			controls_enable <= 0;
			if (attack_screen_count == 350)
			begin
				attack_screen_count <= 0;
				attack_success <= 0;
				player_1_attacked <= 0;
				player_2_attacked <= 0;
				player_1_penalty <= 0;
				player_2_penalty <= 0;
				player_1_free_hit <= 0;
				player_2_free_hit <= 0;
				controls_enable <= 1;
				p1_dx <= 0;
				p2_dx <= 0;
			end
			else
				attack_screen_count <= attack_screen_count + 1;
		end
		
		//If either player hits score 5, game over - Display win/lose, with option to reset with buttonU
		if (player_1_score == 5 || player_2_score == 5)
		begin
			controls_enable <= 0;
			//win_screen_delay <= win_screen_delay + 1;
			if (attack_screen_count == 350)
			begin
				if (player_1_score == 5) player_1_won <= 1;
				else if (player_2_score == 5) player_2_won <= 1;
				//win_screen_delay <= 0;
			end
			
			if (buttonU == 1)
			begin
				player_1_score <= 0;
				player_2_score <= 0;
				player_1_attacking <= player_1_attacking ? 0 : 1;
				player_2_attacking <= player_2_attacking ? 0 : 1;
				player_1_penalty <= 0;
				player_2_penalty <= 0;
				player_1_won <= 0;
				player_2_won <= 0;
				controls_enable <= 1;
				p1_dx <= 0;
				p2_dx <= 0;
			end
		end
		
	end
	

	always @(posedge clock_6pt25mhz)
	begin
		if (player_1_won) oled_data <= player1_won[pixel_index]; //print player 1 win screen
		else if (player_2_won) oled_data <= player2_won[pixel_index]; //print player 2 win screen 
		else if (print_player_1_score || print_player_2_score) oled_data <= `WHITE; //print score
		else if (print_player_1_penalty || print_player_2_penalty) oled_data <= `BLACK; //print lives for penalty 
		else if (player_1_attacked) oled_data <= (player1_attack[pixel_index] == `TRANSPARENT) ? player1_attack_bg[pixel_index] : player1_attack[pixel_index]; //print player 1 attacked screen
		else if (player_2_attacked) oled_data <= (player2_attack[pixel_index] == `TRANSPARENT) ? player2_attack_bg[pixel_index] : player2_attack[pixel_index]; //print player 2 attacked screen
		else if (player_1_free_hit) oled_data <= (player1_free_hit[pixel_index] == `TRANSPARENT) ? player1_attack_bg[pixel_index] : player1_free_hit[pixel_index]; //print player 1 free hit screen
		else if (player_2_free_hit) oled_data <= (player2_free_hit[pixel_index] == `TRANSPARENT) ? player2_attack_bg[pixel_index] : player2_free_hit[pixel_index]; //print player 1 free hit screen
		else if (print_player_1_hand_white || print_player_2_hand_white) oled_data <= `WHITE; //print hand
		else if (print_player_1_hand_black || print_player_2_hand_black) oled_data <= `BLACK;
		else if (print_player_1_hand_colour) oled_data <= `PLAYER1COLOUR;
		else if (print_player_2_hand_colour) oled_data <= `PLAYER2COLOUR;
		else if (player_1_attacking) oled_data <= player1_attack_bg[pixel_index]; //red-blue bg
		else if (player_2_attacking) oled_data <= player2_attack_bg[pixel_index]; //blue-red bg
	end
	
	
endmodule
