`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module print_blow(
	input [7:0] x, y, x_start, y_start,
	output print_blow,
	output reg [15:0] oled_data
    );
	
	assign print_blow = ((y == y_start + 32 && x >= x_start + 29 && x <= x_start + 31 ) ||
						(y == y_start + 32 && x == x_start + 32) ||
						(y == y_start + 32 && x == x_start + 34) ||
						(y == y_start + 32 && x == x_start + 35) ||
						(y == y_start + 32 && x >= x_start + 39 && x <= x_start + 42 ) ||
						(y == y_start + 32 && x == x_start + 43) ||
						(y == y_start + 32 && x == x_start + 44) ||
						(y == y_start + 32 && x == x_start + 45) ||
						(y == y_start + 32 && x == x_start + 48) ||
						(y == y_start + 32 && x == x_start + 49) ||
						(y == y_start + 33 && x == x_start + 29) ||
						(y == y_start + 33 && x == x_start + 30) ||
						(y == y_start + 33 && x == x_start + 32) ||
						(y == y_start + 33 && x == x_start + 33) ||
						(y == y_start + 33 && x == x_start + 34) ||
						(y == y_start + 33 && x == x_start + 35) ||
						(y == y_start + 33 && x == x_start + 39) ||
						(y == y_start + 33 && x == x_start + 40) ||
						(y == y_start + 33 && x == x_start + 42) ||
						(y == y_start + 33 && x == x_start + 43) ||
						(y == y_start + 33 && x == x_start + 44) ||
						(y == y_start + 33 && x == x_start + 45) ||
						(y == y_start + 33 && x == x_start + 48) ||
						(y == y_start + 33 && x == x_start + 49) ||
						(y == y_start + 34 && x >= x_start + 29 && x <= x_start + 31 ) ||
						(y == y_start + 34 && x == x_start + 32) ||
						(y == y_start + 34 && x == x_start + 34) ||
						(y == y_start + 34 && x == x_start + 35) ||
						(y == y_start + 34 && x == x_start + 39) ||
						(y == y_start + 34 && x == x_start + 40) ||
						(y == y_start + 34 && x == x_start + 42) ||
						(y == y_start + 34 && x == x_start + 43) ||
						(y == y_start + 34 && x == x_start + 44) ||
						(y == y_start + 34 && x == x_start + 45) ||
						(y == y_start + 34 && x == x_start + 48) ||
						(y == y_start + 34 && x == x_start + 49) ||
						(y == y_start + 35 && x == x_start + 29) ||
						(y == y_start + 35 && x == x_start + 30) ||
						(y == y_start + 35 && x == x_start + 32) ||
						(y == y_start + 35 && x == x_start + 33) ||
						(y == y_start + 35 && x == x_start + 34) ||
						(y == y_start + 35 && x == x_start + 35) ||
						(y == y_start + 35 && x == x_start + 39) ||
						(y == y_start + 35 && x == x_start + 40) ||
						(y == y_start + 35 && x == x_start + 42) ||
						(y == y_start + 35 && x == x_start + 43) ||
						(y == y_start + 35 && x == x_start + 44) ||
						(y == y_start + 35 && x == x_start + 45) ||
						(y == y_start + 35 && x == x_start + 46) ||
						(y == y_start + 35 && x == x_start + 47) ||
						(y == y_start + 35 && x == x_start + 48) ||
						(y == y_start + 35 && x == x_start + 49) ||
						(y == y_start + 36 && x == x_start + 29) ||
						(y == y_start + 36 && x == x_start + 30) ||
						(y == y_start + 36 && x == x_start + 32) ||
						(y == y_start + 36 && x == x_start + 33) ||
						(y == y_start + 36 && x == x_start + 34) ||
						(y == y_start + 36 && x == x_start + 35) ||
						(y == y_start + 36 && x == x_start + 39) ||
						(y == y_start + 36 && x == x_start + 40) ||
						(y == y_start + 36 && x == x_start + 42) ||
						(y == y_start + 36 && x == x_start + 43) ||
						(y == y_start + 36 && x >= x_start + 44 && x <= x_start + 45 ) ||
						(y == y_start + 36 && x == x_start + 46) ||
						(y == y_start + 36 && x >= x_start + 47 && x <= x_start + 48 ) ||
						(y == y_start + 36 && x == x_start + 49) ||
						(y == y_start + 37 && x >= x_start + 29 && x <= x_start + 32 ) ||
						(y == y_start + 37 && x == x_start + 33) ||
						(y == y_start + 37 && x >= x_start + 34 && x <= x_start + 37 ) ||
						(y == y_start + 37 && x == x_start + 38) ||
						(y == y_start + 37 && x >= x_start + 39 && x <= x_start + 42 ) ||
						(y == y_start + 37 && x == x_start + 43) ||
						(y == y_start + 37 && x == x_start + 44) ||
						(y == y_start + 37 && x == x_start + 45) ||
						(y == y_start + 37 && x == x_start + 48) ||
						(y == y_start + 37 && x == x_start + 49));
		
		always @(*)
		begin
			if  ((y == y_start + 32 && x == x_start + 32) ||
				(y == y_start + 32 && x == x_start + 35) ||
				(y == y_start + 32 && x == x_start + 43) ||
				(y == y_start + 32 && x == x_start + 45) ||
				(y == y_start + 32 && x == x_start + 49) ||
				(y == y_start + 33 && x == x_start + 30) ||
				(y == y_start + 33 && x == x_start + 33) ||
				(y == y_start + 33 && x == x_start + 35) ||
				(y == y_start + 33 && x == x_start + 40) ||
				(y == y_start + 33 && x == x_start + 43) ||
				(y == y_start + 33 && x == x_start + 45) ||
				(y == y_start + 33 && x == x_start + 49) ||
				(y == y_start + 34 && x == x_start + 32) ||
				(y == y_start + 34 && x == x_start + 35) ||
				(y == y_start + 34 && x == x_start + 40) ||
				(y == y_start + 34 && x == x_start + 43) ||
				(y == y_start + 34 && x == x_start + 45) ||
				(y == y_start + 34 && x == x_start + 49) ||
				(y == y_start + 35 && x == x_start + 30) ||
				(y == y_start + 35 && x == x_start + 33) ||
				(y == y_start + 35 && x == x_start + 35) ||
				(y == y_start + 35 && x == x_start + 40) ||
				(y == y_start + 35 && x == x_start + 43) ||
				(y == y_start + 35 && x == x_start + 45) ||
				(y == y_start + 35 && x == x_start + 47) ||
				(y == y_start + 35 && x == x_start + 49) ||
				(y == y_start + 36 && x == x_start + 30) ||
				(y == y_start + 36 && x == x_start + 33) ||
				(y == y_start + 36 && x == x_start + 35) ||
				(y == y_start + 36 && x == x_start + 40) ||
				(y == y_start + 36 && x == x_start + 43) ||
				(y == y_start + 36 && x == x_start + 46) ||
				(y == y_start + 36 && x == x_start + 49) ||
				(y == y_start + 37 && x == x_start + 33) ||
				(y == y_start + 37 && x == x_start + 38) ||
				(y == y_start + 37 && x == x_start + 43) ||
				(y == y_start + 37 && x == x_start + 45) ||
				(y == y_start + 37 && x == x_start + 49)) oled_data <= 16'h39c7;

		else if ((y == y_start + 32 && x >= x_start + 29 && x <= x_start + 31 ) ||
				(y == y_start + 32 && x == x_start + 34) ||
				(y == y_start + 32 && x >= x_start + 39 && x <= x_start + 42 ) ||
				(y == y_start + 32 && x == x_start + 44) ||
				(y == y_start + 32 && x == x_start + 48) ||
				(y == y_start + 33 && x == x_start + 29) ||
				(y == y_start + 33 && x == x_start + 32) ||
				(y == y_start + 33 && x == x_start + 34) ||
				(y == y_start + 33 && x == x_start + 39) ||
				(y == y_start + 33 && x == x_start + 42) ||
				(y == y_start + 33 && x == x_start + 44) ||
				(y == y_start + 33 && x == x_start + 48) ||
				(y == y_start + 34 && x >= x_start + 29 && x <= x_start + 31 ) ||
				(y == y_start + 34 && x == x_start + 34) ||
				(y == y_start + 34 && x == x_start + 39) ||
				(y == y_start + 34 && x == x_start + 42) ||
				(y == y_start + 34 && x == x_start + 44) ||
				(y == y_start + 34 && x == x_start + 48) ||
				(y == y_start + 35 && x == x_start + 29) ||
				(y == y_start + 35 && x == x_start + 32) ||
				(y == y_start + 35 && x == x_start + 34) ||
				(y == y_start + 35 && x == x_start + 39) ||
				(y == y_start + 35 && x == x_start + 42) ||
				(y == y_start + 35 && x == x_start + 44) ||
				(y == y_start + 35 && x == x_start + 46) ||
				(y == y_start + 35 && x == x_start + 48) ||
				(y == y_start + 36 && x == x_start + 29) ||
				(y == y_start + 36 && x == x_start + 32) ||
				(y == y_start + 36 && x == x_start + 34) ||
				(y == y_start + 36 && x == x_start + 39) ||
				(y == y_start + 36 && x == x_start + 42) ||
				(y == y_start + 36 && x >= x_start + 44 && x <= x_start + 45 ) ||
				(y == y_start + 36 && x >= x_start + 47 && x <= x_start + 48 ) ||
				(y == y_start + 37 && x >= x_start + 29 && x <= x_start + 32 ) ||
				(y == y_start + 37 && x >= x_start + 34 && x <= x_start + 37 ) ||
				(y == y_start + 37 && x >= x_start + 39 && x <= x_start + 42 ) ||
				(y == y_start + 37 && x == x_start + 44) ||
				(y == y_start + 37 && x == x_start + 48)) oled_data <= 16'hf800;
		end
endmodule
