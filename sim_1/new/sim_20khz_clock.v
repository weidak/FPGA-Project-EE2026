`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2021 14:42:57
// Design Name: 
// Module Name: sim_20hz_clock
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


module sim_20khz_clock();
    reg sim_basys_clock;
    reg [31:0] m = 32'd2499;
    wire sim_20khz_clock;
    
     my_clock_divider clock_20khz (.basys_clock(sim_basys_clock), .m(m), .desired_clock(sim_20khz_clock));
    
    initial begin
        sim_basys_clock = 0;
    end
    
    always begin
        #5 sim_basys_clock = ~sim_basys_clock;
    end
    
   
endmodule