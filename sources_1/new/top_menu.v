`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY  MONDAY P.M
//
//  STUDENT A NAME: TAY WEIDA
//
//  STUDENT B NAME: TAN LE YI
//
//////////////////////////////////////////////////////////////////////////////////

`include "define.vh"

module top_menu(
	input CLK100MHZ,
	input  btnC, btnL, btnR, btnU, btnD, 
	input [15:0] sw,
	output [6:0] seg,
	output [3:0] an,
	output [15:0]led,
	output cs, sdin, sclk, d_cn, resn, vccen, pmoden,
	input  J_MIC3_Pin3, 
    output J_MIC3_Pin1, J_MIC3_Pin4
    );
	
	//Memory
	reg[15:0] menuscreen [0:6143];
	reg[15:0] player1_attack_bg [0:6143];
	reg[15:0] waveform_bg [0:6143];
	reg[15:0] screem_hero_bg [0:6143];
	reg[15:0] bbw_bg [0:6143];
	
	//Clocks, Buttons
	wire  clock_6pt25mhz, clock_20khz, clock_4khz, clock_381hz, clock_350hz, clock_5hz, clock_25hz;
	wire reset_pulse, buttonL, buttonR, buttonC, buttonD, buttonU;
    
	//OLED
	wire frame_begin, sending_pixels, sample_pixel; //Unused wires
    reg[15:0] oled_data = 0;
	wire[15:0] oled_slappy, oled_volbar, oled_waveform, oled_screem, pixel_index, oled_bbw;
	wire[7:0] x,y;
	
	//Mic
	wire [11:0]mic_in; 
	wire [15:0]audio_sample;
	
	//Variables to enable each game
	reg enable_menu = 1;
	reg enable_volbar = 0;
	reg enable_screem = 0;
	reg enable_bbw = 0;
	reg enable_slappy_hands = 0;

	reg reset_game = 0;

	
	//Clock Modules
	my_clock_divider clock_6pt25m (.basys_clock(CLK100MHZ), .m(7), .desired_clock(clock_6pt25mhz));
	my_clock_divider clock_20k(.basys_clock(CLK100MHZ), .m(2499), .desired_clock(clock_20khz));
	my_clock_divider clock_4k(.basys_clock(CLK100MHZ),.m(12499), .desired_clock(clock_4khz));
	my_clock_divider clock_381 (.basys_clock(CLK100MHZ),.m(131232), .desired_clock(clock_381hz));
	my_clock_divider clock_350 (.basys_clock(CLK100MHZ), .m(142856), .desired_clock(clock_350hz));
	my_clock_divider clock_5 (.basys_clock(CLK100MHZ),.m(9999999), .desired_clock(clock_5hz));
	my_clock_divider clock_25(.basys_clock(CLK100MHZ), .m(1999999), .desired_clock(clock_25hz));


	//Button Modules
	reset_pulse sp(.sp_clock(clock_6pt25mhz), .my_pb(btnC), .my_sp(reset_pulse));
	debounce_pulse buttonL(.sp_clock(clock_25hz), .my_sb(btnL), .my_sp(buttonL));
	debounce_pulse buttonR(.sp_clock(clock_25hz), .my_sb(btnR), .my_sp(buttonR));	
	debounce_pulse buttonU(.sp_clock(clock_25hz), .my_sb(btnU), .my_sp(buttonU));
	debounce_pulse buttonD(.sp_clock(clock_25hz), .my_sb(btnD), .my_sp(buttonD));	
	debounce_pulse buttonC(.sp_clock(clock_25hz), .my_sb(btnC), .my_sp(buttonC));	
	
	//OLED Modules
	Oled_Display led_disp(.clk(clock_6pt25mhz), .reset(reset_pulse), .frame_begin(frame_begin), .sending_pixels(sending_pixels),
	.sample_pixel(sample_pixel), .pixel_index(pixel_index), .pixel_data(oled_data), .cs(cs), .sdin(sdin), .sclk(sclk), .d_cn(d_cn), .resn(resn), .vccen(vccen),
	.pmoden(pmoden), .teststate(teststate));
    
    coordinate_system coords(.pixel_index(pixel_index), .x(x), .y(y));
	
	//Mic Modules  
    Audio_Capture audio (.CLK(CLK100MHZ), .cs(clock_20khz), .MISO(J_MIC3_Pin3),  .clk_samp(J_MIC3_Pin1), .sclk(J_MIC3_Pin4), .sample(mic_in));
   
	//Menu 
	reg prv_sw_state;
	wire print_white, print_grey;
	reg cat_state = 0;
	reg[8:0] cat_screen_count = 0;
	print_cat print_cat(.x(x), .y(y), .x_start(75), .y_start(6), .cat_state(cat_state),.print_white(print_white), .print_grey(print_grey));
	wire print_triangle;
	reg [7:0] triangle_y_start = 21;
	assign print_triangle = (((x == 20 || x == 21) && (y >= triangle_y_start && y <= triangle_y_start + 4)) || 
							 ((x == 22 || x == 23) && (y >= triangle_y_start + 1 && y <= triangle_y_start + 3)) ||
							 ((x == 24 && y == triangle_y_start + 2)));
	reg[3:0] menu_state = 1;
	reg[3:0] game_state = 0;
	
	//Volume Bar
	wire [3:0] volume;
	wire [3:0]an1;
	wire [6:0]seg1;
	volbar_audio disp(.clk_20khz(clock_20khz), .clk_381hz(clock_381hz), .clk_5hz(clock_5hz),.mic_in(mic_in) , .sw(sw), .led(audio_sample), .an(an1), .seg(seg1), .display_number(volume));
	volbar_disp volbar(.game_enable(enable_volbar), .CLK100MHZ(CLK100MHZ), .clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .buttonL(buttonL), .buttonR(buttonR), .sw(sw), .volume(volume), .x(x), .y(y), .oled_data(oled_volbar));
	assign an = (!enable_volbar) ? 4'b1111 : an1;
	assign seg = (!enable_volbar) ? 7'b1111111 : seg1;
	
	//Slappy Hands
	slappy_hands slappy_hands(.game_reset(reset_game), .game_enable(enable_slappy_hands), .clock_350hz(clock_350hz), .clock_6pt25mhz(clock_6pt25mhz), .buttonL(buttonL), .buttonR(buttonR), .buttonU(buttonU), .buttonD(buttonD), .x(x), .y(y), .pixel_index(pixel_index), .oled_data(oled_slappy));
	
	//Waveform
	wave_print waveform(.CLK100MHZ(CLK100MHZ),.clock_20khz(clock_20khz), .clock_6pt25mhz(clock_6pt25mhz), .mic_in(mic_in),.sw(sw[4:0]), .x(x), .y(y), .oled_data(oled_waveform));
	
	//BBW
	big_bad_wolf bbw(.game_reset(reset_game), .enable_bbw(enable_bbw), .clock_25hz(clock_25hz), .clock_6pt25mhz(clock_6pt25mhz), .buttonU(buttonU), .x(x), .y(y), .pixel_index(pixel_index), .volume(volume), .oled_data(oled_bbw));
	
	//Screem Hero
	screem_hero screem_hero1(.game_reset(reset_game), .game_enable(enable_screem), .clock_5hz(clock_5hz), .clock_25hz(clock_25hz), .clock_6pt25mhz(clock_6pt25mhz), .buttonU(buttonU), .buttonL(buttonL), .volume(volume),.x(x), .y(y), .pixel_index(pixel_index), .oled_data(oled_screem));

	initial 
	begin
		$readmemh("menuscreen.mem", menuscreen);
		$readmemh("player1_attack_bg.mem", player1_attack_bg);
		$readmemh("waveform_bg.mem", waveform_bg);
		$readmemh("screem_hero_bg.mem", screem_hero_bg);
		$readmemh("bbw_bg.mem", bbw_bg);
	end
	
	
	always @(posedge clock_25hz)
	begin
		reset_game <= 0;
		
		prv_sw_state <= sw[15];
		if (sw[15] != prv_sw_state) 
		begin
			game_state <= 0;
			reset_game <= 1;
		end
		
		if (enable_menu)
		begin
			if (buttonD == 1) menu_state <= (menu_state == 5) ? 1: menu_state + 1; 
			if (buttonU == 1) menu_state <= (menu_state == 1) ? 1: menu_state - 1;	
			if (buttonC == 1) 
			begin
				game_state <= menu_state;
				reset_game <= 1;
			end
		end
		
		case (menu_state)
			1:  begin //Soundbar
				triangle_y_start <= 21;
				end
			2:	begin //Screem Hero
				triangle_y_start <= 29;
				end
			3:  begin //Waveform
				triangle_y_start <= 37;
				end
			4:  begin //Balloon
				triangle_y_start <= 45;
				end
			5:  begin //Slappy Hands
				triangle_y_start <= 53;		
				end
		endcase
		
		cat_screen_count <= (cat_screen_count == 13) ? 0 : cat_screen_count + 1;
		if (cat_screen_count == 13) cat_state <= ~cat_state; 

	end
	
	
	
	always @(posedge CLK100MHZ)
	begin	
		case (game_state)
			0:  begin //Menu
				enable_menu <= 1;
				enable_volbar <= 0;
				enable_slappy_hands <= 0;
				oled_data <= oled_volbar;
				if (print_white) oled_data <= `WHITE;
				else if (print_grey) oled_data <= `GREY;
				else if (print_triangle) oled_data <= `MENUTRIANGLE;
				else if (menu_state == 2) oled_data <= screem_hero_bg[pixel_index];
				else if (menuscreen[pixel_index] == `TRANSPARENT)
				    begin
						if (menu_state == 1) oled_data <= `BLACK;
						else if (menu_state == 3) oled_data <= waveform_bg[pixel_index];
						else if (menu_state == 4) oled_data <= bbw_bg[pixel_index];
						else if (menu_state == 5) oled_data <= player1_attack_bg[pixel_index];
					end
				else 
					oled_data <=  menuscreen[pixel_index];
				end
			1:  begin //Volume Bar
				enable_menu <= 0;
				enable_volbar <= 1;
				enable_screem <= 0;
				enable_bbw <= 0;
				enable_slappy_hands <= 0;
				oled_data <= oled_volbar;
				end
			2: 	begin //Screem Hero
				enable_menu <= 0;
				enable_volbar <= 0;
				enable_screem <= 1;
				enable_bbw <= 0;
				enable_slappy_hands <= 0;
				oled_data <= oled_screem;
				end
			3:  begin //Waveform
				enable_menu <= 0;
				enable_volbar <= 0;
				enable_bbw <= 0;
				enable_slappy_hands <= 0;
				oled_data <= oled_waveform;
				end
			4:  begin //Big Bad Wolf
				enable_menu <= 0;
				enable_bbw <= 1	;
				enable_slappy_hands <= 0;
				oled_data <= oled_bbw;
				end
			5:  begin //Slappy Hands
				enable_menu <= 0;
				enable_volbar <= 0;
				enable_screem <= 0;
				enable_bbw <= 0;
				enable_slappy_hands <= 1;
				oled_data <= oled_slappy;
				end 
		endcase
	end
	
	
endmodule
