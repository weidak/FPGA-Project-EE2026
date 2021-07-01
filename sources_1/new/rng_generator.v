`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2021 10:31:39 PM
// Design Name: 
// Module Name: rng_generator
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


module rng_generator(
	input clock,
	output [3:0]random_number
    );
	
	reg [3:0]Q = 0;
	
	always @ (posedge clock) 
	begin
		Q[3] <= Q[2];
		Q[2] <= Q[1];
		Q[1] <= Q[0];
		Q[0] <= ~(Q[2]^Q[3]);	

	end
	
	assign random_number = Q;
	
endmodule
