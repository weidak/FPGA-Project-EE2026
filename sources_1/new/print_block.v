`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2021 21:09:28
// Design Name: 
// Module Name: print_block
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


module print_block(
	input [3:0] num,
	input [7:0] x, y, x_end, y_start,
	output print_block,
	output reg [15:0] oled_data
    );
	
	wire [7:0] min_x; 
	assign print_block = ((x >= x_end - 35 && x <= x_end && y >= y_start && y <= y_start + 36));
 
	always @(*)
	begin
		if ((y == y_start + 0 && x <= x_end - 0 && x >= x_end - 35) ||
			(y == y_start + 1 && x <= x_end - 0 && x >= x_end - 35 )) oled_data <= 16'h86e8;
		
		else if ((y == y_start + 2 && x <= x_end - 0 && x >= x_end - 1 ) ||
				(y == y_start + 2 && x == x_end - 3) ||
				(y == y_start + 2 && x <= x_end - 5 && x >= x_end - 7 ) ||
				(y == y_start + 2 && x == x_end - 9) ||
				(y == y_start + 2 && x <= x_end - 12 && x >= x_end - 13 ) ||
				(y == y_start + 2 && x == x_end - 15) ||
				(y == y_start + 2 && x <= x_end - 17 && x >= x_end - 19 ) ||
				(y == y_start + 2 && x == x_end - 21) ||
				(y == y_start + 2 && x <= x_end - 23 && x >= x_end - 25 ) ||
				(y == y_start + 2 && x == x_end - 27) ||
				(y == y_start + 2 && x <= x_end - 30 && x >= x_end - 31 ) ||
				(y == y_start + 2 && x == x_end - 33) ||
				(y == y_start + 2 && x == x_end - 35) ||
				(y == y_start + 3 && x == x_end - 4) ||
				(y == y_start + 3 && x == x_end - 9) ||
				(y == y_start + 3 && x == x_end - 11) ||
				(y == y_start + 3 && x == x_end - 16) ||
				(y == y_start + 3 && x == x_end - 22) ||
				(y == y_start + 3 && x == x_end - 27) ||
				(y == y_start + 3 && x == x_end - 29) ||
				(y == y_start + 3 && x == x_end - 34) ||
				(y == y_start + 4 && x == x_end - 2) ||
				(y == y_start + 4 && x == x_end - 6) ||
				(y == y_start + 4 && x == x_end - 10) ||
				(y == y_start + 4 && x == x_end - 13) ||
				(y == y_start + 4 && x == x_end - 15) ||
				(y == y_start + 4 && x == x_end - 20) ||
				(y == y_start + 4 && x == x_end - 24) ||
				(y == y_start + 4 && x == x_end - 28) ||
				(y == y_start + 4 && x == x_end - 31) ||
				(y == y_start + 4 && x == x_end - 33)) oled_data <= 16'h1d40;
							
		else if ((y == y_start + 2 && x == x_end - 2) ||
				(y == y_start + 2 && x == x_end - 4) ||
				(y == y_start + 2 && x == x_end - 8) ||
				(y == y_start + 2 && x <= x_end - 10 && x >= x_end - 11 ) ||
				(y == y_start + 2 && x == x_end - 14) ||
				(y == y_start + 2 && x == x_end - 16) ||
				(y == y_start + 2 && x == x_end - 20) ||
				(y == y_start + 2 && x == x_end - 22) ||
				(y == y_start + 2 && x == x_end - 26) ||
				(y == y_start + 2 && x <= x_end - 28 && x >= x_end - 29 ) ||
				(y == y_start + 2 && x == x_end - 32) ||
				(y == y_start + 2 && x == x_end - 34) ||
				(y == y_start + 3 && x <= x_end - 0 && x >= x_end - 3 ) ||
				(y == y_start + 3 && x <= x_end - 5 && x >= x_end - 8 ) ||
				(y == y_start + 3 && x == x_end - 10) ||
				(y == y_start + 3 && x <= x_end - 12 && x >= x_end - 15 ) ||
				(y == y_start + 3 && x <= x_end - 17 && x >= x_end - 21 ) ||
				(y == y_start + 3 && x <= x_end - 23 && x >= x_end - 26 ) ||
				(y == y_start + 3 && x == x_end - 28) ||
				(y == y_start + 3 && x <= x_end - 30 && x >= x_end - 33 ) ||
				(y == y_start + 3 && x == x_end - 35) ||
				(y == y_start + 4 && x == x_end - 3) ||
				(y == y_start + 4 && x == x_end - 5) ||
				(y == y_start + 4 && x == x_end - 9) ||
				(y == y_start + 4 && x == x_end - 14) ||
				(y == y_start + 4 && x == x_end - 21) ||
				(y == y_start + 4 && x == x_end - 23) ||
				(y == y_start + 4 && x == x_end - 27) ||
				(y == y_start + 4 && x == x_end - 32)) oled_data <= 16'h1be1;
			
		else if ((y == y_start + 4 && x == x_end - 0) ||
				(y == y_start + 4 && x == x_end - 7) ||
				(y == y_start + 4 && x == x_end - 12) ||
				(y == y_start + 4 && x == x_end - 16) ||
				(y == y_start + 4 && x == x_end - 18) ||
				(y == y_start + 4 && x == x_end - 25) ||
				(y == y_start + 4 && x == x_end - 30) ||
				(y == y_start + 4 && x == x_end - 34) ||
				(y == y_start + 5 && x == x_end - 8) ||
				(y == y_start + 5 && x == x_end - 15) ||
				(y == y_start + 5 && x == x_end - 26) ||
				(y == y_start + 5 && x == x_end - 33) ||
				(y == y_start + 6 && x == x_end - 0) ||
				(y == y_start + 6 && x <= x_end - 4 && x >= x_end - 5 ) ||
				(y == y_start + 6 && x <= x_end - 7 && x >= x_end - 9 ) ||
				(y == y_start + 6 && x <= x_end - 12 && x >= x_end - 13 ) ||
				(y == y_start + 6 && x <= x_end - 15 && x >= x_end - 16 ) ||
				(y == y_start + 6 && x == x_end - 18) ||
				(y == y_start + 6 && x <= x_end - 22 && x >= x_end - 23 ) ||
				(y == y_start + 6 && x <= x_end - 25 && x >= x_end - 27 ) ||
				(y == y_start + 6 && x <= x_end - 30 && x >= x_end - 31 ) ||
				(y == y_start + 6 && x <= x_end - 33 && x >= x_end - 34 ) ||
				(y == y_start + 7 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 8 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 9 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 10 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 11 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 12 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 13 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 14 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 15 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 16 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 17 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 18 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 19 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 20 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 21 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 22 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 23 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 24 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 25 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 26 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 27 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 28 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 29 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 30 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 31 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 32 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 33 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 34 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 35 && x <= x_end - 0 && x >= x_end - 35 ) ||
				(y == y_start + 36 && x <= x_end - 0 && x >= x_end - 35 ))  oled_data <= 16'h69c2;
				
		else if ((y == y_start + 4 && x == x_end - 1) ||
				(y == y_start + 4 && x == x_end - 4) ||
				(y == y_start + 4 && x == x_end - 8) ||
				(y == y_start + 4 && x == x_end - 11) ||
				(y == y_start + 4 && x == x_end - 17) ||
				(y == y_start + 4 && x == x_end - 19) ||
				(y == y_start + 4 && x == x_end - 22) ||
				(y == y_start + 4 && x == x_end - 26) ||
				(y == y_start + 4 && x == x_end - 29) ||
				(y == y_start + 4 && x == x_end - 35) ||
				(y == y_start + 5 && x <= x_end - 0 && x >= x_end - 7 ) ||
				(y == y_start + 5 && x <= x_end - 9 && x >= x_end - 14 ) ||
				(y == y_start + 5 && x <= x_end - 16 && x >= x_end - 25 ) ||
				(y == y_start + 5 && x <= x_end - 27 && x >= x_end - 32 ) ||
				(y == y_start + 5 && x <= x_end - 34 && x >= x_end - 35 ) ||
				(y == y_start + 6 && x <= x_end - 1 && x >= x_end - 3 ) ||
				(y == y_start + 6 && x == x_end - 6) ||
				(y == y_start + 6 && x <= x_end - 10 && x >= x_end - 11 ) ||
				(y == y_start + 6 && x == x_end - 14) ||
				(y == y_start + 6 && x == x_end - 17) ||
				(y == y_start + 6 && x <= x_end - 19 && x >= x_end - 21 ) ||
				(y == y_start + 6 && x == x_end - 24) ||
				(y == y_start + 6 && x <= x_end - 28 && x >= x_end - 29 ) ||
				(y == y_start + 6 && x == x_end - 32) ||
				(y == y_start + 6 && x == x_end - 35)) oled_data <= 16'h4101;
	
	end
	
endmodule
