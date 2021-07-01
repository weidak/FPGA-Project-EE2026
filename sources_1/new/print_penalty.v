`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2021 06:18:15
// Design Name: 
// Module Name: print_penalty
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


module print_penalty(
	input [3:0] penalty_num,
	input [7:0] x, y, x_start, y_start,
	output reg print_black
    );
	
	always @(*)
	begin
		case (penalty_num)
			1:  print_black <= ((y == y_start || y == y_start + 1) && (x == x_start || x == x_start + 1));
			2: 	print_black <= ((y == y_start || y == y_start + 1 || y == y_start + 5 || y == y_start + 6) && (x == x_start || x == x_start + 1));
			3: 	print_black <= ((y == y_start || y == y_start + 1 || y == y_start + 5 || y == y_start + 6 || y == y_start + 10 || y == y_start + 11) && (x == x_start || x == x_start + 1));
		endcase
	end
	
endmodule
