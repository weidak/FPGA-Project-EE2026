`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module print_charac(
	input charac,
	input [7:0] x, y, x_end, y_start,
	output print_charac,
	output reg [15:0] oled_charac
    );
	
	
	always @(*)
	begin
		case(charac)
		1: //wolf
		begin
			print_charac <= ((y == y_start + 25 && x >= x_start + 50 && x <= x_start + 53 ) ||
							(y == y_start + 26 && x == x_start + 32) ||
							(y == y_start + 26 && x >= x_start + 48 && x <= x_start + 49 ) ||
							(y == y_start + 26 && x >= x_start + 50 && x <= x_start + 51 ) ||
							(y == y_start + 26 && x == x_start + 52) ||
							(y == y_start + 26 && x == x_start + 53) ||
							(y == y_start + 26 && x == x_start + 54) ||
							(y == y_start + 27 && x == x_start + 32) ||
							(y == y_start + 27 && x == x_start + 47) ||
							(y == y_start + 27 && x >= x_start + 48 && x <= x_start + 50 ) ||
							(y == y_start + 27 && x == x_start + 51) ||
							(y == y_start + 27 && x == x_start + 52) ||
							(y == y_start + 27 && x == x_start + 53) ||
							(y == y_start + 28 && x >= x_start + 31 && x <= x_start + 33 ) ||
							(y == y_start + 28 && x == x_start + 47) ||
							(y == y_start + 28 && x >= x_start + 48 && x <= x_start + 49 ) ||
							(y == y_start + 28 && x == x_start + 50) ||
							(y == y_start + 28 && x == x_start + 51) ||
							(y == y_start + 28 && x == x_start + 52) ||
							(y == y_start + 29 && x == x_start + 31) ||
							(y == y_start + 29 && x == x_start + 32) ||
							(y == y_start + 29 && x >= x_start + 33 && x <= x_start + 34 ) ||
							(y == y_start + 29 && x == x_start + 46) ||
							(y == y_start + 29 && x >= x_start + 47 && x <= x_start + 49 ) ||
							(y == y_start + 29 && x == x_start + 50) ||
							(y == y_start + 29 && x == x_start + 51) ||
							(y == y_start + 29 && x == x_start + 52) ||
							(y == y_start + 30 && x == x_start + 30) ||
							(y == y_start + 30 && x >= x_start + 31 && x <= x_start + 33 ) ||
							(y == y_start + 30 && x >= x_start + 34 && x <= x_start + 35 ) ||
							(y == y_start + 30 && x == x_start + 46) ||
							(y == y_start + 30 && x >= x_start + 47 && x <= x_start + 49 ) ||
							(y == y_start + 30 && x == x_start + 50) ||
							(y == y_start + 30 && x == x_start + 51) ||
							(y == y_start + 30 && x == x_start + 52) ||
							(y == y_start + 31 && x >= x_start + 29 && x <= x_start + 30 ) ||
							(y == y_start + 31 && x >= x_start + 31 && x <= x_start + 34 ) ||
							(y == y_start + 31 && x >= x_start + 35 && x <= x_start + 37 ) ||
							(y == y_start + 31 && x == x_start + 45) ||
							(y == y_start + 31 && x >= x_start + 46 && x <= x_start + 49 ) ||
							(y == y_start + 31 && x >= x_start + 50 && x <= x_start + 54 ) ||
							(y == y_start + 32 && x >= x_start + 28 && x <= x_start + 29 ) ||
							(y == y_start + 32 && x >= x_start + 30 && x <= x_start + 33 ) ||
							(y == y_start + 32 && x >= x_start + 34 && x <= x_start + 35 ) ||
							(y == y_start + 32 && x == x_start + 44) ||
							(y == y_start + 32 && x >= x_start + 45 && x <= x_start + 51 ) ||
							(y == y_start + 32 && x >= x_start + 52 && x <= x_start + 54 ) ||
							(y == y_start + 32 && x == x_start + 55) ||
							(y == y_start + 33 && x >= x_start + 29 && x <= x_start + 31 ) ||
							(y == y_start + 33 && x == x_start + 32) ||
							(y == y_start + 33 && x >= x_start + 33 && x <= x_start + 34 ) ||
							(y == y_start + 33 && x == x_start + 43) ||
							(y == y_start + 33 && x >= x_start + 44 && x <= x_start + 53 ) ||
							(y == y_start + 33 && x >= x_start + 54 && x <= x_start + 55 ) ||
							(y == y_start + 33 && x == x_start + 56) ||
							(y == y_start + 34 && x >= x_start + 31 && x <= x_start + 33 ) ||
							(y == y_start + 34 && x == x_start + 43) ||
							(y == y_start + 34 && x >= x_start + 44 && x <= x_start + 54 ) ||
							(y == y_start + 34 && x == x_start + 55) ||
							(y == y_start + 34 && x == x_start + 56) ||
							(y == y_start + 35 && x >= x_start + 32 && x <= x_start + 33 ) ||
							(y == y_start + 35 && x == x_start + 42) ||
							(y == y_start + 35 && x >= x_start + 43 && x <= x_start + 48 ) ||
							(y == y_start + 35 && x >= x_start + 49 && x <= x_start + 51 ) ||
							(y == y_start + 35 && x >= x_start + 52 && x <= x_start + 56 ) ||
							(y == y_start + 35 && x >= x_start + 57 && x <= x_start + 65 ) ||
							(y == y_start + 36 && x == x_start + 33) ||
							(y == y_start + 36 && x == x_start + 42) ||
							(y == y_start + 36 && x >= x_start + 43 && x <= x_start + 47 ) ||
							(y == y_start + 36 && x == x_start + 48) ||
							(y == y_start + 36 && x >= x_start + 49 && x <= x_start + 50 ) ||
							(y == y_start + 36 && x >= x_start + 51 && x <= x_start + 52 ) ||
							(y == y_start + 36 && x >= x_start + 53 && x <= x_start + 61 ) ||
							(y == y_start + 36 && x >= x_start + 62 && x <= x_start + 64 ) ||
							(y == y_start + 36 && x == x_start + 65) ||
							(y == y_start + 37 && x == x_start + 41) ||
							(y == y_start + 37 && x >= x_start + 42 && x <= x_start + 48 ) ||
							(y == y_start + 37 && x >= x_start + 49 && x <= x_start + 50 ) ||
							(y == y_start + 37 && x >= x_start + 51 && x <= x_start + 62 ) ||
							(y == y_start + 37 && x >= x_start + 63 && x <= x_start + 64 ) ||
							(y == y_start + 37 && x == x_start + 65) ||
							(y == y_start + 38 && x == x_start + 41) ||
							(y == y_start + 38 && x >= x_start + 42 && x <= x_start + 63 ) ||
							(y == y_start + 38 && x == x_start + 64) ||
							(y == y_start + 39 && x == x_start + 40) ||
							(y == y_start + 39 && x >= x_start + 41 && x <= x_start + 63 ) ||
							(y == y_start + 39 && x == x_start + 64) ||
							(y == y_start + 40 && x == x_start + 40) ||
							(y == y_start + 40 && x >= x_start + 41 && x <= x_start + 60 ) ||
							(y == y_start + 40 && x >= x_start + 61 && x <= x_start + 63 ) ||
							(y == y_start + 41 && x == x_start + 40) ||
							(y == y_start + 41 && x >= x_start + 41 && x <= x_start + 57 ) ||
							(y == y_start + 41 && x >= x_start + 58 && x <= x_start + 60 ) ||
							(y == y_start + 42 && x == x_start + 39) ||
							(y == y_start + 42 && x >= x_start + 40 && x <= x_start + 58 ) ||
							(y == y_start + 42 && x == x_start + 59) ||
							(y == y_start + 43 && x == x_start + 39) ||
							(y == y_start + 43 && x >= x_start + 40 && x <= x_start + 59 ) ||
							(y == y_start + 43 && x >= x_start + 60 && x <= x_start + 63 ) ||
							(y == y_start + 44 && x == x_start + 39) ||
							(y == y_start + 44 && x >= x_start + 40 && x <= x_start + 61 ) ||
							(y == y_start + 44 && x == x_start + 62) ||
							(y == y_start + 45 && x == x_start + 38) ||
							(y == y_start + 45 && x >= x_start + 39 && x <= x_start + 55 ) ||
							(y == y_start + 45 && x == x_start + 56) ||
							(y == y_start + 45 && x >= x_start + 57 && x <= x_start + 61 ) ||
							(y == y_start + 46 && x == x_start + 38) ||
							(y == y_start + 46 && x >= x_start + 39 && x <= x_start + 55 ) ||
							(y == y_start + 46 && x == x_start + 56) ||
							(y == y_start + 46 && x == x_start + 57) ||
							(y == y_start + 47 && x == x_start + 37) ||
							(y == y_start + 47 && x >= x_start + 38 && x <= x_start + 55 ) ||
							(y == y_start + 47 && x >= x_start + 56 && x <= x_start + 57 ) ||
							(y == y_start + 47 && x == x_start + 58) ||
							(y == y_start + 48 && x == x_start + 36) ||
							(y == y_start + 48 && x >= x_start + 37 && x <= x_start + 56 ) ||
							(y == y_start + 48 && x == x_start + 57) ||
							(y == y_start + 48 && x == x_start + 58) ||
							(y == y_start + 49 && x == x_start + 36) ||
							(y == y_start + 49 && x >= x_start + 37 && x <= x_start + 56 ) ||
							(y == y_start + 49 && x == x_start + 57) ||
							(y == y_start + 49 && x == x_start + 58) ||
							(y == y_start + 50 && x == x_start + 36) ||
							(y == y_start + 50 && x >= x_start + 37 && x <= x_start + 56 ) ||
							(y == y_start + 50 && x == x_start + 57) ||
							(y == y_start + 50 && x == x_start + 58) ||
							(y == y_start + 51 && x == x_start + 36) ||
							(y == y_start + 51 && x >= x_start + 37 && x <= x_start + 56 ) ||
							(y == y_start + 51 && x == x_start + 57) ||
							(y == y_start + 51 && x == x_start + 58) ||
							(y == y_start + 52 && x >= x_start + 36 && x <= x_start + 37 ) ||
							(y == y_start + 52 && x >= x_start + 38 && x <= x_start + 55 ) ||
							(y == y_start + 52 && x >= x_start + 56 && x <= x_start + 57 ) ||
							(y == y_start + 52 && x == x_start + 58) ||
							(y == y_start + 53 && x == x_start + 37) ||
							(y == y_start + 53 && x == x_start + 38) ||
							(y == y_start + 53 && x >= x_start + 39 && x <= x_start + 55 ) ||
							(y == y_start + 53 && x == x_start + 56) ||
							(y == y_start + 53 && x == x_start + 57) ||
							(y == y_start + 54 && x >= x_start + 39 && x <= x_start + 56 ));
							
			if ((y == y_start + 25 && x >= x_start + 50 && x <= x_start + 53 ) ||
				(y == y_start + 26 && x == x_start + 32) ||
				(y == y_start + 26 && x >= x_start + 48 && x <= x_start + 49 ) ||
				(y == y_start + 26 && x == x_start + 52) ||
				(y == y_start + 26 && x == x_start + 54) ||
				(y == y_start + 27 && x == x_start + 32) ||
				(y == y_start + 27 && x == x_start + 47) ||
				(y == y_start + 27 && x == x_start + 51) ||
				(y == y_start + 27 && x == x_start + 53) ||
				(y == y_start + 28 && x >= x_start + 31 && x <= x_start + 33 ) ||
				(y == y_start + 28 && x == x_start + 47) ||
				(y == y_start + 28 && x == x_start + 50) ||
				(y == y_start + 28 && x == x_start + 52) ||
				(y == y_start + 29 && x == x_start + 31) ||
				(y == y_start + 29 && x >= x_start + 33 && x <= x_start + 34 ) ||
				(y == y_start + 29 && x == x_start + 46) ||
				(y == y_start + 29 && x == x_start + 50) ||
				(y == y_start + 29 && x == x_start + 52) ||
				(y == y_start + 30 && x == x_start + 30) ||
				(y == y_start + 30 && x >= x_start + 34 && x <= x_start + 35 ) ||
				(y == y_start + 30 && x == x_start + 46) ||
				(y == y_start + 30 && x == x_start + 50) ||
				(y == y_start + 30 && x == x_start + 52) ||
				(y == y_start + 31 && x >= x_start + 29 && x <= x_start + 30 ) ||
				(y == y_start + 31 && x >= x_start + 35 && x <= x_start + 37 ) ||
				(y == y_start + 31 && x == x_start + 45) ||
				(y == y_start + 31 && x >= x_start + 50 && x <= x_start + 54 ) ||
				(y == y_start + 32 && x >= x_start + 28 && x <= x_start + 29 ) ||
				(y == y_start + 32 && x >= x_start + 34 && x <= x_start + 35 ) ||
				(y == y_start + 32 && x == x_start + 44) ||
				(y == y_start + 32 && x == x_start + 55) ||
				(y == y_start + 33 && x >= x_start + 29 && x <= x_start + 31 ) ||
				(y == y_start + 33 && x >= x_start + 33 && x <= x_start + 34 ) ||
				(y == y_start + 33 && x == x_start + 43) ||
				(y == y_start + 33 && x == x_start + 56) ||
				(y == y_start + 34 && x >= x_start + 31 && x <= x_start + 33 ) ||
				(y == y_start + 34 && x == x_start + 43) ||
				(y == y_start + 34 && x == x_start + 56) ||
				(y == y_start + 35 && x >= x_start + 32 && x <= x_start + 33 ) ||
				(y == y_start + 35 && x == x_start + 42) ||
				(y == y_start + 35 && x >= x_start + 49 && x <= x_start + 51 ) ||
				(y == y_start + 35 && x >= x_start + 57 && x <= x_start + 65 ) ||
				(y == y_start + 36 && x == x_start + 33) ||
				(y == y_start + 36 && x == x_start + 42) ||
				(y == y_start + 36 && x == x_start + 48) ||
				(y == y_start + 36 && x >= x_start + 51 && x <= x_start + 52 ) ||
				(y == y_start + 36 && x == x_start + 65) ||
				(y == y_start + 37 && x == x_start + 41) ||
				(y == y_start + 37 && x >= x_start + 49 && x <= x_start + 50 ) ||
				(y == y_start + 37 && x == x_start + 65) ||
				(y == y_start + 38 && x == x_start + 41) ||
				(y == y_start + 38 && x == x_start + 64) ||
				(y == y_start + 39 && x == x_start + 40) ||
				(y == y_start + 39 && x == x_start + 64) ||
				(y == y_start + 40 && x == x_start + 40) ||
				(y == y_start + 40 && x >= x_start + 61 && x <= x_start + 63 ) ||
				(y == y_start + 41 && x == x_start + 40) ||
				(y == y_start + 41 && x >= x_start + 58 && x <= x_start + 60 ) ||
				(y == y_start + 42 && x == x_start + 39) ||
				(y == y_start + 42 && x == x_start + 59) ||
				(y == y_start + 43 && x == x_start + 39) ||
				(y == y_start + 43 && x >= x_start + 60 && x <= x_start + 63 ) ||
				(y == y_start + 44 && x == x_start + 39) ||
				(y == y_start + 44 && x == x_start + 62) ||
				(y == y_start + 45 && x == x_start + 38) ||
				(y == y_start + 45 && x >= x_start + 57 && x <= x_start + 61 ) ||
				(y == y_start + 46 && x == x_start + 38) ||
				(y == y_start + 46 && x == x_start + 57) ||
				(y == y_start + 47 && x == x_start + 37) ||
				(y == y_start + 47 && x == x_start + 58) ||
				(y == y_start + 48 && x == x_start + 36) ||
				(y == y_start + 48 && x == x_start + 58) ||
				(y == y_start + 49 && x == x_start + 36) ||
				(y == y_start + 49 && x == x_start + 58) ||
				(y == y_start + 50 && x == x_start + 36) ||
				(y == y_start + 50 && x == x_start + 58) ||
				(y == y_start + 51 && x == x_start + 36) ||
				(y == y_start + 51 && x == x_start + 58) ||
				(y == y_start + 52 && x >= x_start + 36 && x <= x_start + 37 ) ||
				(y == y_start + 52 && x == x_start + 58) ||
				(y == y_start + 53 && x == x_start + 38) ||
				(y == y_start + 53 && x == x_start + 57) ||
				(y == y_start + 54 && x >= x_start + 39 && x <= x_start + 56 )) oled_data <= 16'h0000;
			else if ((y == y_start + 26 && x >= x_start + 50 && x <= x_start + 51 ) ||
					(y == y_start + 27 && x >= x_start + 48 && x <= x_start + 50 ) ||
					(y == y_start + 28 && x >= x_start + 48 && x <= x_start + 49 ) ||
					(y == y_start + 29 && x >= x_start + 47 && x <= x_start + 49 ) ||
					(y == y_start + 30 && x >= x_start + 47 && x <= x_start + 49 ) ||
					(y == y_start + 31 && x >= x_start + 46 && x <= x_start + 49 ) ||
					(y == y_start + 32 && x >= x_start + 45 && x <= x_start + 51 ) ||
					(y == y_start + 33 && x >= x_start + 44 && x <= x_start + 53 ) ||
					(y == y_start + 34 && x >= x_start + 44 && x <= x_start + 54 ) ||
					(y == y_start + 35 && x >= x_start + 43 && x <= x_start + 48 ) ||
					(y == y_start + 35 && x >= x_start + 52 && x <= x_start + 56 ) ||
					(y == y_start + 36 && x >= x_start + 43 && x <= x_start + 47 ) ||
					(y == y_start + 36 && x >= x_start + 53 && x <= x_start + 61 ) ||
					(y == y_start + 37 && x >= x_start + 42 && x <= x_start + 48 ) ||
					(y == y_start + 37 && x >= x_start + 51 && x <= x_start + 62 ) ||
					(y == y_start + 38 && x >= x_start + 42 && x <= x_start + 63 ) ||
					(y == y_start + 39 && x >= x_start + 41 && x <= x_start + 63 ) ||
					(y == y_start + 40 && x >= x_start + 41 && x <= x_start + 60 ) ||
					(y == y_start + 41 && x >= x_start + 41 && x <= x_start + 57 ) ||
					(y == y_start + 42 && x >= x_start + 40 && x <= x_start + 58 ) ||
					(y == y_start + 43 && x >= x_start + 40 && x <= x_start + 59 ) ||
					(y == y_start + 44 && x >= x_start + 40 && x <= x_start + 61 ) ||
					(y == y_start + 45 && x >= x_start + 39 && x <= x_start + 55 ) ||
					(y == y_start + 46 && x >= x_start + 39 && x <= x_start + 55 ) ||
					(y == y_start + 47 && x >= x_start + 38 && x <= x_start + 55 ) ||
					(y == y_start + 48 && x >= x_start + 37 && x <= x_start + 56 ) ||
					(y == y_start + 49 && x >= x_start + 37 && x <= x_start + 56 ) ||
					(y == y_start + 50 && x >= x_start + 37 && x <= x_start + 56 ) ||
					(y == y_start + 51 && x >= x_start + 37 && x <= x_start + 56 ) ||
					(y == y_start + 52 && x >= x_start + 38 && x <= x_start + 55 ) ||
					(y == y_start + 53 && x == x_start + 37) ||
					(y == y_start + 53 && x >= x_start + 39 && x <= x_start + 55 )) oled_data <= 16'h9cf3;
			else if ((y == y_start + 0 && x >= x_start + 0 && x <= x_start + 2449 ) ||
					(y == y_start + 1 && x >= x_start + 0 && x <= x_start + 2353 ) ||
					(y == y_start + 2 && x >= x_start + 0 && x <= x_start + 2257 ) ||
					(y == y_start + 3 && x >= x_start + 0 && x <= x_start + 2161 ) ||
					(y == y_start + 4 && x >= x_start + 0 && x <= x_start + 2065 ) ||
					(y == y_start + 5 && x >= x_start + 0 && x <= x_start + 1969 ) ||
					(y == y_start + 6 && x >= x_start + 0 && x <= x_start + 1873 ) ||
					(y == y_start + 7 && x >= x_start + 0 && x <= x_start + 1777 ) ||
					(y == y_start + 8 && x >= x_start + 0 && x <= x_start + 1681 ) ||
					(y == y_start + 9 && x >= x_start + 0 && x <= x_start + 1585 ) ||
					(y == y_start + 10 && x >= x_start + 0 && x <= x_start + 1489 ) ||
					(y == y_start + 11 && x >= x_start + 0 && x <= x_start + 1393 ) ||
					(y == y_start + 12 && x >= x_start + 0 && x <= x_start + 1297 ) ||
					(y == y_start + 13 && x >= x_start + 0 && x <= x_start + 1201 ) ||
					(y == y_start + 14 && x >= x_start + 0 && x <= x_start + 1105 ) ||
					(y == y_start + 15 && x >= x_start + 0 && x <= x_start + 1009 ) ||
					(y == y_start + 16 && x >= x_start + 0 && x <= x_start + 913 ) ||
					(y == y_start + 17 && x >= x_start + 0 && x <= x_start + 817 ) ||
					(y == y_start + 18 && x >= x_start + 0 && x <= x_start + 721 ) ||
					(y == y_start + 19 && x >= x_start + 0 && x <= x_start + 625 ) ||
					(y == y_start + 20 && x >= x_start + 0 && x <= x_start + 529 ) ||
					(y == y_start + 21 && x >= x_start + 0 && x <= x_start + 433 ) ||
					(y == y_start + 22 && x >= x_start + 0 && x <= x_start + 337 ) ||
					(y == y_start + 23 && x >= x_start + 0 && x <= x_start + 241 ) ||
					(y == y_start + 24 && x >= x_start + 0 && x <= x_start + 145 ) ||
					(y == y_start + 25 && x >= x_start + 0 && x <= x_start + 49 ) ||
					(y == y_start + 25 && x >= x_start + 54 && x <= x_start + 127 ) ||
					(y == y_start + 26 && x >= x_start + 0 && x <= x_start + 31 ) ||
					(y == y_start + 26 && x >= x_start + 33 && x <= x_start + 47 ) ||
					(y == y_start + 26 && x >= x_start + 55 && x <= x_start + 127 ) ||
					(y == y_start + 27 && x >= x_start + 0 && x <= x_start + 31 ) ||
					(y == y_start + 27 && x >= x_start + 33 && x <= x_start + 46 ) ||
					(y == y_start + 27 && x >= x_start + 54 && x <= x_start + 126 ) ||
					(y == y_start + 28 && x >= x_start + 0 && x <= x_start + 30 ) ||
					(y == y_start + 28 && x >= x_start + 34 && x <= x_start + 46 ) ||
					(y == y_start + 28 && x >= x_start + 53 && x <= x_start + 126 ) ||
					(y == y_start + 29 && x >= x_start + 0 && x <= x_start + 30 ) ||
					(y == y_start + 29 && x >= x_start + 35 && x <= x_start + 45 ) ||
					(y == y_start + 29 && x >= x_start + 53 && x <= x_start + 125 ) ||
					(y == y_start + 30 && x >= x_start + 0 && x <= x_start + 29 ) ||
					(y == y_start + 30 && x >= x_start + 36 && x <= x_start + 45 ) ||
					(y == y_start + 30 && x >= x_start + 53 && x <= x_start + 124 ) ||
					(y == y_start + 31 && x >= x_start + 0 && x <= x_start + 28 ) ||
					(y == y_start + 31 && x >= x_start + 38 && x <= x_start + 44 ) ||
					(y == y_start + 31 && x >= x_start + 55 && x <= x_start + 123 ) ||
					(y == y_start + 32 && x >= x_start + 0 && x <= x_start + 27 ) ||
					(y == y_start + 32 && x >= x_start + 36 && x <= x_start + 43 ) ||
					(y == y_start + 32 && x >= x_start + 56 && x <= x_start + 124 ) ||
					(y == y_start + 33 && x >= x_start + 0 && x <= x_start + 28 ) ||
					(y == y_start + 33 && x >= x_start + 35 && x <= x_start + 42 ) ||
					(y == y_start + 33 && x >= x_start + 57 && x <= x_start + 126 ) ||
					(y == y_start + 34 && x >= x_start + 0 && x <= x_start + 30 ) ||
					(y == y_start + 34 && x >= x_start + 34 && x <= x_start + 42 ) ||
					(y == y_start + 34 && x >= x_start + 57 && x <= x_start + 127 ) ||
					(y == y_start + 35 && x >= x_start + 0 && x <= x_start + 31 ) ||
					(y == y_start + 35 && x >= x_start + 34 && x <= x_start + 41 ) ||
					(y == y_start + 35 && x >= x_start + 66 && x <= x_start + 128 ) ||
					(y == y_start + 36 && x >= x_start + 0 && x <= x_start + 32 ) ||
					(y == y_start + 36 && x >= x_start + 34 && x <= x_start + 41 ) ||
					(y == y_start + 36 && x >= x_start + 66 && x <= x_start + 136 ) ||
					(y == y_start + 37 && x >= x_start + 0 && x <= x_start + 40 ) ||
					(y == y_start + 37 && x >= x_start + 66 && x <= x_start + 136 ) ||
					(y == y_start + 38 && x >= x_start + 0 && x <= x_start + 40 ) ||
					(y == y_start + 38 && x >= x_start + 65 && x <= x_start + 135 ) ||
					(y == y_start + 39 && x >= x_start + 0 && x <= x_start + 39 ) ||
					(y == y_start + 39 && x >= x_start + 65 && x <= x_start + 135 ) ||
					(y == y_start + 40 && x >= x_start + 0 && x <= x_start + 39 ) ||
					(y == y_start + 40 && x >= x_start + 64 && x <= x_start + 135 ) ||
					(y == y_start + 41 && x >= x_start + 0 && x <= x_start + 39 ) ||
					(y == y_start + 41 && x >= x_start + 61 && x <= x_start + 134 ) ||
					(y == y_start + 42 && x >= x_start + 0 && x <= x_start + 38 ) ||
					(y == y_start + 42 && x >= x_start + 60 && x <= x_start + 134 ) ||
					(y == y_start + 43 && x >= x_start + 0 && x <= x_start + 38 ) ||
					(y == y_start + 43 && x >= x_start + 64 && x <= x_start + 134 ) ||
					(y == y_start + 44 && x >= x_start + 0 && x <= x_start + 38 ) ||
					(y == y_start + 44 && x >= x_start + 63 && x <= x_start + 133 ) ||
					(y == y_start + 45 && x >= x_start + 0 && x <= x_start + 37 ) ||
					(y == y_start + 45 && x >= x_start + 62 && x <= x_start + 133 ) ||
					(y == y_start + 46 && x >= x_start + 0 && x <= x_start + 37 ) ||
					(y == y_start + 46 && x >= x_start + 58 && x <= x_start + 132 ) ||
					(y == y_start + 47 && x >= x_start + 0 && x <= x_start + 36 ) ||
					(y == y_start + 47 && x >= x_start + 59 && x <= x_start + 131 ) ||
					(y == y_start + 48 && x >= x_start + 0 && x <= x_start + 35 ) ||
					(y == y_start + 48 && x >= x_start + 59 && x <= x_start + 131 ) ||
					(y == y_start + 49 && x >= x_start + 0 && x <= x_start + 35 ) ||
					(y == y_start + 49 && x >= x_start + 59 && x <= x_start + 131 ) ||
					(y == y_start + 50 && x >= x_start + 0 && x <= x_start + 35 ) ||
					(y == y_start + 50 && x >= x_start + 59 && x <= x_start + 131 ) ||
					(y == y_start + 51 && x >= x_start + 0 && x <= x_start + 35 ) ||
					(y == y_start + 51 && x >= x_start + 59 && x <= x_start + 131 ) ||
					(y == y_start + 52 && x >= x_start + 0 && x <= x_start + 35 ) ||
					(y == y_start + 52 && x >= x_start + 59 && x <= x_start + 132 ) ||
					(y == y_start + 53 && x >= x_start + 0 && x <= x_start + 36 ) ||
					(y == y_start + 53 && x >= x_start + 58 && x <= x_start + 134 ) ||
					(y == y_start + 54 && x >= x_start + 0 && x <= x_start + 38 ) ||
					(y == y_start + 54 && x >= x_start + 57 && x <= x_start + 959 ) ||
					(y == y_start + 55 && x >= x_start + 0 && x <= x_start + 863 ) ||
					(y == y_start + 56 && x >= x_start + 0 && x <= x_start + 767 ) ||
					(y == y_start + 57 && x >= x_start + 0 && x <= x_start + 671 ) ||
					(y == y_start + 58 && x >= x_start + 0 && x <= x_start + 575 ) ||
					(y == y_start + 59 && x >= x_start + 0 && x <= x_start + 479 ) ||
					(y == y_start + 60 && x >= x_start + 0 && x <= x_start + 383 ) ||
					(y == y_start + 61 && x >= x_start + 0 && x <= x_start + 287 ) ||
					(y == y_start + 62 && x >= x_start + 0 && x <= x_start + 191 ) ||
					(y == y_start + 63 && x >= x_start + 0 && x <= x_start + 95 )) oled_data <= 16'h07e1;
			
		end
		2: //dead pig
		begin
		
		end
		endcase
	end
	
endmodule
