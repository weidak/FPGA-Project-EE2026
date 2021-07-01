`timescale 1ns / 1ps
`define WHITE 16'hffff
//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): MONDAY P.M, TUESDAY P.M, WEDNESDAY P.M, THURSDAY A.M., THURSDAY P.M
//
//  STUDENT A NAME: 
//  STUDENT A MATRICULATION NUMBER: 
//
//  STUDENT B NAME: 
//  STUDENT B MATRICULATION NUMBER: 
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
	input CLK100MHZ,
	input  btnC, btnL, btnR,
	input [4:0] sw,
	output [6:0] seg,
	output [3:0] an,
	output [15:0]led,
	output cs, sdin, sclk, d_cn, resn, vccen, pmoden,
	input  J_MIC3_Pin3, 
    output J_MIC3_Pin1, J_MIC3_Pin4
	);
   
	//Clocks, Buttons
	wire  clock_6pt25mhz, clock_20khz, clock_4khz,clock_381hz, clock_5hz, clock_25hz;
	wire reset_pulse, buttonL, buttonR;
    
	//OLED
	wire frame_begin, sending_pixels, sample_pixel; //Unused wires
    reg[15:0] oled_data = 0;
	wire[15:0] oled_volbar;
	//wire [15:0] oled_soundbar [0:95];
	// wire oled_soundbar0;
	// wire oled_soundbar1;
	// wire oled_soundbar2;
	// wire oled_soundbar3;
	wire oled_soundbar [0:95];
    wire [12:0] pixel_index;
	wire[7:0] x,y;
	
	//Mic
	wire [11:0]mic_in; 
	wire [15:0]audio_sample;
	
	reg [7:0]x_start = 2;
	reg [7:0]y_start = 30;
	
	//Clock Modules
	my_clock_divider clock_6pt25m (.basys_clock(CLK100MHZ), .m(7), .desired_clock(clock_6pt25mhz));
	my_clock_divider clock_20k(.basys_clock(CLK100MHZ), .m(2499), .desired_clock(clock_20khz));
	my_clock_divider clock_4k(.basys_clock(CLK100MHZ),.m(12499), .desired_clock(clock_4khz));
	my_clock_divider clock_381hz (.basys_clock(CLK100MHZ),.m(131232), .desired_clock(clock_381hz));
	my_clock_divider clock_5hz (.basys_clock(CLK100MHZ),.m(4999999), .desired_clock(clock_5hz));
	my_clock_divider clock_25(.basys_clock(CLK100MHZ), .m(1999999), .desired_clock(clock_25hz));


	
	//Button Modules
	reset_pulse sp(.sp_clock(clock_6pt25mhz), .my_pb(btnC), .my_sp(reset_pulse));
	debounce_pulse buttonL(.sp_clock(clock_25hz), .my_sb(btnL), .my_sp(buttonL));
	debounce_pulse buttonR(.sp_clock(clock_25hz), .my_sb(btnR), .my_sp(buttonR));	
	
	//OLED Modules
	Oled_Display led_disp(.clk(clock_6pt25mhz), .reset(reset_pulse), .frame_begin(frame_begin), .sending_pixels(sending_pixels),
	.sample_pixel(sample_pixel), .pixel_index(pixel_index), .pixel_data(oled_data), .cs(cs), .sdin(sdin), .sclk(sclk), .d_cn(d_cn), .resn(resn), .vccen(vccen),
	.pmoden(pmoden), .teststate(teststate));
    
    coordinate_system coords(.pixel_index(pixel_index), .x(x), .y(y));
	
	//Mic Modules  
    Audio_Capture audio (.CLK(CLK100MHZ), .cs(clock_20khz), .MISO(J_MIC3_Pin3),  .clk_samp(J_MIC3_Pin1), .sclk(J_MIC3_Pin4), .sample(mic_in));
    
  /*  always @(posedge clock_20khz)
    begin
        oled_data <= {mic_in[11:7], 6'b000000, 5'b00000};
    end
*/
	//Volume Bar
	volbar_audio disp(.clk_20khz(clock_20khz), .clk_381hz(clock_381hz), .clk_5hz(clock_5hz),.mic_in(mic_in) , .sw(sw), .led(audio_sample), .an(an), .seg(seg));
	//Previous volbar
	//volbar_disp volbar(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .buttonL(buttonL), .buttonR(buttonR), .sw(sw), .led(audio_sample), .x(x), .y(y), .oled_data(oled_volbar));
	print_bar bar_1(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[0]), .x(x), .y(y), .x_start(x_start), .y_start(y_start), .print_volume(oled_soundbar[0]));
	print_bar bar_2(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[1]), .x(x), .y(y), .x_start(x_start + 1), .y_start(y_start), .print_volume(oled_soundbar[1]));
	print_bar bar_3(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[2]), .x(x), .y(y), .x_start(x_start + 2), .y_start(y_start), .print_volume(oled_soundbar[2]));
	print_bar bar_4(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[3]), .x(x), .y(y), .x_start(x_start + 3), .y_start(y_start), .print_volume(oled_soundbar[3]));
	print_bar bar_5(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[4]), .x(x), .y(y), .x_start(x_start + 4), .y_start(y_start), .print_volume(oled_soundbar[4]));
	print_bar bar_6(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[5]), .x(x), .y(y), .x_start(x_start + 5), .y_start(y_start), .print_volume(oled_soundbar[5]));
	print_bar bar_7(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[6]), .x(x), .y(y), .x_start(x_start + 6), .y_start(y_start), .print_volume(oled_soundbar[6]));
	print_bar bar_8(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[7]), .x(x), .y(y), .x_start(x_start + 7), .y_start(y_start), .print_volume(oled_soundbar[7]));
	print_bar bar_9(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[8]), .x(x), .y(y), .x_start(x_start + 8), .y_start(y_start), .print_volume(oled_soundbar[8]));
	print_bar bar_10(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[9]), .x(x), .y(y), .x_start(x_start + 9), .y_start(y_start), .print_volume(oled_soundbar[9]));
	print_bar bar_11(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[10]), .x(x), .y(y), .x_start(x_start + 10), .y_start(y_start), .print_volume(oled_soundbar[10]));
	print_bar bar_12(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[11]), .x(x), .y(y), .x_start(x_start + 11), .y_start(y_start), .print_volume(oled_soundbar[11]));
	print_bar bar_13(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[12]), .x(x), .y(y), .x_start(x_start + 12), .y_start(y_start), .print_volume(oled_soundbar[12]));
	print_bar bar_14(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[13]), .x(x), .y(y), .x_start(x_start + 13), .y_start(y_start), .print_volume(oled_soundbar[13]));
	print_bar bar_15(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[14]), .x(x), .y(y), .x_start(x_start + 14), .y_start(y_start), .print_volume(oled_soundbar[14]));
	print_bar bar_16(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[15]), .x(x), .y(y), .x_start(x_start + 15), .y_start(y_start), .print_volume(oled_soundbar[15]));	
	print_bar bar_17(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[16]), .x(x), .y(y), .x_start(x_start + 16), .y_start(y_start), .print_volume(oled_soundbar[16]));
	print_bar bar_18(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[17]), .x(x), .y(y), .x_start(x_start + 17), .y_start(y_start), .print_volume(oled_soundbar[17]));
	print_bar bar_19(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[18]), .x(x), .y(y), .x_start(x_start + 18), .y_start(y_start), .print_volume(oled_soundbar[18]));
	print_bar bar_20(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[19]), .x(x), .y(y), .x_start(x_start + 19), .y_start(y_start), .print_volume(oled_soundbar[19]));
	print_bar bar_21(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[20]), .x(x), .y(y), .x_start(x_start + 20), .y_start(y_start), .print_volume(oled_soundbar[20]));
	print_bar bar_22(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[21]), .x(x), .y(y), .x_start(x_start + 21), .y_start(y_start), .print_volume(oled_soundbar[21]));
	print_bar bar_23(.clock_6pt25mhz(clock_6pt25mhz), .clock_25hz(clock_25hz), .sw(sw), .audio_sample(sample_mem[22]), .x(x), .y(y), .x_start(x_start + 22), .y_start(y_start), .print_volume(oled_soundbar[22]));
	
	
	
	assign led = (sw[0]) ? audio_sample : mic_in;
	integer i = 0;
	always @(posedge CLK100MHZ)
	begin
		//i <= (i == 91) ? 0 : i + 1;
		//x_start <= (x_start == 91) ? 2 : x_start + 1;
		// oled_data <= (sw[3]) ? oled_soundbar : oled_volbar;
		
	end
	
	always @(posedge clock_6pt25mhz)
	begin
		if (x == x_start && oled_soundbar[0]) oled_data <= `WHITE;
		else if (x == x_start + 1 && oled_soundbar[1]) oled_data <= 16'h17E0;
		else if (x == x_start + 2 && oled_soundbar[2]) oled_data <= 16'hffE0;
		else if (x == x_start + 3 && oled_soundbar[3]) oled_data <= 16'h07E0;
		else if (x == x_start + 4 && oled_soundba]) oled_data <= 16'h07E0;
		else if (x == x_start + 6 && oled_soundbar[6]) oled_data <= 16'h07E0;
		else if (x == x_start + 7 && oled_soundbar[7]) oled_data <= 16'h07E0;
		else if (x == x_start + 8 && oled_soundbar[8]) oled_data <= 16'h07E0;
		else if (x == x_start + 9 && oled_soundbar[9]) oled_data <= 16'h07E0;
		else if (x == x_start + 10 && oled_soundbar[10]) oled_data <= 16'h07E0;
		else if (x == x_start + 11 && oled_soundbar[11]) oled_data <= 16'h07E0;
		else if (x == x_start + 12 && oled_soundbar[12]) oled_data <= 16'h07E0;
		else oled_data <= 0;
		// i <= (i == 23) ? 0 : i + 1;
		// if ((x == x_start + i) && oled_soundbar[i]) oled_data <= `WHITE;
		// else oled_data <= 0;
	end
	
	
	integer dx = 0;
	integer dx_invert = 0;
	reg [15:0]sample_mem[0:95];
	reg [15:0]invert_sample_mem[91:0];

	
	always @ (posedge clock_4khz) begin
		dx <= (dx == 23) ? 0 : dx + 1;
		if (dx < 23)
			sample_mem[i] = sample_mem[i+1];
		else 
			sample_mem[dx] <= audio_sample;
		//dx_invert
		
	end
	
	//print_bar(.x(x), .y(y), .x_start(x_start), .y_start(y_start), .clock_6pt25mhz(clock_6pt25mhz),.stored_sample(sample_mem[0]), .oled_data(oled_volbar));
	
  
endmodule