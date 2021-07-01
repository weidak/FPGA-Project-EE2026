`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module print_progress(
	input [7:0] x, y, x_end, y_start, progress,
	output reg print_progress
    );
	
	wire print_1, print_72;
	assign print_1 = ((y == y_start || y == y_start + 1) && x == 83) ? 1 : 0;
	assign print_72 = ((y == y_start || y == y_start + 1) && x == 11) ? 1: 0;
	assign print_middle = ((y == y_start || y == y_start + 2) && (x <= x_end - 1 && x >= x_end - 1 - progress)) ? 1 : 0 ;
	
	always @(*)
	begin
		if (progress == 1) print_progress <= print_1;
		else if (progress > 1 && progress < 72) print_progress <=  (print_1 || print_middle);
		else if (progress >= 72) print_progress <= (print_1 || print_middle || print_72);
	end
	
endmodule
