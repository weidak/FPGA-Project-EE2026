
`define YELLOW 16'hFFA0
`define GREEN 16'h2FE0
`define RED 16'hF800;
`define BLUE 16'b00000_000000_11111
`define ORANGE 16'b11111_100110_00000
`define GREY 16'b01100_011000_01100



module wave(
	input clock_6pt25mhz,
	input clock_20khz,
	input [11:0] mic_in,
	input [15:0] led,
    input [12:0] x, y,
    output reg [15:0]oled_data    
    );
	
	wire [15:0] vol;
	
	assign vol[0] = (mic_in[0] || led[0]) &&  (y == 57 || y == 58);
	assign vol[1] = (mic_in[1] || led[1]) && (y == 54 || y == 55 || y == 57 || y == 58);
	assign vol[2] = (mic_in[2] || led[2]) && (y == 51 || y == 52 || y == 54 || y == 55 || y == 57 || y == 58);
	assign vol[3] = (mic_in[3] || led[3]) && (y == 48 || y == 49 || y == 51 || y == 52 || y == 54 || y == 55 || y == 57 || y == 58);
	assign vol[4] = (mic_in[4] || led[4]) && (y == 45 || y == 46 || y == 48 || y == 49 || y == 51 || y == 52 || y == 54 || y == 55 || y == 57 || y == 58);
	assign vol[5] = (mic_in[5] || led[5]) && (y == 42 || y == 43 || y == 45 || y == 46 || y == 48 || y == 49 || y == 51 || y == 52 || y == 54 || y == 55 || y == 57 || y == 58);
	assign vol[6] = (mic_in[6] || led[6]) && (y == 39 || y == 40);
	assign vol[7] = (mic_in[7] || led[7]) && (y == 36 || y == 37 || y == 39 || y == 40);
	assign vol[8] = (mic_in[8] || led[8]) && (y == 33 || y == 34 || y == 36 || y == 37 || y == 39 || y == 40);
	assign vol[9] = (mic_in[9] || led[9]) && (y == 30 || y == 31 || y == 33 || y == 34 || y == 36 || y == 37 || y == 39 || y == 40);
	assign vol[10] = (mic_in[10] || led[10]) && (y == 27 || y == 28 || y == 30 || y == 31 || y == 33 || y == 34 || y == 36 || y == 37 || y == 39 || y == 40);
	assign vol[11] = (mic_in[11] || led[11]) && (y == 24 || y == 25);
	assign vol[12] = led[12] && (y == 21 || y == 22 || y == 24 || y == 25);
	assign vol[13] = led[13] && (y == 18 || y == 19 || y == 21 || y == 22 || y == 24 || y == 25);
	assign vol[14]= led[14] && (y == 15 || y == 16 || y == 18 || y == 19 || y == 21 || y == 22 || y == 24 || y == 25);
	assign vol[15] = led[15] && (y == 12 || y == 13 || y == 15 || y == 16 || y == 18 || y == 19 || y == 21 || y == 22 || y == 24 || y == 25);
	
	reg [2:0]sw = 0;
	
	always @(*)
	begin
		if (vol[0])  	oled_data = (sw[2] == 0) ? 16'h8F3D : 16'h07E0;
		if (vol[1])  	oled_data = (sw[2] == 0) ? 16'h8F3D : 16'h07E0;
		if (vol[2])  	oled_data = (sw[2] == 0) ? 16'h8F3D : 16'h07E0;
		if (vol[3])  	oled_data = (sw[2] == 0) ? 16'h8F3D : 16'h07E0;
		if (vol[4])  	oled_data = (sw[2] == 0) ? 16'h8F3D : 16'h07E0;
		if (vol[5])  	oled_data = (sw[2] == 0) ? 16'h8F3D : 16'h07E0;
		if (vol[6])  	oled_data = (sw[2] == 0) ? 16'h34B4 : 16'hFFE0;
		if (vol[7])  	oled_data = (sw[2] == 0) ? 16'h34B4 : 16'hFFE0;
		if (vol[8])  	oled_data = (sw[2] == 0) ? 16'h34B4 : 16'hFFE0;
		if (vol[9])  	oled_data = (sw[2] == 0) ? 16'h34B4 : 16'hFFE0;
		if (vol[10])  	oled_data = (sw[2] == 0) ? 16'h34B4 : 16'hFFE0;
		if (vol[11]) 	oled_data = (sw[2] == 0) ? 16'h218F : 16'hF800;
		if (vol[12]) 	oled_data = (sw[2] == 0) ? 16'h218F : 16'hF800;
		if (vol[13]) 	oled_data = (sw[2] == 0) ? 16'h218F : 16'hF800;
		if (vol[14]) 	oled_data = (sw[2] == 0) ? 16'h218F : 16'hF800;
		if (vol[15]) 	oled_data = (sw[2] == 0) ? 16'h218F : 16'hF800;

	end
	

endmodule
