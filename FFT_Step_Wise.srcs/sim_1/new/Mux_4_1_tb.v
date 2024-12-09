`timescale 1ns / 1ps

module Mux_4_1_tb;

    // Parameters
    parameter DATA_WIDTH = 32;

    // Inputs
    reg [DATA_WIDTH-1:0] in1_real;
    reg [DATA_WIDTH-1:0] in1_imag;
    reg [DATA_WIDTH-1:0] reg_out_real;
    reg [DATA_WIDTH-1:0] reg_out_imag;
    reg [1:0] sel;

    // Output
    wire [DATA_WIDTH-1:0] Mux_out;

    // Instantiate the Mux_4_1 module
    Mux_4_1 #(
        .DATA_WIDTH(DATA_WIDTH)
    ) DUT (
        .in1_real(in1_real),
        .in1_imag(in1_imag),
        .reg_out_real(reg_out_real),
        .reg_out_imag(reg_out_imag),
        .sel(sel),
        .Mux_out(Mux_out)
    );

    // Initial block to generate input stimuli
    initial begin
        // Initialize inputs
        in1_real = 32'h00010000; // Example value: 1.0 in fixed-point format (16.16)
        in1_imag = 32'h00020000; // Example value: 2.0 in fixed-point format (16.16)
        reg_out_real = 32'h00030000; // Example value: 3.0 in fixed-point format (16.16)
        reg_out_imag = 32'h00040000; // Example value: 4.0 in fixed-point format (16.16)
        sel = 2'b00; // Start with selecting in1_real

        // Apply reset and wait
        #10;

        // Test Case 1: Apply all possible values of sel
        $display("Testing all possible values of sel...");

        // Test Case 1a: sel = 2'b00 -> Mux_out = in1_real
        #10 sel = 2'b00; // Select in1_real
        #10 $display("sel = %b, Mux_out = %h", sel, Mux_out); // Observe Mux_out

        // Test Case 1b: sel = 2'b01 -> Mux_out = reg_out_real
        #10 sel = 2'b01; // Select reg_out_real
        #10 $display("sel = %b, Mux_out = %h", sel, Mux_out); // Observe Mux_out

        // Test Case 1c: sel = 2'b10 -> Mux_out = in1_imag
        #10 sel = 2'b10; // Select in1_imag
        #10 $display("sel = %b, Mux_out = %h", sel, Mux_out); // Observe Mux_out

        // Test Case 1d: sel = 2'b11 -> Mux_out = reg_out_imag
        #10 sel = 2'b11; // Select reg_out_imag
        #10 $display("sel = %b, Mux_out = %h", sel, Mux_out); // Observe Mux_out

        // Test Case 2: Test with different values for input signals
        $display("Testing with different input values...");
        in1_real = 32'h00100000; // 4.0 in fixed-point format (16.16)
        in1_imag = 32'h00200000; // 8.0 in fixed-point format (16.16)
        reg_out_real = 32'h00300000; // 12.0 in fixed-point format (16.16)
        reg_out_imag = 32'h00400000; // 16.0 in fixed-point format (16.16)

        #10 sel = 2'b00; // Select in1_real
        #10 $display("sel = %b, Mux_out = %h", sel, Mux_out);

        #10 sel = 2'b01; // Select reg_out_real
        #10 $display("sel = %b, Mux_out = %h", sel, Mux_out);

        #10 sel = 2'b10; // Select in1_imag
        #10 $display("sel = %b, Mux_out = %h", sel, Mux_out);

        #10 sel = 2'b11; // Select reg_out_imag
        #10 $display("sel = %b, Mux_out = %h", sel, Mux_out);

        // Finish simulation
        $finish;
    end

endmodule
