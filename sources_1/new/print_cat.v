`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2021 17:53:18
// Design Name: 
// Module Name: print_cat
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


module print_cat(
	input [7:0] x, y, x_start, y_start, 
	input cat_state,
	output reg print_white, print_grey
    );
	
	always @(*)
	begin
		case (cat_state)
		0:  begin //low cat
			print_white <=  (y == y_start + 1 && x == x_start + 14) ||
							(y == y_start + 2 && x >= x_start + 10 && x <= x_start + 14 ) ||
							(y == y_start + 3 && x >= x_start + 9 && x <= x_start + 15 ) ||
							(y == y_start + 4 && x >= x_start + 2 && x <= x_start + 5 ) ||
							(y == y_start + 4 && x >= x_start + 9 && x <= x_start + 15 ) ||
							(y == y_start + 5 && x >= x_start + 1 && x <= x_start + 2 ) ||
							(y == y_start + 5 && x == x_start + 4) ||
							(y == y_start + 5 && x >= x_start + 10 && x <= x_start + 14 ) ||
							(y == y_start + 6 && x == x_start + 1) ||
							(y == y_start + 6 && x >= x_start + 9 && x <= x_start + 15 ) ||
							(y == y_start + 7 && x == x_start + 1) ||
							(y == y_start + 7 && x >= x_start + 7 && x <= x_start + 15 ) ||
							(y == y_start + 8 && x == x_start + 1) ||
							(y == y_start + 8 && x >= x_start + 7 && x <= x_start + 15 ) ||
							(y == y_start + 9 && x == x_start + 1) ||
							(y == y_start + 9 && x >= x_start + 6 && x <= x_start + 14 ) ||
							(y == y_start + 10 && x == x_start + 1) ||
							(y == y_start + 10 && x >= x_start + 6 && x <= x_start + 14 ) ||
							(y == y_start + 11 && x >= x_start + 1 && x <= x_start + 2 ) ||
							(y == y_start + 11 && x >= x_start + 6 && x <= x_start + 14 ) ||
							(y == y_start + 12 && x == x_start + 2) ||
							(y == y_start + 12 && x >= x_start + 6 && x <= x_start + 14 ) ||
							(y == y_start + 13 && x >= x_start + 2 && x <= x_start + 3 ) ||
							(y == y_start + 13 && x >= x_start + 7 && x <= x_start + 14 ) ||
							(y == y_start + 14 && x >= x_start + 3 && x <= x_start + 15 );
							
			print_grey <=   (y == y_start + 1 && x == x_start + 9) ||
							(y == y_start + 2 && x == x_start + 9) ||
							(y == y_start + 3 && x == x_start + 3) ||
							(y == y_start + 3 && x == x_start + 8) ||
							(y == y_start + 4 && x == x_start + 1) ||
							(y == y_start + 4 && x == x_start + 8) ||
							(y == y_start + 5 && x == x_start + 9) ||
							(y == y_start + 6 && x >= x_start + 7 && x <= x_start + 8 ) ||
							(y == y_start + 7 && x == x_start + 0) ||
							(y == y_start + 7 && x == x_start + 6) ||
							(y == y_start + 8 && x == x_start + 0) ||
							(y == y_start + 8 && x == x_start + 6) ||
							(y == y_start + 9 && x == x_start + 0) ||	
							(y == y_start + 9 && x == x_start + 5) ||
							(y == y_start + 10 && x == x_start + 5) ||
							(y == y_start + 11 && x == x_start + 5) ||
							(y == y_start + 12 && x == x_start + 1) ||
							(y == y_start + 12 && x == x_start + 5) ||
							(y == y_start + 13 && x == x_start + 6) ||
							(y == y_start + 14 && x == x_start + 2);

			
		    end
		1:  begin //high cat
			print_white <=  (y == y_start + 0 && x == x_start + 14) ||
							(y == y_start + 1 && x >= x_start + 10 && x <= x_start + 14 ) ||
							(y == y_start + 2 && x >= x_start + 9 && x <= x_start + 15 ) ||
							(y == y_start + 3 && x >= x_start + 4 && x <= x_start + 5 ) ||
							(y == y_start + 3 && x >= x_start + 9 && x <= x_start + 15 ) ||
							(y == y_start + 4 && x >= x_start + 2 && x <= x_start + 4 ) ||
							(y == y_start + 4 && x >= x_start + 10 && x <= x_start + 14 ) ||
							(y == y_start + 5 && x >= x_start + 1 && x <= x_start + 2 ) ||
							(y == y_start + 5 && x >= x_start + 10 && x <= x_start + 14 ) ||
							(y == y_start + 6 && x == x_start + 1) ||
							(y == y_start + 6 && x >= x_start + 9 && x <= x_start + 15 ) ||
							(y == y_start + 7 && x == x_start + 1) ||
							(y == y_start + 7 && x >= x_start + 7 && x <= x_start + 15 ) ||
							(y == y_start + 8 && x == x_start + 1) ||
							(y == y_start + 8 && x >= x_start + 7 && x <= x_start + 15 ) ||
							(y == y_start + 9 && x == x_start + 1) ||
							(y == y_start + 9 && x >= x_start + 6 && x <= x_start + 14 ) ||
							(y == y_start + 10 && x == x_start + 1) ||
							(y == y_start + 10 && x >= x_start + 6 && x <= x_start + 14 ) ||
							(y == y_start + 11 && x >= x_start + 1 && x <= x_start + 2 ) ||
							(y == y_start + 11 && x >= x_start + 6 && x <= x_start + 14 ) ||
							(y == y_start + 12 && x == x_start + 2) ||
							(y == y_start + 12 && x >= x_start + 6 && x <= x_start + 14 ) ||
							(y == y_start + 13 && x >= x_start + 2 && x <= x_start + 3 ) ||
							(y == y_start + 13 && x >= x_start + 7 && x <= x_start + 14 ) ||
							(y == y_start + 14 && x >= x_start + 3 && x <= x_start + 15 ) ;

			print_grey <=   (y == y_start + 0 && x == x_start + 9) ||
							(y == y_start + 1 && x == x_start + 9) ||
							(y == y_start + 2 && x == x_start + 8) ||
							(y == y_start + 3 && x == x_start + 3) ||
							(y == y_start + 3 && x == x_start + 8) ||
							(y == y_start + 4 && x == x_start + 1) ||
							(y == y_start + 4 && x == x_start + 9) ||
							(y == y_start + 5 && x == x_start + 9) ||
							(y == y_start + 6 && x >= x_start + 7 && x <= x_start + 8 ) ||
							(y == y_start + 7 && x == x_start + 0) ||
							(y == y_start + 7 && x == x_start + 6) ||
							(y == y_start + 8 && x == x_start + 0) ||
							(y == y_start + 8 && x == x_start + 6) ||
							(y == y_start + 9 && x == x_start + 0) ||
							(y == y_start + 9 && x == x_start + 5) ||
							(y == y_start + 10 && x == x_start + 5) ||
							(y == y_start + 11 && x == x_start + 5) ||
							(y == y_start + 12 && x == x_start + 1) ||
							(y == y_start + 12 && x == x_start + 5) ||
							(y == y_start + 13 && x == x_start + 6) ||
							(y == y_start + 14 && x == x_start + 2);
			end
		endcase
	end
endmodule
