`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2021 16:06:02
// Design Name: 
// Module Name: coordinate_system
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


module coordinate_system(input [12:0] pixel_index, output [7:0] x, output [7:0] y);

    assign x = pixel_index%96;
    assign y = pixel_index/96;
   
endmodule
