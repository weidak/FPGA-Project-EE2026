`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2021 16:10:19
// Design Name: 
// Module Name: reset_pulse
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

module reset_pulse(input sp_clock, my_pb, output my_sp);
    wire dff_out_1, dff_out_2;
   
    d_ff dff_1 (.DFF_CLOCK(sp_clock), .D(my_pb), .Q(dff_out_1));
    d_ff dff_2 (.DFF_CLOCK(sp_clock), .D(dff_out_1), .Q(dff_out_2));
    
    assign my_sp = dff_out_1 & ~dff_out_2;

endmodule


