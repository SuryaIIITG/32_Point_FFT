`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2024 18:03:28
// Design Name: 
// Module Name: fixed_point_mul
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


module 
 fixed_point_mul #(parameter
	DATA_WIDTH = 32,
	INTEGER = 15, 
	FRACTION = 16 )
    (
     input signed [DATA_WIDTH-1:0] in1,
     input signed [DATA_WIDTH-1:0] in2,
     output [DATA_WIDTH-1:0] out
    );
    
	wire signed [2*DATA_WIDTH-1:0] out_signal;
	 
    assign out_signal = in1 * in2;
    //assign out =  {out_signal[(2*FRACTION)+INTEGER-1:2*FRACTION],out_signal[(2*FRACTION)-1:FRACTION]};
    assign out = out_signal[(2*FRACTION)+INTEGER-1:FRACTION];

   
endmodule