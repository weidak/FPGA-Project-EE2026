`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 11:20:02 PM
// Design Name: 
// Module Name: display_seg
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


module volbar_audio(
	input clk_20khz, clk_381hz, clk_5hz,
	input [1:0]sw,
	input [11:0]mic_in,
	output [15:0]led,
	output [3:0]an,
	output [6:0]seg,
	output reg[3:0] display_number = 0
	);

    reg [11:0]peak = 0;
    reg [11:0]reset_peak = 0;

    //Sampling at 4000 times per second for the peak
    always @ (posedge clk_20khz) begin
        reset_peak <= reset_peak + 1;
        if (reset_peak == 0) 
            peak <= 0;
        if (mic_in > peak)
            peak <= mic_in;
    end

    reg [15:0]led_display;
	reg [15:0]led_display1;
    reg [10:0]display_value = 0;
    reg [1:0]display_case = 0;
    reg [3:0]an_disp;
    reg [6:0]seg_disp;

    assign an = an_disp;
    assign seg = seg_disp;

    reg [6:0]character_L = 7'b1000111;
    reg [6:0]character_M = 7'b1101010;
    reg [6:0]character_H = 7'b0001001;

    reg [6:0]no_9 = 7'b0011000;
    reg [6:0]no_8 = 7'b0000000; 
    reg [6:0]no_7 = 7'b1111000;
    reg [6:0]no_6 = 7'b0000010;
    reg [6:0]no_5 = 7'b0010010;
    reg [6:0]no_4 = 7'b0011001;
    reg [6:0]no_3 = 7'b0110000;
    reg [6:0]no_2 = 7'b0100100;
    reg [6:0]no_1 = 7'b1111001;
    reg [6:0]no_0 = 7'b1000000;

    always @ (posedge clk_381hz) begin
        display_case <= display_case + 1;
        case(display_case)
            0: begin 
                an_disp <= 4'b1011;
                if (display_number == 0) seg_disp <= no_0;
                if (display_number == 1) seg_disp <= no_1;
                if (display_number == 2) seg_disp <= no_2;
                if (display_number == 3) seg_disp <= no_3;
                if (display_number == 4) seg_disp <= no_4;
                if (display_number == 5) seg_disp <= no_5;
                if (display_number == 6) seg_disp <= no_6;
                if (display_number == 7) seg_disp <= no_7;
                if (display_number == 8) seg_disp <= no_8;
                if (display_number == 9) seg_disp <= no_9;
                if (display_number == 10) seg_disp <= no_0;
                if (display_number == 11) seg_disp <= no_1;
                if (display_number == 12) seg_disp <= no_2;
                if (display_number == 13) seg_disp <= no_3;
                if (display_number == 14) seg_disp <= no_4;
                if (display_number == 15) seg_disp <= no_5;
               end
            1: begin 
                an_disp <= 4'b0111;
                if (display_number == 0) seg_disp <= no_0;
                if (display_number == 1) seg_disp <= no_0;
                if (display_number == 2) seg_disp <= no_0;
                if (display_number == 3) seg_disp <= no_0;
                if (display_number == 4) seg_disp <= no_0;
                if (display_number == 5) seg_disp <= no_0;
                if (display_number == 6) seg_disp <= no_0;
                if (display_number == 7) seg_disp <= no_0;
                if (display_number == 8) seg_disp <= no_0;
                if (display_number == 9) seg_disp <= no_0;
                if (display_number == 10) seg_disp <= no_1;
                if (display_number == 11) seg_disp <= no_1;
                if (display_number == 12) seg_disp <= no_1;
                if (display_number == 13) seg_disp <= no_1;
                if (display_number == 14) seg_disp <= no_1;
                if (display_number == 15) seg_disp <= no_1;
            end                    
            2: begin
                an_disp <= 4'b1111;
                seg_disp <= 7'b1111111;
            end
            3: begin 
                an_disp <= 4'b1110;
                if (display_number >= 0 && display_number < 5)
                    seg_disp <= character_L;
                if (display_number >= 5 && display_number < 10)
                    seg_disp <= character_M;
                if (display_number >= 10 && display_number <= 15)
                    seg_disp <= character_H;                
                end
       endcase

	end
	
    always @ (posedge clk_5hz) begin

    display_value <= (peak/128);

        case (display_value)
            16: begin led_display <= 16'b0000_0000_0000_0001; display_number <= 0; end
            17: begin led_display <= 16'b0000_0000_0000_0011; display_number <= 1; end
            18: begin led_display <= 16'b0000_0000_0000_0111; display_number <= 2; end
            19: begin led_display <= 16'b0000_0000_0000_1111; display_number <= 3; end
            20: begin led_display <= 16'b0000_0000_0001_1111; display_number <= 4; end
            21: begin led_display <= 16'b0000_0000_0011_1111; display_number <= 5; end
            22: begin led_display <= 16'b0000_0000_0111_1111; display_number <= 6; end
            23: begin led_display <= 16'b0000_0000_1111_1111; display_number <= 7; end
            24: begin led_display <= 16'b0000_0001_1111_1111; display_number <= 8; end
            25: begin led_display <= 16'b0000_0011_1111_1111; display_number <= 9; end
            26: begin led_display <= 16'b0000_0111_1111_1111; display_number <= 10; end
            27: begin led_display <= 16'b0000_1111_1111_1111; display_number <= 11; end
            28: begin led_display <= 16'b0001_1111_1111_1111; display_number <= 12; end
            29: begin led_display <= 16'b0011_1111_1111_1111; display_number <= 13; end
            30: begin led_display <= 16'b0111_1111_1111_1111; display_number <= 14; end
            31: begin led_display <= 16'b1111_1111_1111_1111; display_number <= 15; end
        endcase
		
	if (mic_in > 2000 && mic_in <= 2125)
		led_display1 <= 16'b0000_0000_0000_0001;
	else if (mic_in > 2125 && mic_in <= 2250)
        led_display1 <= 16'b0000_0000_0000_0011;
	else if (mic_in > 2250 && mic_in <= 2375)  
		led_display1 <= 16'b0000_0000_0000_0111;
    else if (mic_in > 2375 && mic_in <= 2500)  
        led_display1 <= 16'b0000_0000_0000_1111;
	else if (mic_in > 2500 && mic_in <= 2625)              
        led_display1 <= 16'b0000_0000_0001_1111;
    else if (mic_in > 2625 && mic_in <= 2750)  
        led_display1 <= 16'b0000_0000_0011_1111;
    else if (mic_in > 2750 && mic_in <= 2875)  
        led_display1 <= 16'b0000_0000_0111_1111;
    else if (mic_in > 2875 && mic_in <= 3000)  
        led_display1 <= 16'b0000_0000_1111_1111;
    else if (mic_in > 3000 && mic_in <= 3125)  
        led_display1 <= 16'b0000_0001_1111_1111;
    else if (mic_in > 3125 && mic_in <= 3250)  
        led_display1 <= 16'b0000_0011_1111_1111;
    else if (mic_in > 3250 && mic_in <= 3350)  
        led_display1 <= 16'b0000_0111_1111_1111;
    else if (mic_in > 3350 && mic_in <= 3500)  
        led_display1 <= 16'b0000_1111_1111_1111;
    else if (mic_in > 3500 && mic_in <= 3625)  
        led_display1 <= 16'b0001_1111_1111_1111;
    else if (mic_in > 3625 && mic_in <= 3750)  
        led_display1 <= 16'b0011_1111_1111_1111;
	else if (mic_in > 3750 && mic_in <= 3875)  
		led_display1 <= 16'b0111_1111_1111_1111;
    else if (mic_in > 3875 && mic_in <= 4000)  
        led_display1 <= 16'b1111_1111_1111_1111;
		
    end

    assign led = (sw[0] == 1) ? led_display : led_display1;

endmodule