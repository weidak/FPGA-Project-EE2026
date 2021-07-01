`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*  
   VOLUME BAR 
   
   sw[0]: 1 for 1px border, 0 for no border
   sw[1]: 1 for 3px border, 0 for no border (if both sw[0] and sw[1] on, it will just be 3px)
   sw[2]: 1 for new colour theme, 0 for classic
   sw[3]: 0 for volume bar, 1 for none
   sw[4]: 0 for number, 1 for none
   btnL: move volume bar left by 1px
   btnR: move volume bar right by 1px
   
*/
//////////////////////////////////////////////////////////////////////////////////
`include "define.vh"

module volbar_disp(
	input game_enable,
	input CLK100MHZ, clock_6pt25mhz, clock_25hz,
	input buttonL, buttonR,
	input [4:0] sw,
	input [3:0] volume,
	input [7:0] x, y,
	output reg [15:0] oled_data
    );
	
	reg[7:0] x_start = 38;
	reg[7:0] x_end = 58;
	wire[15:0] vol;
	wire print_number; 
	
	
	print_number vol_num(.num(volume), .x(x), .y(y), .num_x_start(80), .num_y_start(5), .print(print_number));
	
	always @(posedge clock_25hz)
	begin
		if (buttonL == 1 && game_enable && x_start > 4)
			begin
				x_start <= x_start - 1; 
				x_end <= x_end - 1;
			end
		if (buttonR == 1 && game_enable && x_end < 91)
			begin
				x_start <= x_start + 1;
				x_end <= x_end + 1;
			end
	end
	
	
	assign vol[0] = (volume >= 0 && y <= 14);
	assign vol[1] = (volume >= 1) &&  (y == 57 || y == 58);
	assign vol[2] = (volume >= 2) && (y == 54 || y == 55);
	assign vol[3] = (volume >= 3) && (y == 51 || y == 52);
	assign vol[4] = (volume >= 4) && (y == 48 || y == 49);
	assign vol[5] = (volume >= 5) && (y == 45 || y == 46);
	assign vol[6] = (volume >= 6) && (y == 42 || y == 43);
	assign vol[7] = (volume >= 7) && (y == 39 || y == 40);
	assign vol[8] = (volume >= 8) && (y == 36 || y == 37);
	assign vol[9] = (volume >= 9) && (y == 33 || y == 34);
	assign vol[10] = (volume >= 10) && (y == 30 || y == 31);
	assign vol[11] = (volume >= 11) && (y == 27 || y == 28);
	assign vol[12] = (volume >= 12) && (y == 24 || y == 25);
	assign vol[13] = (volume >= 13) && (y == 21 || y == 22);
	assign vol[14] = (volume >= 14) && (y == 18 || y == 19);
	assign vol[15] = (volume >= 15) && (y == 15 || y == 16);
	integer i;



	always @(posedge clock_6pt25mhz)
	begin	
		if (print_number && !sw[4]) 
			oled_data <= (sw[2]) ? `THEME2BORDER : `WHITE;
		else if (x >= 80 && x <= 89 && y >= 5 && y <= 11)
			oled_data <= (sw[2]) ? `WHITE : `BLACK;
		else if (x >= x_start && x <= x_end && !sw[3]) 
			begin 
				 if (vol[1])  	oled_data <= (sw[2]) ? `THEME2TIER1 : `THEME1TIER1;
				 if (vol[2])  	oled_data <= (sw[2]) ? `THEME2TIER1 : `THEME1TIER1;
				 if (vol[3])  	oled_data <= (sw[2]) ? `THEME2TIER1 : `THEME1TIER1;
				 if (vol[4])  	oled_data <= (sw[2]) ? `THEME2TIER1 : `THEME1TIER1;
				 if (vol[5])  	oled_data <= (sw[2]) ? `THEME2TIER1 : `THEME1TIER1;
				 if (vol[6])  	oled_data <= (sw[2]) ? `THEME2TIER2 : `THEME1TIER2;
				 if (vol[7])  	oled_data <= (sw[2]) ? `THEME2TIER2 : `THEME1TIER2;
				 if (vol[8])  	oled_data <= (sw[2]) ? `THEME2TIER2 : `THEME1TIER2;
				 if (vol[9])  	oled_data <= (sw[2]) ? `THEME2TIER2 : `THEME1TIER2;
				 if (vol[10])  	oled_data <= (sw[2]) ? `THEME2TIER2 : `THEME1TIER2;
				 if (vol[11]) 	oled_data <= (sw[2]) ? `THEME2TIER3 : `THEME1TIER3;
				 if (vol[12]) 	oled_data <= (sw[2]) ? `THEME2TIER3 : `THEME1TIER3;
				 if (vol[13]) 	oled_data <= (sw[2]) ? `THEME2TIER3 : `THEME1TIER3;
				 if (vol[14]) 	oled_data <= (sw[2]) ? `THEME2TIER3 : `THEME1TIER3;
				 if (vol[15]) 	oled_data <= (sw[2]) ? `THEME2TIER3 : `THEME1TIER3;
			end
		else if (sw[1] == 1 && ((((x >= 3 && x <= 95) && (y >= 0 && y <= 2))|| (y >= 61 && y <= 63)) || 
			((y >= 0 && y <= 63) && ((x >= 0 && x <= 2) || (x >= 93 && x <= 95)))))
			oled_data <= (sw[2]) ? `THEME2BORDER : `WHITE; //3px border
		else if (sw[0] == 1 && (((x >= 0 && x <= 95) && (y == 0 || y == 63)) || ((y >= 0 && y <= 63) && (x == 0 || x== 95)))) 
			oled_data <= (sw[2]) ? `THEME2BORDER : `WHITE; //1px border
		else 
			oled_data <= (sw[2]) ? `WHITE : `BLACK;		
	end
	
endmodule