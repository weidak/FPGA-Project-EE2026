`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2021 22:40:18
// Design Name: 
// Module Name: print_hand
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


module print_hand(
	input [3:0] player_num,
	input [7:0] x, y, x_start, y_start,
	output reg print_black, print_white, print_colour
    );
	
	always @(*)
	begin
		case (player_num)
			1:  begin
				print_black <= (y == y_start && (x >= x_start - 16 && x <= x_start - 14)) 
							|| (y == y_start + 1 && (x == x_start - 17 || x == x_start - 14)) 
							|| (y == y_start + 2 && ((x >= x_start - 19 && x <= x_start - 17) || (x == x_start - 14)))
							|| (y == y_start + 3 && ((x >= x_start - 21 && x <= x_start - 20) || (x == x_start - 15)))
							|| (y == y_start + 4 && ((x >= x_start - 17 && x <= x_start - 5) || (x >= x_start - 23 && x <= x_start - 22)))
							|| (y == y_start + 5 && ((x >= x_start - 26 && x <= x_start - 24) || (x == x_start - 4)))
							|| (y == y_start + 6 && ((x >= x_start - 35 && x <= x_start - 26) || (x == x_start - 4)))
							|| (y == y_start + 7 && (x == x_start - 26 || (x >= x_start - 14 && x <= x_start)))
							|| (y == y_start + 8 && (x == x_start - 26 || x == x_start))
							|| (y == y_start + 9 && (x == x_start - 26 || x == x_start))
							|| (y == y_start + 10 && (x == x_start - 26 || (x >= x_start - 13 && x <= x_start - 1)))
							|| (y == y_start + 11 && (x == x_start - 26 || x == x_start - 2))
							|| (y == y_start + 12 && (x == x_start - 26 || x == x_start - 2))
							|| (y == y_start + 13 && ((x >= x_start - 35 && x <= x_start - 26) || (x >= x_start - 14 && x <= x_start - 3)))
							|| (y == y_start + 14 && ((x >= x_start - 26 && x <= x_start - 21) || x == x_start - 5))
							|| (y == y_start + 15 && ((x >= x_start - 20 && x <= x_start - 18) || x == x_start - 5))
							|| (y == y_start + 16 && (x >= x_start - 17 && x <= x_start - 5));
				
				print_white <= (y == y_start + 1 && (x == x_start - 16 || x == x_start - 15))
							|| (y == y_start + 2 && (x >= x_start - 17 && x <= x_start - 15))
							|| (y == y_start + 3 && (x >= x_start - 19 && x <= x_start - 16))
							|| (y == y_start + 4 && (x >= x_start - 21 && x <= x_start - 17))
							|| (y == y_start + 5 && (x >= x_start - 23 && x <= x_start - 5))
							|| (y == y_start + 6 && (x >= x_start - 25 && x <= x_start - 5))
							|| (y == y_start + 7 && (x >= x_start - 25 && x <= x_start - 15))
							|| (y == y_start + 8 && (x >= x_start - 25 && x <= x_start - 1))
							|| (y == y_start + 9 && (x >= x_start - 25 && x <= x_start - 1))
							|| (y == y_start + 10 && (x >= x_start - 25 && x <= x_start - 14))
							|| (y == y_start + 11 && (x >= x_start - 25 && x <= x_start - 3))
							|| (y == y_start + 12 && (x >= x_start - 25 && x <= x_start - 3))
							|| (y == y_start + 13 && (x >= x_start - 25 && x <= x_start - 15))
							|| (y == y_start + 14 && (x >= x_start - 20 && x <= x_start - 6))
							|| (y == y_start + 15 && (x >= x_start - 17 && x <= x_start - 6));
				
				print_colour <= ((y >= y_start + 7 && y <= y_start + 12) && (x >= x_start - 35 && x <= x_start - 27));
				end
				
			2:  begin
				print_black = ((y == y_start && (x >= x_start + 7 && x <= x_start + 18)) ||
							  ((y == y_start + 1) && (x == x_start + 6 || (x >= x_start + 18 && x <= x_start + 20))) ||
							  ((y == y_start + 2) && (x == x_start + 6 || (x >= x_start + 21 && x <= x_start + 27))) ||
							  ((y == y_start + 3) && ((x >= x_start + 4 && x <= x_start + 15) || (x >= x_start + 27 && x <= x_start + 35))) ||
							  ((y == y_start + 4) && (x == x_start + 3 || x == x_start + 27)) ||
							  ((y == y_start + 5) && (x == x_start + 3 || x == x_start + 27)) ||
							  ((y == y_start + 6) && ((x >= x_start + 2 && x <= x_start + 14) || x == x_start + 27)) ||
							  ((y == y_start + 7 || y == y_start + 8) && (x == x_start || x == x_start + 27)) ||
							  ((y == y_start + 9 && ((x >= x_start && x <= x_start + 15) || x == x_start + 27))) ||
							  ((y == y_start + 10 && (x == x_start + 5 || (x >= x_start + 27 && x <= x_start + 35)))) ||
							  ((y == y_start + 11 && (x == x_start + 5 || (x >= x_start + 25 && x <= x_start + 27)))) ||
							  ((y == y_start + 12 && ((x >= x_start + 6 && x <= x_start + 17) || x == x_start + 23 || x == x_start + 24))) ||
							  ((y == y_start + 13 && (x == x_start + 16 || x == x_start + 21 || x == x_start + 22))) ||
							  ((y == y_start + 14 && (x == x_start + 15 || x == x_start + 19 || x == x_start + 20))) ||
							  ((y == y_start + 15 && (x == x_start + 15 || x == x_start + 18))) ||
							  ((y == y_start + 16 && (x >= x_start + 15 && x <= x_start + 17))));
			  
				print_white = ((y == y_start + 1 && (x >= x_start + 7 && x <= x_start + 17))||
							  ((y == y_start + 2 && (x >= x_start + 7 && x <= x_start + 20))) ||
							  ((y == y_start + 3 && (x >= x_start + 16 && x <= x_start + 26))) ||
							  (((y == y_start + 4 || y == y_start + 5) && (x >= x_start + 4 && x <= x_start + 26))) ||
							  (y == y_start + 6 && (x >= x_start + 15 && x <= x_start + 26)) ||
							  (((y == y_start + 7 || y == y_start + 8) && (x >= x_start + 1 && x <= x_start + 26))) ||
							  ((y == y_start + 9 && (x >= x_start + 16 && x <= x_start + 26))) ||
							  ((y == y_start + 10 && (x >= x_start + 6 && x <= x_start + 26))) ||
							  ((y == y_start + 11 && (x >= x_start + 6 && x <= x_start + 24))) ||
							  ((y == y_start + 12 && (x >= x_start + 18 && x <= x_start + 22))) ||
							  ((y == y_start + 13 && (x >= x_start + 17 && x <= x_start + 20))) ||
							  ((y == y_start + 14 && (x >= x_start + 16 && x <= x_start + 18))) ||
							  ((y == y_start + 15 && (x == x_start + 16 || x == x_start + 17))));
							  
			  
				print_colour = ((y >= y_start + 4 && y <= y_start + 9) && (x >= x_start + 28 && x <= x_start + 35));
				end
			
		endcase
	
	
	
	end
	
	
endmodule

