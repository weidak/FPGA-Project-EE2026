
`define YELLOW 16'hFFA0
`define GREEN 16'h2FE0
`define RED 16'hF800;
`define BLUE 16'b00000_000000_11111
`define ORANGE 16'b11111_100110_00000
`define GREY 16'b01100_011000_01100



module wave(
	input clock_6pt25mhz,
	input clock_20khz,
//    input sw,
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
	
	
	/*assign vol[0] = led[0] && (y >= `LEVEL15 && y <= `BARHEIGHT);
	assign vol[1] = led[1] && (y >= `LEVEL14 && y <= `LEVEL15);
	assign vol[2] = led[2] && (y >= `LEVEL13 && y <= `LEVEL14);
	assign vol[3] = led[3] && (y >= `LEVEL12 && y <= `LEVEL13);
	assign vol[4] = led[4] && (y >= `LEVEL11 && y <= `LEVEL12);
	assign vol[5] = led[5] && (y >= `LEVEL10 && y <= `LEVEL11);
	assign vol[6] = led[6] && (y >= `LEVEL9 && y <= `LEVEL10);
	assign vol[7] = led[7] && (y >= `LEVEL8 && y <= `LEVEL9);
	assign vol[8] = led[8] && (y >= `LEVEL7 && y <= `LEVEL8);
	assign vol[9] = led[9] && (y >= `LEVEL6 && y <= `LEVEL7);
	assign vol[10] = led[10] && (y >= `LEVEL5 && y <= `LEVEL6);
	assign vol[11] = led[11] && (y >= `LEVEL4 && y <= `LEVEL5);
	assign vol[12] = led[12] && (y >= `LEVEL3 && y <= `LEVEL4);
	assign vol[13] = led[13] && (y >= `LEVEL2 && y <= `LEVEL3);
	assign vol[14] = led[14] && (y >= `LEVEL1 && y <= `LEVEL2);
	assign vol[15] = led[15] && (y >= `LEVEL0 && y <= `LEVEL1);
	
	
	always @ (posedge clock_6pt25mhz) begin
		if (vol[11] || vol[12] || vol[13] || vol[14] || vol[15]) oled_data <= 16'hf800;
		else if (vol[6] || vol[7] || vol[8] || vol[9] || vol[10]) oled_data <= 16'hFFE0;
		else if (vol[0] || vol[1] || vol[2] || vol[3] || vol[4] || vol[5]) oled_data <= 16'h07e0;
	end*/
	
	//assign oled_data =  (vol[11] || vol[12] || vol[13] || vol[14] || vol[15]) ? 16'hf800 : (vol[6] || vol[7] || vol[8] || vol[9] || vol[10]) ? 16'hFFE0 : (vol[0] || vol[1] || vol[2] || vol[3] || vol[4] || vol[5]) ? 16'h07e0 : 0;
	
	/*
	always @ (posedge clock_6pt25mhz) begin
		if (vol[0])  	oled_data = 16'h07E0;
		if (vol[1])  	oled_data = 16'h07E0;
		if (vol[2])  	oled_data = 16'h07E0;
		if (vol[3])  	oled_data = 16'h07E0;
		if (vol[4])  	oled_data = 16'h07E0;
		if (vol[5])  	oled_data = 16'h07E0;
		if (vol[6])  	oled_data = 16'hFFE0;
		if (vol[7])  	oled_data = 16'hFFE0;
		if (vol[8])  	oled_data = 16'hFFE0;
		if (vol[9])  	oled_data = 16'hFFE0;
		if (vol[10])  	oled_data = 16'hFFE0;
		if (vol[11]) 	oled_data = 16'hF800;
		if (vol[12]) 	oled_data = 16'hF800;
		if (vol[13]) 	oled_data = 16'hF800;
		if (vol[14]) 	oled_data = 16'hF800;
		if (vol[15]) 	oled_data = 16'hF800;
		end
	end*/
	
	/*
	reg print_colour1 = 0;
	reg print_colour2 = 0;
	reg print_colour3 = 0;
	
	reg invert_y[7:0] = 0;
	
	reg [6:0] value;
	
	always @ (posedge clock_20khz) begin
		value <= mic_in[11:0];
		invert_y <= 63 - y;
		print_colour1 <= (value > invert_y) ? (value >= 2100 && value <= 2700) : 0;
		print_colour2 <= (value > invert_y) ? (value > 2700 && value <= 3300) : 0;
		print_colour3 <= (value > invert_y) ? (value > 3300 && value <= 4000) : 0;
	end
	
	always @ (posedge clock_6pt25mhz) begin
		if (print_colour1) 
			oled_data <= `GREEN; 
		else if (print_colour2) 
			oled_data <= `YELLOW; 
		else if (print_colour3) 
			oled_data <= `RED; 
	end
	*/
	
	
	
	
	/*
    localparam barRange = 21;
    localparam greRange = 10;
    localparam yelRange = 20;
	
    wire [`PIXELXYBIT:0] yreflect;
    reg [5:0] num, transnum; // value from 0 to 63
    reg ygre, yyel, yred;
    assign yreflect = `HEIGHT - 1 - y;
	
    
//    sw on: only positive sound, default: nice wave
    always @ (*) begin
        if (sw) begin
            num = (mic_in[11] ? mic_in[10:5] : 0);
            if (yreflect < num) begin
                ygre = (num >= 1 && num <= barRange);
                yyel = (num >= 1+barRange && num <= 2*barRange);
                yred = (num >= 1+2*barRange);
            end else begin
                ygre = 0;
                yyel = 0;
                yred = 0;
            end
        end else begin
            num = mic_in[11:6];
            transnum = num > `HEIGHT/2 ? num : `HEIGHT - num; // get value above x-axis
            if (yreflect < transnum && yreflect > `HEIGHT - transnum) begin
                ygre = (transnum <= `HEIGHT/2 + greRange && transnum >= `HEIGHT/2 - greRange);
                yyel = !ygre && (transnum <= `HEIGHT/2 + yelRange && transnum >= `HEIGHT/2 - yelRange);
                yred = !yyel && (transnum > `HEIGHT/2 + yelRange && transnum < `HEIGHT/2 - yelRange);
            end else begin
                ygre = 0;
                yyel = 0;
                yred = 0;
            end
        end
    end
    
	always @ (posedge clock_6pt25mhz) begin
		oled_data <= ygre ? `GREEN : yyel ? `YELLOW : yred ? `RED :
                       sw && !num && !yreflect || 
                       !sw && num == `HEIGHT/2 && yreflect == `HEIGHT/2 ? `WHITE : `BLACK;
	end*/
endmodule