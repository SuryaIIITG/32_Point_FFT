`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.11.2024 18:02:05
// Design Name: 
// Module Name: Mux_4_1
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
 Mux_4_1 #(parameter
	DATA_WIDTH = 32)
    (
    input [DATA_WIDTH-1:0] in1_real,
    input [DATA_WIDTH-1:0] in1_imag,
    
    input [DATA_WIDTH-1:0] reg_out_real,
    input [DATA_WIDTH-1:0] reg_out_imag,

    
	input  [1:0] sel,

    output reg [DATA_WIDTH-1:0] Mux_out
    
    
    );
   always @(*) begin
       case (sel)
            2'b00: Mux_out = in1_real;       // Select in1_real
            2'b01: Mux_out = reg_out_real;  // Select reg_out_real
            2'b10: Mux_out = in1_imag;      // Select in1_imag
            2'b11: Mux_out = reg_out_imag;  // Select reg_out_imag
            default: Mux_out = {DATA_WIDTH{1'b0}}; // Default to zero
        endcase
   end
endmodule