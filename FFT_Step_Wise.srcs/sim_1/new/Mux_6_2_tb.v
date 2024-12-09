`timescale 1ns / 1ps

module Mux_6_2_tb;

    // Parameters
    parameter DATA_WIDTH = 32;
    parameter INTEGER = 16;
    parameter FRACTION = 16;

    // Inputs
    reg [DATA_WIDTH-1:0] in2_real;
    reg [DATA_WIDTH-1:0] in2_imag;
    reg [DATA_WIDTH-1:0] constant_real;
    reg [DATA_WIDTH-1:0] constant_imag;
    reg [1:0] sel;

    // Outputs
    wire [DATA_WIDTH-1:0] out_1;
    wire [DATA_WIDTH-1:0] out_2;

    // Instantiate the Mux_6_2 module
    Mux_6_2 #(
        .DATA_WIDTH(DATA_WIDTH),
        .INTEGER(INTEGER),
        .FRACTION(FRACTION)
    ) DUT (
        .in2_real(in2_real),
        .in2_imag(in2_imag),
        .constant_real(constant_real),
        .constant_imag(constant_imag),
        .sel(sel),
        .out_1(out_1),
        .out_2(out_2)
    );

    // Initial block to generate input stimuli
    initial begin
        // Initialize inputs
        in2_real = 32'h00000001;     // Example value for in2_real
        in2_imag = 32'h00000002;     // Example value for in2_imag
        constant_real = 32'h00000010; // Example value for constant_real
        constant_imag = 32'h00000020; // Example value for constant_imag
        sel = 2'b00;                 // Start with sel = 00

        // Apply reset and wait
        #10;

        // Test Case 1: sel = 00, out_1 = constant_real, out_2 = in2_real
        $display("Test Case 1: sel = 00");
        #10;
        $display("in2_real = %h, in2_imag = %h, constant_real = %h, constant_imag = %h, sel = %b", 
                 in2_real, in2_imag, constant_real, constant_imag, sel);
        $display("out_1 = %h, out_2 = %h", out_1, out_2);

        // Test Case 2: sel = 01, out_1 = constant_imag, out_2 = in2_imag
        sel = 2'b01;
        #10;
        $display("Test Case 2: sel = 01");
        $display("in2_real = %h, in2_imag = %h, constant_real = %h, constant_imag = %h, sel = %b", 
                 in2_real, in2_imag, constant_real, constant_imag, sel);
        $display("out_1 = %h, out_2 = %h", out_1, out_2);

        // Test Case 3: sel = 10, out_1 = constant_imag, out_2 = in2_real
        sel = 2'b10;
        #10;
        $display("Test Case 3: sel = 10");
        $display("in2_real = %h, in2_imag = %h, constant_real = %h, constant_imag = %h, sel = %b", 
                 in2_real, in2_imag, constant_real, constant_imag, sel);
        $display("out_1 = %h, out_2 = %h", out_1, out_2);

        // Test Case 4: sel = 11, out_1 = constant_real, out_2 = in2_imag
        sel = 2'b11;
        #10;
        $display("Test Case 4: sel = 11");
        $display("in2_real = %h, in2_imag = %h, constant_real = %h, constant_imag = %h, sel = %b", 
                 in2_real, in2_imag, constant_real, constant_imag, sel);
        $display("out_1 = %h, out_2 = %h", out_1, out_2);

        // Test Case 5: Test with new values for in2_real, in2_imag, constant_real, constant_imag
        in2_real = 32'h00000005;
        in2_imag = 32'h00000006;
        constant_real = 32'h00000050;
        constant_imag = 32'h00000060;
        sel = 2'b00;  // Again start with sel = 00
        #10;
        $display("Test Case 5: New values for inputs, sel = 00");
        $display("in2_real = %h, in2_imag = %h, constant_real = %h, constant_imag = %h, sel = %b", 
                 in2_real, in2_imag, constant_real, constant_imag, sel);
        $display("out_1 = %h, out_2 = %h", out_1, out_2);

        // Finish simulation
        $finish;
    end

endmodule
