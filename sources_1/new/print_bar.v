`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2021 20:59:08
// Design Name: 
// Module Name: print_bar
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

`define LVLdiff 2
`define LVL1 64
`define LVL2 (`LVL1 - `LVLdiff)
`define LVL3 (`LVL2 - `LVLdiff)
`define LVL4 (`LVL3 - `LVLdiff)
`define LVL5 (`LVL4 - `LVLdiff)
`define LVL6 (`LVL5 - `LVLdiff)
`define LVL7 (`LVL6 - `LVLdiff)
`define LVL8 (`LVL7 - `LVLdiff)
`define LVL9 (`LVL8 - `LVLdiff)
`define LVL10 (`LVL9 - `LVLdiff)
`define LVL11 (`LVL10 - `LVLdiff)
`define LVL12 (`LVL11 - `LVLdiff)
`define LVL13 (`LVL12 - `LVLdiff)
`define LVL14 (`LVL13 - `LVLdiff)
`define LVL15 (`LVL14 - `LVLdiff)
`define LVL16 (`LVL15 - `LVLdiff)
`define LVL17 (`LVL16 - `LVLdiff)
`define LVL18 (`LVL17 - `LVLdiff)
`define LVL19 (`LVL18 - `LVLdiff)
`define LVL20 (`LVL19 - `LVLdiff)
`define LVL21 (`LVL20 - `LVLdiff)
`define LVL22 (`LVL21 - `LVLdiff)
`define LVL23 (`LVL22 - `LVLdiff)
`define LVL24 (`LVL23 - `LVLdiff)
`define LVL25 (`LVL24 - `LVLdiff)
`define LVL26 (`LVL25 - `LVLdiff)
`define LVL27 (`LVL26 - `LVLdiff)
`define LVL28 (`LVL27 - `LVLdiff)
`define LVL29 (`LVL28 - `LVLdiff)
`define LVL30 (`LVL29 - `LVLdiff)
`define LVL31 (`LVL30 - `LVLdiff)
`define LVL32 (`LVL31 - `LVLdiff)



