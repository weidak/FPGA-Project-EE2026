`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2021 20:28:50
// Design Name: 
// Module Name: print_cathero
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


module print_cathero(
	input [7:0] x, y, x_start, y_start,
	output print_cat,
	output reg [15:0] oled_data
    );
	
	assign print_cat = ((y == y_start + 0 && x == x_start + 3) ||
						(y == y_start + 0 && x == x_start + 4) ||
						(y == y_start + 1 && x >= x_start + 2 && x <= x_start + 3 ) ||
						(y == y_start + 1 && x == x_start + 4) ||
						(y == y_start + 1 && x == x_start + 8) ||
						(y == y_start + 1 && x == x_start + 13) ||
						(y == y_start + 2 && x == x_start + 1) ||
						(y == y_start + 2 && x == x_start + 2) ||
						(y == y_start + 2 && x == x_start + 3) ||
						(y == y_start + 2 && x == x_start + 4) ||
						(y == y_start + 2 && x == x_start + 7) ||
						(y == y_start + 2 && x == x_start + 8) ||
						(y == y_start + 2 && x == x_start + 9) ||
						(y == y_start + 2 && x == x_start + 12) ||
						(y == y_start + 2 && x == x_start + 13) ||
						(y == y_start + 2 && x == x_start + 14) ||
						(y == y_start + 3 && x == x_start + 0) ||
						(y == y_start + 3 && x == x_start + 1) ||
						(y == y_start + 3 && x == x_start + 2) ||
						(y == y_start + 3 && x == x_start + 3) ||
						(y == y_start + 3 && x == x_start + 7) ||
						(y == y_start + 3 && x == x_start + 8) ||
						(y == y_start + 3 && x >= x_start + 9 && x <= x_start + 13 ) ||
						(y == y_start + 3 && x == x_start + 14) ||
						(y == y_start + 4 && x == x_start + 0) ||
						(y == y_start + 4 && x == x_start + 1) ||
						(y == y_start + 4 && x == x_start + 2) ||
						(y == y_start + 4 && x == x_start + 7) ||
						(y == y_start + 4 && x >= x_start + 8 && x <= x_start + 13 ) ||
						(y == y_start + 4 && x >= x_start + 14 && x <= x_start + 15 ) ||
						(y == y_start + 5 && x == x_start + 0) ||
						(y == y_start + 5 && x == x_start + 1) ||
						(y == y_start + 5 && x == x_start + 2) ||
						(y == y_start + 5 && x >= x_start + 5 && x <= x_start + 7 ) ||
						(y == y_start + 5 && x >= x_start + 8 && x <= x_start + 9 ) ||
						(y == y_start + 5 && x == x_start + 10) ||
						(y == y_start + 5 && x >= x_start + 11 && x <= x_start + 12 ) ||
						(y == y_start + 5 && x == x_start + 13) ||
						(y == y_start + 5 && x == x_start + 14) ||
						(y == y_start + 5 && x == x_start + 15) ||
						(y == y_start + 5 && x == x_start + 16) ||
						(y == y_start + 6 && x == x_start + 0) ||
						(y == y_start + 6 && x == x_start + 1) ||
						(y == y_start + 6 && x == x_start + 2) ||
						(y == y_start + 6 && x == x_start + 6) ||
						(y == y_start + 6 && x >= x_start + 7 && x <= x_start + 11 ) ||
						(y == y_start + 6 && x == x_start + 12) ||
						(y == y_start + 6 && x >= x_start + 13 && x <= x_start + 14 ) ||
						(y == y_start + 6 && x == x_start + 15) ||
						(y == y_start + 7 && x == x_start + 0) ||
						(y == y_start + 7 && x == x_start + 1) ||
						(y == y_start + 7 && x >= x_start + 2 && x <= x_start + 3 ) ||
						(y == y_start + 7 && x == x_start + 4) ||
						(y == y_start + 7 && x >= x_start + 5 && x <= x_start + 7 ) ||
						(y == y_start + 7 && x >= x_start + 8 && x <= x_start + 10 ) ||
						(y == y_start + 7 && x == x_start + 11) ||
						(y == y_start + 7 && x == x_start + 12) ||
						(y == y_start + 7 && x == x_start + 13) ||
						(y == y_start + 7 && x == x_start + 14) ||
						(y == y_start + 7 && x == x_start + 15) ||
						(y == y_start + 7 && x == x_start + 16) ||
						(y == y_start + 8 && x == x_start + 1) ||
						(y == y_start + 8 && x == x_start + 2) ||
						(y == y_start + 8 && x >= x_start + 3 && x <= x_start + 5 ) ||
						(y == y_start + 8 && x == x_start + 6) ||
						(y == y_start + 8 && x >= x_start + 7 && x <= x_start + 11 ) ||
						(y == y_start + 8 && x >= x_start + 12 && x <= x_start + 14 ) ||
						(y == y_start + 8 && x == x_start + 15) ||
						(y == y_start + 9 && x >= x_start + 2 && x <= x_start + 3 ) ||
						(y == y_start + 9 && x >= x_start + 4 && x <= x_start + 6 ) ||
						(y == y_start + 9 && x == x_start + 7) ||
						(y == y_start + 9 && x >= x_start + 8 && x <= x_start + 10 ) ||
						(y == y_start + 9 && x >= x_start + 11 && x <= x_start + 13 ) ||
						(y == y_start + 9 && x == x_start + 14) ||
						(y == y_start + 9 && x == x_start + 15) ||
						(y == y_start + 10 && x == x_start + 3) ||
						(y == y_start + 10 && x >= x_start + 4 && x <= x_start + 6 ) ||
						(y == y_start + 10 && x == x_start + 7) ||
						(y == y_start + 10 && x >= x_start + 8 && x <= x_start + 10 ) ||
						(y == y_start + 10 && x >= x_start + 11 && x <= x_start + 12 ) ||
						(y == y_start + 10 && x == x_start + 13) ||
						(y == y_start + 10 && x == x_start + 14) ||
						(y == y_start + 11 && x == x_start + 2) ||
						(y == y_start + 11 && x >= x_start + 3 && x <= x_start + 4 ) ||
						(y == y_start + 11 && x >= x_start + 5 && x <= x_start + 9 ) ||
						(y == y_start + 11 && x == x_start + 10) ||
						(y == y_start + 11 && x >= x_start + 11 && x <= x_start + 13 ) ||
						(y == y_start + 11 && x == x_start + 14) ||
						(y == y_start + 12 && x == x_start + 2) ||
						(y == y_start + 12 && x == x_start + 3) ||
						(y == y_start + 12 && x >= x_start + 5 && x <= x_start + 6 ) ||
						(y == y_start + 12 && x == x_start + 9) ||
						(y == y_start + 12 && x == x_start + 10) ||
						(y == y_start + 12 && x == x_start + 13) ||
						(y == y_start + 12 && x == x_start + 14) ||
						(y == y_start + 13 && x == x_start + 2) ||
						(y == y_start + 13 && x == x_start + 5) ||
						(y == y_start + 13 && x == x_start + 10) ||
						(y == y_start + 13 && x == x_start + 13));
	
	always @(*)
	begin
		if ((y == y_start + 0 && x == x_start + 3) ||
			(y == y_start + 1 && x >= x_start + 2 && x <= x_start + 3 ) ||
			(y == y_start + 1 && x == x_start + 8) ||
			(y == y_start + 1 && x == x_start + 13) ||
			(y == y_start + 2 && x == x_start + 1) ||
			(y == y_start + 2 && x == x_start + 7) ||
			(y == y_start + 2 && x == x_start + 9) ||
			(y == y_start + 2 && x == x_start + 12) ||
			(y == y_start + 2 && x == x_start + 14) ||
			(y == y_start + 3 && x == x_start + 0) ||
			(y == y_start + 3 && x == x_start + 7) ||
			(y == y_start + 3 && x == x_start + 14) ||
			(y == y_start + 4 && x == x_start + 0) ||
			(y == y_start + 4 && x == x_start + 7) ||
			(y == y_start + 4 && x >= x_start + 14 && x <= x_start + 15 ) ||
			(y == y_start + 5 && x == x_start + 0) ||
			(y == y_start + 5 && x == x_start + 15) ||
			(y == y_start + 6 && x == x_start + 0) ||
			(y == y_start + 6 && x == x_start + 15) ||
			(y == y_start + 7 && x == x_start + 0) ||
			(y == y_start + 7 && x == x_start + 4) ||
			(y == y_start + 7 && x == x_start + 15) ||
			(y == y_start + 8 && x == x_start + 15) ||
			(y == y_start + 9 && x == x_start + 14) ||
			(y == y_start + 11 && x >= x_start + 3 && x <= x_start + 4 ) ||
			(y == y_start + 11 && x == x_start + 10) ||
			(y == y_start + 11 && x == x_start + 14) ||
			(y == y_start + 12 && x == x_start + 3) ||
			(y == y_start + 12 && x >= x_start + 5 && x <= x_start + 6 ) ||
			(y == y_start + 12 && x == x_start + 10) ||
			(y == y_start + 12 && x == x_start + 14) ||
			(y == y_start + 13 && x == x_start + 5) ||
			(y == y_start + 13 && x == x_start + 10)) oled_data <= 16'h39e7;
		else if ((y == y_start + 0 && x == x_start + 4) ||
				(y == y_start + 2 && x == x_start + 3) ||
				(y == y_start + 3 && x == x_start + 2) ||
				(y == y_start + 4 && x == x_start + 2) ||
				(y == y_start + 5 && x == x_start + 1) ||
				(y == y_start + 6 && x == x_start + 1) ||
				(y == y_start + 7 && x >= x_start + 2 && x <= x_start + 3 ) ||
				(y == y_start + 8 && x == x_start + 2) ||
				(y == y_start + 9 && x >= x_start + 2 && x <= x_start + 3 ) ||
				(y == y_start + 9 && x == x_start + 15) ||
				(y == y_start + 10 && x == x_start + 3) ||
				(y == y_start + 10 && x == x_start + 13)) oled_data <= 16'h630c;
		else if ((y == y_start + 1 && x == x_start + 4) ||
				(y == y_start + 2 && x == x_start + 4) ||
				(y == y_start + 3 && x == x_start + 1) ||
				(y == y_start + 3 && x >= x_start + 9 && x <= x_start + 13 ) ||
				(y == y_start + 4 && x == x_start + 1) ||
				(y == y_start + 4 && x >= x_start + 8 && x <= x_start + 13 ) ||
				(y == y_start + 5 && x == x_start + 2) ||
				(y == y_start + 5 && x >= x_start + 8 && x <= x_start + 9 ) ||
				(y == y_start + 5 && x >= x_start + 11 && x <= x_start + 12 ) ||
				(y == y_start + 5 && x == x_start + 14) ||
				(y == y_start + 6 && x == x_start + 2) ||
				(y == y_start + 6 && x >= x_start + 7 && x <= x_start + 11 ) ||
				(y == y_start + 6 && x >= x_start + 13 && x <= x_start + 14 ) ||
				(y == y_start + 7 && x >= x_start + 8 && x <= x_start + 10 ) ||
				(y == y_start + 8 && x >= x_start + 3 && x <= x_start + 5 ) ||
				(y == y_start + 8 && x >= x_start + 7 && x <= x_start + 11 ) ||
				(y == y_start + 9 && x >= x_start + 4 && x <= x_start + 6 ) ||
				(y == y_start + 9 && x >= x_start + 8 && x <= x_start + 10 ) ||
				(y == y_start + 10 && x >= x_start + 4 && x <= x_start + 6 ) ||
				(y == y_start + 10 && x >= x_start + 8 && x <= x_start + 10)) oled_data <= 16'hfd47;
		else if ((y == y_start + 2 && x == x_start + 2) ||
				(y == y_start + 7 && x == x_start + 1) ||
				(y == y_start + 8 && x == x_start + 1) ||
				(y == y_start + 10 && x == x_start + 14) ||
				(y == y_start + 11 && x == x_start + 2) ||
				(y == y_start + 11 && x >= x_start + 5 && x <= x_start + 9 ) ||
				(y == y_start + 12 && x == x_start + 2) ||
				(y == y_start + 12 && x == x_start + 9) ||
				(y == y_start + 12 && x == x_start + 13) ||
				(y == y_start + 13 && x == x_start + 2) ||
				(y == y_start + 13 && x == x_start + 13)) oled_data <= 16'h2104;
		else if ((y == y_start + 2 && x == x_start + 8) ||
				(y == y_start + 2 && x == x_start + 13) ||
				(y == y_start + 3 && x == x_start + 8)) oled_data <= 16'h9b23;
		else if ((y == y_start + 5 && x >= x_start + 5 && x <= x_start + 7 ) ||
				(y == y_start + 5 && x == x_start + 10) ||
				(y == y_start + 5 && x == x_start + 13) ||
				(y == y_start + 5 && x == x_start + 16) ||
				(y == y_start + 6 && x == x_start + 12) ||
				(y == y_start + 7 && x >= x_start + 5 && x <= x_start + 7 ) ||
				(y == y_start + 7 && x == x_start + 11) ||
				(y == y_start + 7 && x == x_start + 13) ||
				(y == y_start + 7 && x == x_start + 16)) oled_data <= 16'h3800;
		else if ((y == y_start + 7 && x == x_start + 14) ||
				(y == y_start + 8 && x >= x_start + 12 && x <= x_start + 14 ) ||
				(y == y_start + 9 && x >= x_start + 11 && x <= x_start + 13 ) ||
				(y == y_start + 10 && x >= x_start + 11 && x <= x_start + 12 )) oled_data <= 16'hfed5;
		else if (y == y_start + 7 && x == x_start + 12) oled_data <= 16'hfc51;
	end
endmodule
