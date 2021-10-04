`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 09:59:49 PM
// Design Name: 
// Module Name: wave_print
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


module wave_print (
	input CLK100MHZ,
	input clock_20khz,
	input clock_6pt25mhz,
	input [11:0] mic_in,
	input [4:0] sw,
	input [7:0]x,y,
	output [15:0]oled_data
	);
    
	//Storage for Audio Waveforms
	reg [4:0] sample_memory [95:0];
	reg [3:0] sample_memory1 [95:0];
	
	//Counter
	reg [7:0] i = 0;
	
	//Bitshifted, cases for mic_in
	reg [11:0]mic_in_direct = 0;
	reg [11:0]mic_in_direct_short = 0;
	reg [3:0]mic_in_display_short;
	reg [4:0]mic_in_display;
	
	wire[15:0] oled_soundbar;
	
	always @ (posedge clock_20khz) begin
	
	mic_in_direct <=  (mic_in/64);
	mic_in_direct_short <= (mic_in/128);
	
		case (mic_in_direct_short)
		
			16: begin mic_in_display_short <= 0; end
            17: begin mic_in_display_short <= 1; end
            18: begin mic_in_display_short <= 2; end
            19: begin mic_in_display_short <= 3; end
            20: begin mic_in_display_short <= 4; end
            21: begin mic_in_display_short <= 5; end
            22: begin mic_in_display_short <= 6; end
            23: begin mic_in_display_short <= 7; end
            24: begin mic_in_display_short <= 8; end
            25: begin mic_in_display_short <= 9; end
            26: begin mic_in_display_short <= 10; end
            27: begin mic_in_display_short <= 11; end
            28: begin mic_in_display_short <= 12; end
            29: begin mic_in_display_short <= 13; end
            30: begin mic_in_display_short <= 14; end
            31: begin mic_in_display_short <= 15; end
		endcase
		
		case (mic_in_direct)

			32:  begin mic_in_display <= 0; end
			33:  begin mic_in_display <= 1; end
			34:  begin mic_in_display <= 2; end
			35:  begin mic_in_display <= 3; end
			36:  begin mic_in_display <= 4; end 
			37:  begin mic_in_display <= 5; end
			38:  begin mic_in_display <= 6; end
			39:  begin mic_in_display <= 7; end
			40:  begin mic_in_display <= 8; end
			41:  begin mic_in_display <= 9; end
			42:  begin mic_in_display <= 10; end
			43:  begin mic_in_display <= 11; end
			44:  begin mic_in_display <= 12; end
			45:  begin mic_in_display <= 13; end
			46:  begin mic_in_display <= 14; end
			47:  begin mic_in_display <= 15; end 
			48:  begin mic_in_display <= 16; end 
			49:  begin mic_in_display <= 17; end 
			50:  begin mic_in_display <= 18; end 
			51:  begin mic_in_display <= 19; end 
			52:  begin mic_in_display <= 20; end 
			53:  begin mic_in_display <= 21; end 
			54:  begin mic_in_display <= 22; end 
			55:  begin mic_in_display <= 23; end 
			56:  begin mic_in_display <= 24; end 
			57:  begin mic_in_display <= 25; end 
			58:  begin mic_in_display <= 26; end 
			59:  begin mic_in_display <= 27; end 
			60:  begin mic_in_display <= 28; end 
			61:  begin mic_in_display <= 29; end 
			62:  begin mic_in_display <= 30; end 
			63:  begin mic_in_display <= 31; end 			
		endcase
		
	end

	
	always @(posedge clock_20khz)
	begin
		i <= (i == 95) ? 0 : i + 1;
		if (i < 95) begin
			sample_memory[i] <= sample_memory[i + 1]; 
			sample_memory1[i] <= sample_memory1[i + 1];
		end
		else begin
			sample_memory[i] <= mic_in_display; //32 levels ...
			sample_memory1[i] <= mic_in_display_short;
		end
	end
	
	
	print_bar print_wave(.sw(sw),.clock_6pt25mhz(clock_6pt25mhz), .volume(sample_memory[x]), .volume1(sample_memory1[x]), .y(y), .oled_data(oled_soundbar));
	
	assign oled_data = oled_soundbar;
	
endmodule