module print_bar(
	input clock_6pt25mhz,
	input [4:0] sw,
	input [11:0] mic_in,
	input [4:0] volume,
	input [3:0] volume1,
	input [7:0] x, y, x_start,
	output reg [15:0] oled_data
    );
	
	wire [32:0] vol;
	wire [32:0] vol1;
	wire [11:0] y_inverse;
	
	wire [11:0] y_middle;
	wire [11:0] y;
	
	assign y_inverse = 64 - y;
	

	//Full screen mode
	assign vol[0] = (volume >= 0) && (y < `LVL1 && y >= `LVL2);
	assign vol[1] = (volume >= 1) && (y < `LVL2 && y >= `LVL3);
	assign vol[2] = (volume >= 2) && (y < `LVL3 && y >= `LVL4);
	assign vol[3] = (volume >= 3) && (y < `LVL4 && y >= `LVL5);
	assign vol[4] = (volume >= 4) && (y < `LVL5 && y >= `LVL6);
	assign vol[5] = (volume >= 5) && (y < `LVL6 && y >= `LVL7);
	assign vol[6] = (volume >= 6) && (y < `LVL7 && y >= `LVL8);
	assign vol[7] = (volume >= 7) && (y < `LVL8 && y >= `LVL9);
	assign vol[8] = (volume >= 8) && (y < `LVL9 && y >= `LVL10);
	assign vol[9] = (volume >= 9) && (y < `LVL10 && y >= `LVL11);
	assign vol[10] = (volume >= 10) && (y < `LVL11 && y >= `LVL12);
	assign vol[11] = (volume >= 11) && (y < `LVL12 && y >= `LVL13);
	assign vol[12] = (volume >= 12) && (y < `LVL13 && y >= `LVL14);
	assign vol[13] = (volume >= 13) && (y < `LVL14 && y >= `LVL15);
	assign vol[14] = (volume >= 14) && (y < `LVL15 && y >= `LVL16);
	assign vol[15] = (volume >= 15) && (y < `LVL16 && y >= `LVL17);
	assign vol[16] = (volume >= 16) && (y < `LVL17 && y >= `LVL18);
	assign vol[17] = (volume >= 17) && (y < `LVL18 && y >= `LVL19);
	assign vol[19] = (volume >= 18) && (y < `LVL19 && y >= `LVL20);
	assign vol[20] = (volume >= 19) && (y < `LVL20 && y >= `LVL21);
	assign vol[21] = (volume >= 20) && (y < `LVL21 && y >= `LVL22);
	assign vol[22] = (volume >= 21) && (y < `LVL22 && y >= `LVL23);
	assign vol[23] = (volume >= 22) && (y < `LVL23 && y >= `LVL24);
	assign vol[24] = (volume >= 23) && (y < `LVL24 && y >= `LVL25);
	assign vol[25] = (volume >= 24) && (y < `LVL25 && y >= `LVL26);
	assign vol[26] = (volume >= 25) && (y < `LVL26 && y >= `LVL27);
	assign vol[27] = (volume >= 26) && (y < `LVL27 && y >= `LVL28);
	assign vol[28] = (volume >= 27) && (y < `LVL28 && y >= `LVL29);
	assign vol[29] = (volume >= 28) && (y < `LVL29 && y >= `LVL30);
	assign vol[30] = (volume >= 29) && (y < `LVL30 && y >= `LVL31);
	assign vol[31] = (volume >= 30) && (y < `LVL31 && y >= `LVL32);
	assign vol[32] = (volume >= 31) && (y < `LVL32);
	
	//inverse wave when sw[1] is toggled
	assign vol1[0] = (volume1 >= 0) && (y < `LVL1 - 32 && y >= `LVL2 - 32);
	assign vol1[1] = (volume1 >= 1) && (y < `LVL2 - 32 && y >= `LVL3 - 32);
	assign vol1[2] = (volume1 >= 2) && (y < `LVL3 - 32 && y >= `LVL4 - 32);
	assign vol1[3] = (volume1 >= 3) && (y < `LVL4 - 32 && y >= `LVL5 - 32);
	assign vol1[4] = (volume1 >= 4) && (y < `LVL5 - 32 && y >= `LVL6 - 32);
	assign vol1[5] = (volume1 >= 5) && (y < `LVL6 - 32 && y >= `LVL7 - 32);
	assign vol1[6] = (volume1 >= 6) && (y < `LVL7 - 32 && y >= `LVL8 - 32);
	assign vol1[7] = (volume1 >= 7) && (y < `LVL8 - 32 && y >= `LVL9 - 32);
	assign vol1[8] = (volume1 >= 8) && (y < `LVL9 - 32 && y >= `LVL10 - 32);
	assign vol1[9] = (volume1 >= 9) && (y < `LVL10 - 32 && y >= `LVL11 - 32);
	assign vol1[10] = (volume1 >= 10) && (y < `LVL11 - 32 && y >= `LVL12 - 32);
	assign vol1[11] = (volume1 >= 11) && (y < `LVL12 - 32 && y >= `LVL13 - 32);
	assign vol1[12] = (volume1 >= 12) && (y < `LVL13 - 32 && y >= `LVL14 - 32);
	assign vol1[13] = (volume1 >= 13) && (y < `LVL14 - 32 && y >= `LVL15 - 32);
	assign vol1[14] = (volume1 >= 14) && (y < `LVL15 - 32 && y >= `LVL16 - 32);
	assign vol1[15] = (volume1 >= 15) && (y < `LVL16 - 32 && y >= `LVL17 - 32);
	
	assign vol1[16] = (volume1 >= 0) && (y_inverse > `LVL18 && y_inverse <=  `LVL17);
	assign vol1[17] = (volume1 >= 1) && (y_inverse >  `LVL19 && y_inverse <=  `LVL18);
	assign vol1[19] = (volume1 >= 2) && (y_inverse >  `LVL20 && y_inverse <= `LVL19);
	assign vol1[20] = (volume1 >= 3) && (y_inverse >  `LVL21 && y_inverse <=  `LVL20);
	assign vol1[21] = (volume1 >= 4) && (y_inverse >  `LVL22 && y_inverse <=  `LVL21);
	assign vol1[22] = (volume1 >= 5) && (y_inverse >  `LVL23 && y_inverse <=  `LVL22);
	assign vol1[23] = (volume1 >= 6) && (y_inverse >  `LVL24 && y_inverse <=  `LVL23);
	assign vol1[24] = (volume1 >= 7) && (y_inverse >  `LVL25 && y_inverse <=  `LVL24);
	assign vol1[25] = (volume1 >= 8) && (y_inverse >  `LVL26 && y_inverse <=  `LVL25);
	assign vol1[26] = (volume1 >= 9) && (y_inverse >  `LVL27 && y_inverse <=  `LVL26);
	assign vol1[27] = (volume1 >= 10) && (y_inverse >  `LVL28 && y_inverse <=  `LVL27);
	assign vol1[28] = (volume1 >= 11) && (y_inverse >  `LVL29 && y_inverse <=  `LVL28);
	assign vol1[29] = (volume1 >= 12) && (y_inverse >  `LVL30 && y_inverse <= `LVL29);
	assign vol1[30] = (volume1 >= 13) && (y_inverse >  `LVL31 && y_inverse <=  `LVL30);
	assign vol1[31] = (volume1 >= 14) && (y_inverse >  `LVL32 && y_inverse <=  `LVL31);
	assign vol1[32] = (volume1 >= 15) && (y_inverse <=  `LVL32);





