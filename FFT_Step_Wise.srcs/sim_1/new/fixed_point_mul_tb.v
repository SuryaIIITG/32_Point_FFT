`timescale 1ns / 1ps

module fixed_point_mul_tb;

    // Parameters
    parameter DATA_WIDTH = 32;
    parameter INTEGER = 15;
    parameter FRACTION = 16;

    // Inputs
    reg signed [DATA_WIDTH-1:0] in1;
    reg signed [DATA_WIDTH-1:0] in2;

    // Output
    wire [DATA_WIDTH-1:0] out;

    // Instantiate the fixed_point_mul module
    fixed_point_mul #(
        .DATA_WIDTH(DATA_WIDTH),
        .INTEGER(INTEGER),
        .FRACTION(FRACTION)
    ) DUT (
        .in1(in1),
        .in2(in2),
        .out(out)
    );

    // Initial block to generate input stimuli
    initial begin
        // Initialize inputs
        in1 = 32'h00010000; // 1.0 in fixed-point format (23.8)
        in2 = 32'h00020000; // 2.0 in fixed-point format (23.8)

        // Apply reset and wait
        #10;

        // Test Case 1: Multiply 1.0 * 2.0 (Expected output = 2.0)
        $display("Test Case 1: Multiply 1.0 * 2.0");
        #10;
        $display("in1 = %h, in2 = %h, out = %h", in1, in2, out);

        // Test Case 2: Multiply -1.0 * 2.0 (Expected output = -2.0)
        in1 = 32'hFF800000; // -1.0 in fixed-point format (23.8)
        in2 = 32'h00020000; // 2.0 in fixed-point format (23.8)
        #10;
        $display("Test Case 2: Multiply -1.0 * 2.0");
        $display("in1 = %h, in2 = %h, out = %h", in1, in2, out);

        // Test Case 3: Multiply 1.0 * -2.0 (Expected output = -2.0)
        in1 = 32'h00010000; // 1.0 in fixed-point format (23.8)
        in2 = 32'hFF800000; // -2.0 in fixed-point format (23.8)
        #10;
        $display("Test Case 3: Multiply 1.0 * -2.0");
        $display("in1 = %h, in2 = %h, out = %h", in1, in2, out);

        // Test Case 4: Multiply -1.0 * -2.0 (Expected output = 2.0)
        in1 = 32'hFF800000; // -1.0 in fixed-point format (23.8)
        in2 = 32'hFF800000; // -2.0 in fixed-point format (23.8)
        #10;
        $display("Test Case 4: Multiply -1.0 * -2.0");
        $display("in1 = %h, in2 = %h, out = %h", in1, in2, out);

        // Test Case 5: Multiply a small number with a large number (Expected output = a small value)
        in1 = 32'h00000001; // 0.00000001 in fixed-point format (23.8)
        in2 = 32'h00800000; // 128 in fixed-point format (23.8)
        #10;
        $display("Test Case 5: Multiply 0.00000001 * 128");
        $display("in1 = %h, in2 = %h, out = %h", in1, in2, out);

        // Test Case 6: Multiply a large number with itself (Expected output = large value)
        in1 = 32'h007FFFFF; // Maximum positive value for 23 integer bits and 8 fraction bits
        in2 = 32'h007FFFFF; // Same value for second operand
        #10;
        $display("Test Case 6: Multiply large numbers");
        $display("in1 = %h, in2 = %h, out = %h", in1, in2, out);

        // Test Case 7: Multiply by zero (Expected output = 0)
        in1 = 32'h00000000; // 0 in fixed-point format
        in2 = 32'h00020000; // 2.0 in fixed-point format
        #10;
        $display("Test Case 7: Multiply by zero");
        $display("in1 = %h, in2 = %h, out = %h", in1, in2, out);

        // Finish simulation
        $finish;
    end

endmodule
