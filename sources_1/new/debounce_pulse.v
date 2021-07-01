`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2021 20:46:50
// Design Name: 
// Module Name: debounce_pulse
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


module debounce_pulse(input sp_clock, my_sb, output my_sp);

    wire dff_out_1, dff_out_2;
 
    dff dff_1 (.DFF_CLOCK(sp_clock), .D(my_sb), .Q(dff_out_1));
    dff dff_2 (.DFF_CLOCK(sp_clock), .D(dff_out_1), .Q(dff_out_2));
    
    assign my_sp = dff_out_1 & ~dff_out_2;
	
endmodule
