`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2021 19:02:56
// Design Name: 
// Module Name: print_number
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

module print_number(
	input [3:0] num,
	input [7:0] x, y, num_x_start, num_y_start,
	output reg print);
	
	always @(*)
	begin
		case (num)
			0: print = (((y == num_y_start || y == num_y_start + 6) && (x >= num_x_start && x <= num_x_start + 4)) ||
						((x == num_x_start || x == num_x_start + 4) && (y >= num_y_start && y <= num_y_start + 5)));
			1: print = ((x == num_x_start + 2) && (y >= num_y_start && y <= num_y_start + 6));
			2: print = (((y == num_y_start || y == num_y_start + 3 || y == num_y_start + 6) && (x >= num_x_start && x <= num_x_start + 4)) ||
						(((y == num_y_start + 1 || y == num_y_start + 2) && x == num_x_start + 4)) ||
						(((y == num_y_start + 4 || y == num_y_start + 5) && x == num_x_start)));
			3: print = (((y == num_y_start || y == num_y_start + 3 || y == num_y_start + 6) && (x >= num_x_start && x <= num_x_start + 4)) ||
						(((y == num_y_start + 1 || y == num_y_start + 2 || y == num_y_start + 4 || y == num_y_start + 5) && x == num_x_start + 4)));
			4: print = ((x == num_x_start && (y == num_y_start || y == num_y_start + 1 || y == num_y_start + 2)) ||
						(x == num_x_start + 4 && (y >= num_y_start && y <= num_y_start + 6)) ||
						(y == num_y_start + 3 && (x >= num_x_start && x <= num_x_start + 4)));
			5: print = (((y == num_y_start || y == num_y_start + 3 || y == num_y_start + 6) && (x >= num_x_start && x <= num_x_start + 4)) ||
						(((y == num_y_start + 1 || y == num_y_start + 2) && x == num_x_start)) ||
						(((y == num_y_start + 4 || y == num_y_start + 5) && x == num_x_start + 4)));
			6: print = (((y == num_y_start || y == num_y_start + 3 || y == num_y_start + 6) && (x >= num_x_start && x <= num_x_start + 4)) ||
						((x == num_x_start && (y >= num_y_start && y <= num_y_start + 6))) ||
						((x == num_x_start + 4 && (y >= num_y_start + 3 && y <= num_y_start +6))));
			7: print = ((y == num_y_start && (x >= num_x_start && x <= num_x_start + 4)) ||
						(x == num_x_start + 4 && (y >= num_y_start && y <= num_y_start + 6)));
			8: print = (((y == num_y_start || y == num_y_start + 3 || y == num_y_start + 6) && (x >= num_x_start && x <= num_x_start + 4)) ||
						((x == num_x_start || x == num_x_start + 4) && (y >= num_y_start && y <= num_y_start + 5)));
			9: print = (((y == num_y_start || y == num_y_start + 3) && (x >= num_x_start && x <= num_x_start + 4)) ||
						(x == num_x_start && (y >= num_y_start && y <= num_y_start + 3)) ||
						(x == num_x_start + 4 && (y >= num_y_start && y <= num_y_start + 6)));
			10: print = ((x == num_x_start + 2) && (y >= num_y_start && y <= num_y_start + 6)) ||
						(((y == num_y_start || y == num_y_start + 6) && (x >= num_x_start + 5 && x <= num_x_start + 9)) ||
						((x == num_x_start + 5 || x == num_x_start + 9) && (y >= num_y_start && y <= num_y_start + 5)));
			11: print = ((x == num_x_start + 2) && (y >= num_y_start && y <= num_y_start + 6)) ||
						((x == num_x_start + 7) && (y >= num_y_start && y <= num_y_start + 6));
			12: print = ((x == num_x_start + 2) && (y >= num_y_start && y <= num_y_start + 6)) ||
						(((y == num_y_start || y == num_y_start + 3 || y == num_y_start + 6) && (x >= num_x_start + 5 && x <= num_x_start + 9)) ||
						(((y == num_y_start + 1 || y == num_y_start + 2) && x == num_x_start + 9)) ||
						(((y == num_y_start + 4 || y == num_y_start + 5) && x == num_x_start + 5)));
			13: print = ((x == num_x_start + 2) && (y >= num_y_start && y <= num_y_start + 6)) ||
						(((y == num_y_start || y == num_y_start + 3 || y == num_y_start + 6) && (x >= num_x_start + 5 && x <= num_x_start + 9)) ||
						(((y == num_y_start + 1 || y == num_y_start + 2 || y == num_y_start + 4 || y == num_y_start + 5) && x == num_x_start + 9)));
			14: print = ((x == num_x_start + 2) && (y >= num_y_start && y <= num_y_start + 6)) ||
						((x == num_x_start + 5 && (y == num_y_start || y == num_y_start + 1 || y == num_y_start + 2)) ||
						(x == num_x_start + 9 && (y >= num_y_start && y <= num_y_start + 6)) ||
						(y == num_y_start + 3 && (x >= num_x_start + 5 && x <= num_x_start + 9)));
			15: print = ((x == num_x_start + 2) && (y >= num_y_start && y <= num_y_start + 6)) ||
						(((y == num_y_start || y == num_y_start + 3 || y == num_y_start + 6) && (x >= num_x_start + 5 && x <= num_x_start + 9)) ||
						(((y == num_y_start + 1 || y == num_y_start + 2) && x == num_x_start + 5)) ||
						(((y == num_y_start + 4 || y == num_y_start + 5) && x == num_x_start + 9)));
		endcase
	end
	
endmodule

