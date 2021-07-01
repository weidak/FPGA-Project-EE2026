`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2021 09:48:41 PM
// Design Name: 
// Module Name: print_cloud
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


module print_cloud(
	input [7:0]x, y, x_start, y_start,
	output print_cloud,
	output reg [15:0] oled_data
	);
	
	assign print_cloud = ((y == y_start + 0 && x >= x_start + 12 && x <= x_start + 14 ) ||
				(y == y_start + 1 && x == x_start + 11) ||
				(y == y_start + 1 && x >= x_start + 12 && x <= x_start + 14 ) ||
				(y == y_start + 1 && x == x_start + 15) ||
				(y == y_start + 2 && x == x_start + 10) ||
				(y == y_start + 2 && x == x_start + 11) ||
				(y == y_start + 2 && x >= x_start + 12 && x <= x_start + 15 ) ||
				(y == y_start + 2 && x == x_start + 16) ||
				(y == y_start + 3 && x == x_start + 9) ||
				(y == y_start + 3 && x == x_start + 10) ||
				(y == y_start + 3 && x >= x_start + 11 && x <= x_start + 16 ) ||
				(y == y_start + 3 && x == x_start + 17) ||
				(y == y_start + 4 && x >= x_start + 6 && x <= x_start + 8 ) ||
				(y == y_start + 4 && x == x_start + 9) ||
				(y == y_start + 4 && x >= x_start + 10 && x <= x_start + 17 ) ||
				(y == y_start + 4 && x == x_start + 18) ||
				(y == y_start + 5 && x == x_start + 5) ||
				(y == y_start + 5 && x >= x_start + 6 && x <= x_start + 8 ) ||
				(y == y_start + 5 && x >= x_start + 9 && x <= x_start + 17 ) ||
				(y == y_start + 5 && x == x_start + 18) ||
				(y == y_start + 6 && x == x_start + 5) ||
				(y == y_start + 6 && x == x_start + 6) ||
				(y == y_start + 6 && x >= x_start + 7 && x <= x_start + 17 ) ||
				(y == y_start + 6 && x >= x_start + 18 && x <= x_start + 20 ) ||
				(y == y_start + 7 && x >= x_start + 2 && x <= x_start + 4 ) ||
				(y == y_start + 7 && x == x_start + 5) ||
				(y == y_start + 7 && x >= x_start + 6 && x <= x_start + 17 ) ||
				(y == y_start + 7 && x >= x_start + 18 && x <= x_start + 20 ) ||
				(y == y_start + 7 && x == x_start + 21) ||
				(y == y_start + 8 && x == x_start + 1) ||
				(y == y_start + 8 && x >= x_start + 2 && x <= x_start + 5 ) ||
				(y == y_start + 8 && x >= x_start + 6 && x <= x_start + 20 ) ||
				(y == y_start + 8 && x == x_start + 21) ||
				(y == y_start + 8 && x == x_start + 22) ||
				(y == y_start + 9 && x == x_start + 0) ||
				(y == y_start + 9 && x == x_start + 1) ||
				(y == y_start + 9 && x >= x_start + 2 && x <= x_start + 21 ) ||
				(y == y_start + 9 && x == x_start + 22) ||
				(y == y_start + 9 && x == x_start + 23) ||
				(y == y_start + 10 && x == x_start + 0) ||
				(y == y_start + 10 && x == x_start + 1) ||
				(y == y_start + 10 && x >= x_start + 2 && x <= x_start + 21 ) ||
				(y == y_start + 10 && x == x_start + 22) ||
				(y == y_start + 10 && x == x_start + 23) ||
				(y == y_start + 11 && x == x_start + 0) ||
				(y == y_start + 11 && x == x_start + 1) ||
				(y == y_start + 11 && x >= x_start + 2 && x <= x_start + 20 ) ||
				(y == y_start + 11 && x >= x_start + 21 && x <= x_start + 22 ) ||
				(y == y_start + 11 && x == x_start + 23) ||
				(y == y_start + 12 && x == x_start + 1) ||
				(y == y_start + 12 && x >= x_start + 2 && x <= x_start + 19 ) ||
				(y == y_start + 12 && x >= x_start + 20 && x <= x_start + 21 ) ||
				(y == y_start + 12 && x == x_start + 22) ||
				(y == y_start + 13 && x == x_start + 2) ||
				(y == y_start + 13 && x >= x_start + 3 && x <= x_start + 13 ) ||
				(y == y_start + 13 && x >= x_start + 14 && x <= x_start + 20 ) ||
				(y == y_start + 13 && x == x_start + 21) ||
				(y == y_start + 14 && x >= x_start + 3 && x <= x_start + 20 ) ||
				(y == y_start + 14 && x == x_start + 21));
	
	
	always @ (*)
	begin
		if ((y == y_start + 0 && x >= x_start + 12 && x <= x_start + 14 ) ||
			(y == y_start + 1 && x == x_start + 11) ||
			(y == y_start + 1 && x == x_start + 15) ||
			(y == y_start + 2 && x == x_start + 10) ||
			(y == y_start + 2 && x == x_start + 16) ||
			(y == y_start + 3 && x == x_start + 9) ||
			(y == y_start + 3 && x == x_start + 17) ||
			(y == y_start + 4 && x >= x_start + 6 && x <= x_start + 8 ) ||
			(y == y_start + 4 && x == x_start + 18) ||
			(y == y_start + 5 && x == x_start + 5) ||
			(y == y_start + 5 && x == x_start + 18) ||
			(y == y_start + 6 && x == x_start + 5) ||
			(y == y_start + 6 && x >= x_start + 18 && x <= x_start + 20 ) ||
			(y == y_start + 7 && x >= x_start + 2 && x <= x_start + 4 ) ||
			(y == y_start + 7 && x == x_start + 21) ||
			(y == y_start + 8 && x == x_start + 1) ||
			(y == y_start + 8 && x == x_start + 22) ||
			(y == y_start + 9 && x == x_start + 0) ||
			(y == y_start + 9 && x == x_start + 23) ||
			(y == y_start + 10 && x == x_start + 0) ||
			(y == y_start + 10 && x == x_start + 23) ||
			(y == y_start + 11 && x == x_start + 0) ||
			(y == y_start + 11 && x == x_start + 23) ||
			(y == y_start + 12 && x == x_start + 1) ||
			(y == y_start + 12 && x == x_start + 22) ||
			(y == y_start + 13 && x == x_start + 2) ||
			(y == y_start + 13 && x == x_start + 21) ||
			(y == y_start + 14 && x >= x_start + 3 && x <= x_start + 20 )) oled_data <= 16'h2945;
			
		else if ((y == y_start + 1 && x >= x_start + 12 && x <= x_start + 14 ) ||
				(y == y_start + 2 && x == x_start + 11) ||
				(y == y_start + 3 && x == x_start + 10) ||
				(y == y_start + 4 && x == x_start + 9) ||
				(y == y_start + 5 && x >= x_start + 6 && x <= x_start + 8 ) ||
				(y == y_start + 6 && x == x_start + 6) ||
				(y == y_start + 7 && x == x_start + 5) ||
				(y == y_start + 8 && x >= x_start + 2 && x <= x_start + 5 ) ||
				(y == y_start + 9 && x == x_start + 1) ||
				(y == y_start + 10 && x == x_start + 1) ||
				(y == y_start + 11 && x == x_start + 1)) oled_data <= 16'hffff;
				
		else if ((y == y_start + 2 && x >= x_start + 12 && x <= x_start + 15 ) ||
				(y == y_start + 3 && x >= x_start + 11 && x <= x_start + 16 ) ||
				(y == y_start + 4 && x >= x_start + 10 && x <= x_start + 17 ) ||
				(y == y_start + 5 && x >= x_start + 9 && x <= x_start + 17 ) ||
				(y == y_start + 6 && x >= x_start + 7 && x <= x_start + 17 ) ||
				(y == y_start + 7 && x >= x_start + 6 && x <= x_start + 17 ) ||
				(y == y_start + 8 && x >= x_start + 6 && x <= x_start + 20 ) ||
				(y == y_start + 9 && x >= x_start + 2 && x <= x_start + 21 ) ||
				(y == y_start + 10 && x >= x_start + 2 && x <= x_start + 21 ) ||
				(y == y_start + 11 && x >= x_start + 2 && x <= x_start + 20 ) ||
				(y == y_start + 12 && x >= x_start + 2 && x <= x_start + 19 ) ||
				(y == y_start + 13 && x >= x_start + 3 && x <= x_start + 13 )) oled_data <= 16'he73c;
	
	end
	
endmodule
