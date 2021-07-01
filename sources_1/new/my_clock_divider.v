`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2021 14:40:44
// Design Name: 
// Module Name: my_clock_divider
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


module my_clock_divider(input basys_clock, input [31:0] m, output reg desired_clock = 0);
    reg [31:0] COUNT = 0;
    
    always @ (posedge basys_clock) begin
        COUNT <= (COUNT == m) ? 0 : COUNT + 1;
        desired_clock <= (COUNT == 0) ? ~desired_clock : desired_clock;
    end
    
endmodule