always @(*)
	begin
		// if (x == x_start)
		// begin
			oled_data <= `BLACK;
			if (sw[1]) begin
				if (vol[0])  	oled_data <= (sw[2]) ? `PURPLE_THEME1 : `THEME1TIER1;
				if (vol[1])  	oled_data <= (sw[2]) ? `PURPLE_THEME1 : `THEME1TIER1;
				if (vol[2])  	oled_data <= (sw[2]) ? `PURPLE_THEME1 : `THEME1TIER1;
				if (vol[3])  	oled_data <= (sw[2]) ? `PURPLE_THEME1 : `THEME1TIER1;
				if (vol[4])  	oled_data <= (sw[2]) ? `PURPLE_THEME1h : `THEME1TIER1;
				if (vol[5])  	oled_data <= (sw[2]) ? `PURPLE_THEME1h : `THEME1TIER1;
				if (vol[6])  	oled_data <= (sw[2]) ? `PURPLE_THEME1h : `THEME1TIER1;
				if (vol[7])  	oled_data <= (sw[2]) ? `PURPLE_THEME1h : `THEME1TIER1;
				if (vol[8])  	oled_data <= (sw[2]) ? `PURPLE_THEME2 : `THEME1TIER1;
				if (vol[9])  	oled_data <= (sw[2]) ? `PURPLE_THEME2 : `THEME1TIER1;
				if (vol[10])  	oled_data <= (sw[2]) ? `PURPLE_THEME2 : `THEME1TIER1;
				if (vol[11]) 	oled_data <= (sw[2]) ? `PURPLE_THEME2 : `THEME1TIER2;
				if (vol[12]) 	oled_data <= (sw[2]) ? `PURPLE_THEME2h : `THEME1TIER2;
				if (vol[13]) 	oled_data <= (sw[2]) ? `PURPLE_THEME2h : `THEME1TIER2;
				if (vol[14]) 	oled_data <= (sw[2]) ? `PURPLE_THEME2h : `THEME1TIER2;
				if (vol[15]) 	oled_data <= (sw[2]) ? `PURPLE_THEME2h : `THEME1TIER2;
				//inverse
				if (vol[16])  	oled_data <= (sw[2]) ? `PURPLE_THEME3 : `THEME1TIER2;
				if (vol[17])  	oled_data <= (sw[2]) ? `PURPLE_THEME3 : `THEME1TIER2;
				if (vol[18])  	oled_data <= (sw[2]) ? `PURPLE_THEME3 : `THEME1TIER2;
				if (vol[19])  	oled_data <= (sw[2]) ? `PURPLE_THEME3 : `THEME1TIER2;
				if (vol[20])  	oled_data <= (sw[2]) ? `PURPLE_THEME3h : `THEME1TIER2;
				if (vol[21])  	oled_data <= (sw[2]) ? `PURPLE_THEME3h : `THEME1TIER2;
				if (vol[22])  	oled_data <= (sw[2]) ? `PURPLE_THEME3h : `THEME1TIER3;
				if (vol[23])  	oled_data <= (sw[2]) ? `PURPLE_THEME3h : `THEME1TIER3;
				if (vol[24])  	oled_data <= (sw[2]) ? `PURPLE_THEME4 : `THEME1TIER3;
				if (vol[25])  	oled_data <= (sw[2]) ? `PURPLE_THEME4 : `THEME1TIER3;
				if (vol[26])  	oled_data <= (sw[2]) ? `PURPLE_THEME4 : `THEME1TIER3;
				if (vol[27]) 	oled_data <= (sw[2]) ? `PURPLE_THEME4 : `THEME1TIER3;
				if (vol[28]) 	oled_data <= (sw[2]) ? `PURPLE_THEME4h : `THEME1TIER3;
				if (vol[29]) 	oled_data <= (sw[2]) ? `PURPLE_THEME4h : `THEME1TIER3;
				if (vol[30]) 	oled_data <= (sw[2]) ? `PURPLE_THEME4h : `THEME1TIER3;
				if (vol[31]) 	oled_data <= (sw[2]) ? `PURPLE_THEME4h : `THEME1TIER3;
				if (vol[32]) 	oled_data <= (sw[2]) ? `PURPLE_THEME4h : `THEME1TIER3;
			end
			else begin
				if (vol1[0])  	oled_data <= (sw[2]) ? `PURPLE_THEME1 : `THEME1TIER1;
				if (vol1[1])  	oled_data <= (sw[2]) ? `PURPLE_THEME1 : `THEME1TIER1;
				if (vol1[2])  	oled_data <= (sw[2]) ? `PURPLE_THEME1 : `THEME1TIER1;
				if (vol1[3])  	oled_data <= (sw[2]) ? `PURPLE_THEME1 : `THEME1TIER1;
				if (vol1[4])  	oled_data <= (sw[2]) ? `PURPLE_THEME2 : `THEME1TIER1;
				if (vol1[5])  	oled_data <= (sw[2]) ? `PURPLE_THEME2 : `THEME1TIER1;
				if (vol1[6])  	oled_data <= (sw[2]) ? `PURPLE_THEME2 : `THEME1TIER2;
				if (vol1[7])  	oled_data <= (sw[2]) ? `PURPLE_THEME2 : `THEME1TIER2;
				if (vol1[8])  	oled_data <= (sw[2]) ? `PURPLE_THEME3 : `THEME1TIER2;
				if (vol1[9])  	oled_data <= (sw[2]) ? `PURPLE_THEME3 : `THEME1TIER2;
				if (vol1[10])  	oled_data <= (sw[2]) ? `PURPLE_THEME3 : `THEME1TIER2;
				if (vol1[11]) 	oled_data <= (sw[2]) ? `PURPLE_THEME3 : `THEME1TIER3;
				if (vol1[12]) 	oled_data <= (sw[2]) ? `PURPLE_THEME4h : `THEME1TIER3;
				if (vol1[13]) 	oled_data <= (sw[2]) ? `PURPLE_THEME4h : `THEME1TIER3;
				if (vol1[14]) 	oled_data <= (sw[2]) ? `PURPLE_THEME4h : `THEME1TIER3;
				if (vol1[15]) 	oled_data <= (sw[2]) ? `PURPLE_THEME4h : `THEME1TIER3;
				//inverse
				if (vol1[16])  	oled_data <= (sw[2]) ? `PURPLE_THEME1 : `THEME1TIER1;
				if (vol1[17])  	oled_data <= (sw[2]) ? `PURPLE_THEME1 : `THEME1TIER1;
				if (vol1[18])  	oled_data <= (sw[2]) ? `PURPLE_THEME1 : `THEME1TIER1;
				if (vol1[19])  	oled_data <= (sw[2]) ? `PURPLE_THEME1 : `THEME1TIER1;
				if (vol1[20])  	oled_data <= (sw[2]) ? `PURPLE_THEME2 : `THEME1TIER1;
				if (vol1[21])  	oled_data <= (sw[2]) ? `PURPLE_THEME2 : `THEME1TIER1;
				if (vol1[22])  	oled_data <= (sw[2]) ? `PURPLE_THEME2 : `THEME1TIER2;
				if (vol1[23])  	oled_data <= (sw[2]) ? `PURPLE_THEME2 : `THEME1TIER2;
				if (vol1[24])  	oled_data <= (sw[2]) ? `PURPLE_THEME3 : `THEME1TIER2;
				if (vol1[25])  	oled_data <= (sw[2]) ? `PURPLE_THEME3 : `THEME1TIER2;
				if (vol1[26])  	oled_data <= (sw[2]) ? `PURPLE_THEME3 : `THEME1TIER2;
				if (vol1[27]) 	oled_data <= (sw[2]) ? `PURPLE_THEME3 : `THEME1TIER3;
				if (vol1[28]) 	oled_data <= (sw[2]) ? `PURPLE_THEME4h : `THEME1TIER3;
				if (vol1[29]) 	oled_data <= (sw[2]) ? `PURPLE_THEME4h : `THEME1TIER3;
				if (vol1[30]) 	oled_data <= (sw[2]) ? `PURPLE_THEME4h : `THEME1TIER3;
				if (vol1[31]) 	oled_data <= (sw[2]) ? `PURPLE_THEME4h : `THEME1TIER3;
				if (vol1[32]) 	oled_data <= (sw[2]) ? `PURPLE_THEME4h : `THEME1TIER3;
			end	
	end
	
endmodule