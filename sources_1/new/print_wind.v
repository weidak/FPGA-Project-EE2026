`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
 
//////////////////////////////////////////////////////////////////////////////////


module print_wind(
	input [7:0] x, y, x_start, y_start,
	output print_wind,
	output reg [15:0] oled_data
    );
	
	assign print_wind = ((y == y_start + 0 && x == x_start + 8) ||
						(y == y_start + 1 && x >= x_start + 6 && x <= x_start + 7 ) ||
						(y == y_start + 1 && x == x_start + 8) ||
						(y == y_start + 1 && x >= x_start + 9 && x <= x_start + 10 ) ||
						(y == y_start + 2 && x == x_start + 5) ||
						(y == y_start + 2 && x >= x_start + 6 && x <= x_start + 7 ) ||
						(y == y_start + 2 && x == x_start + 8) ||
						(y == y_start + 2 && x >= x_start + 9 && x <= x_start + 10 ) ||
						(y == y_start + 2 && x == x_start + 11) ||
						(y == y_start + 3 && x == x_start + 5) ||
						(y == y_start + 3 && x >= x_start + 6 && x <= x_start + 9 ) ||
						(y == y_start + 3 && x == x_start + 10) ||
						(y == y_start + 3 && x == x_start + 11) ||
						(y == y_start + 4 && x == x_start + 4) ||
						(y == y_start + 4 && x >= x_start + 5 && x <= x_start + 10 ) ||
						(y == y_start + 4 && x == x_start + 11) ||
						(y == y_start + 4 && x == x_start + 12) ||
						(y == y_start + 5 && x >= x_start + 2 && x <= x_start + 3 ) ||
						(y == y_start + 5 && x >= x_start + 4 && x <= x_start + 10 ) ||
						(y == y_start + 5 && x == x_start + 11) ||
						(y == y_start + 5 && x >= x_start + 12 && x <= x_start + 14 ) ||
						(y == y_start + 6 && x >= x_start + 0 && x <= x_start + 1 ) ||
						(y == y_start + 6 && x >= x_start + 2 && x <= x_start + 11 ) ||
						(y == y_start + 6 && x == x_start + 12) ||
						(y == y_start + 7 && x >= x_start + 2 && x <= x_start + 3 ) ||
						(y == y_start + 7 && x >= x_start + 4 && x <= x_start + 11 ) ||
						(y == y_start + 7 && x == x_start + 12) ||
						(y == y_start + 8 && x == x_start + 4) ||
						(y == y_start + 8 && x >= x_start + 5 && x <= x_start + 10 ) ||
						(y == y_start + 8 && x == x_start + 11) ||
						(y == y_start + 8 && x == x_start + 12) ||
						(y == y_start + 9 && x == x_start + 5) ||
						(y == y_start + 9 && x >= x_start + 6 && x <= x_start + 9 ) ||
						(y == y_start + 9 && x == x_start + 10) ||
						(y == y_start + 9 && x == x_start + 11) ||
						(y == y_start + 10 && x == x_start + 5) ||
						(y == y_start + 10 && x >= x_start + 6 && x <= x_start + 9 ) ||
						(y == y_start + 10 && x == x_start + 10) ||
						(y == y_start + 10 && x == x_start + 11) ||
						(y == y_start + 11 && x >= x_start + 6 && x <= x_start + 7 ) ||
						(y == y_start + 11 && x == x_start + 8) ||
						(y == y_start + 11 && x >= x_start + 9 && x <= x_start + 10 ) ||
						(y == y_start + 12 && x == x_start + 8));
	
	always @(*)
	begin
		if  ((y == y_start + 1 && x == x_start + 8) ||
			(y == y_start + 2 && x >= x_start + 6 && x <= x_start + 7 ) ||
			(y == y_start + 2 && x >= x_start + 9 && x <= x_start + 10 ) ||
			(y == y_start + 3 && x == x_start + 10) ||
			(y == y_start + 4 && x == x_start + 11) ||
			(y == y_start + 5 && x == x_start + 11) ||
			(y == y_start + 8 && x == x_start + 11) ||
			(y == y_start + 9 && x == x_start + 10) ||
			(y == y_start + 10 && x == x_start + 10) ||
			(y == y_start + 11 && x == x_start + 8)) oled_data <= 16'hbdf7;
	
		else if ((y == y_start + 0 && x == x_start + 8) ||
			(y == y_start + 1 && x >= x_start + 6 && x <= x_start + 7 ) ||
			(y == y_start + 1 && x >= x_start + 9 && x <= x_start + 10 ) ||
			(y == y_start + 2 && x == x_start + 5) ||
			(y == y_start + 2 && x == x_start + 11) ||
			(y == y_start + 3 && x == x_start + 5) ||
			(y == y_start + 3 && x == x_start + 11) ||
			(y == y_start + 4 && x == x_start + 4) ||
			(y == y_start + 4 && x == x_start + 12) ||
			(y == y_start + 5 && x >= x_start + 2 && x <= x_start + 3 ) ||
			(y == y_start + 5 && x >= x_start + 12 && x <= x_start + 14 ) ||
			(y == y_start + 6 && x >= x_start + 0 && x <= x_start + 1 ) ||
			(y == y_start + 6 && x == x_start + 12) ||
			(y == y_start + 7 && x >= x_start + 2 && x <= x_start + 3 ) ||
			(y == y_start + 7 && x == x_start + 12) ||
			(y == y_start + 8 && x == x_start + 4) ||
			(y == y_start + 8 && x == x_start + 12) ||
			(y == y_start + 9 && x == x_start + 5) ||
			(y == y_start + 9 && x == x_start + 11) ||
			(y == y_start + 10 && x == x_start + 5) ||
			(y == y_start + 10 && x == x_start + 11) ||
			(y == y_start + 11 && x >= x_start + 6 && x <= x_start + 7 ) ||
			(y == y_start + 11 && x >= x_start + 9 && x <= x_start + 10 ) ||
			(y == y_start + 12 && x == x_start + 8)) oled_data <= 16'h0000;
	
		else if ((y == y_start + 2 && x == x_start + 8) ||
			(y == y_start + 3 && x >= x_start + 6 && x <= x_start + 9 ) ||
			(y == y_start + 4 && x >= x_start + 5 && x <= x_start + 10 ) ||
			(y == y_start + 5 && x >= x_start + 4 && x <= x_start + 10 ) ||
			(y == y_start + 6 && x >= x_start + 2 && x <= x_start + 11 ) ||
			(y == y_start + 7 && x >= x_start + 4 && x <= x_start + 11 ) ||
			(y == y_start + 8 && x >= x_start + 5 && x <= x_start + 10 ) ||
			(y == y_start + 9 && x >= x_start + 6 && x <= x_start + 9 ) ||
			(y == y_start + 10 && x >= x_start + 6 && x <= x_start + 9)) oled_data <= 16'hffff;
	end
	
endmodule
