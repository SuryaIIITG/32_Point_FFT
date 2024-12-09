`timescale 1ns / 1ps

module MAC_tb;

    // Parameters
    parameter DATA_WIDTH = 8;
    parameter INTEGER = 4;
    parameter FRACTION = 4;

    // Inputs
    reg [DATA_WIDTH-1:0] in1_real;
    reg [DATA_WIDTH-1:0] in1_imag;
    reg [DATA_WIDTH-1:0] in2_real;
    reg [DATA_WIDTH-1:0] in2_imag;
    reg [DATA_WIDTH-1:0] constant_real;
    reg [DATA_WIDTH-1:0] constant_imag;
    reg [2:0] sel;
    reg clk;
    reg reset;

    // Outputs
    wire [DATA_WIDTH-1:0] out1_real;
    wire [DATA_WIDTH-1:0] out1_imag;
    wire [DATA_WIDTH-1:0] out2_real;
    wire [DATA_WIDTH-1:0] out2_imag;

    // Instantiate the MAC module
    MAC #(
        .DATA_WIDTH(DATA_WIDTH),
        .INTEGER(INTEGER),
        .FRACTION(FRACTION)
    ) DUT (
        .in1_real(in1_real),
        .in1_imag(in1_imag),
        .in2_real(in2_real),
        .in2_imag(in2_imag),
        .constant_real(constant_real),
        .constant_imag(constant_imag),
        .sel(sel),
        .clk(clk),
        .reset(reset),
        .out1_real(out1_real),
        .out1_imag(out1_imag),
        .out2_real(out2_real),
        .out2_imag(out2_imag)
    );

    // Clock generation
    always begin
        clk = 0;
        #5;
        clk = 1;
        #5;
    end

    // Initialize inputs
    initial begin
        // Reset the system
        reset = 1;
        #10;
        reset = 0;

        // Apply test inputs
        in1_real = 8'b00010000;  // Example input
        in1_imag = 8'b00001111;  // Example input
        in2_real = 8'b00000001;  // Example input
        in2_imag = 8'b00000010;  // Example input
        constant_real = 8'b00000011;  // Example input
        constant_imag = 8'b00000100;  // Example input
        sel = 3'b000; // Initial sel state

        // Test Case 1: Test for sel = 000
        #10;
        $display("Test Case 1: sel = 000");
        $display("in1_real = %h, in1_imag = %h, in2_real = %h, in2_imag = %h", in1_real, in1_imag, in2_real, in2_imag);
        $display("constant_real = %h, constant_imag = %h, sel = %b", constant_real, constant_imag, sel);
        $display("out1_real = %h, out1_imag = %h, out2_real = %h, out2_imag = %h", out1_real, out1_imag, out2_real, out2_imag);

        // Test Case 2: Change sel to 001
        sel = 3'b001;
        #10;
        $display("Test Case 2: sel = 001");
        $display("in1_real = %h, in1_imag = %h, in2_real = %h, in2_imag = %h", in1_real, in1_imag, in2_real, in2_imag);
        $display("constant_real = %h, constant_imag = %h, sel = %b", constant_real, constant_imag, sel);
        $display("out1_real = %h, out1_imag = %h, out2_real = %h, out2_imag = %h", out1_real, out1_imag, out2_real, out2_imag);

        // Test Case 3: Change sel to 010
        sel = 3'b010;
        #10;
        $display("Test Case 3: sel = 010");
        $display("in1_real = %h, in1_imag = %h, in2_real = %h, in2_imag = %h", in1_real, in1_imag, in2_real, in2_imag);
        $display("constant_real = %h, constant_imag = %h, sel = %b", constant_real, constant_imag, sel);
        $display("out1_real = %h, out1_imag = %h, out2_real = %h, out2_imag = %h", out1_real, out1_imag, out2_real, out2_imag);

        // Test Case 4: Change sel to 011
        sel = 3'b011;
        #10;
        $display("Test Case 4: sel = 011");
        $display("in1_real = %h, in1_imag = %h, in2_real = %h, in2_imag = %h", in1_real, in1_imag, in2_real, in2_imag);
        $display("constant_real = %h, constant_imag = %h, sel = %b", constant_real, constant_imag, sel);
        $display("out1_real = %h, out1_imag = %h, out2_real = %h, out2_imag = %h", out1_real, out1_imag, out2_real, out2_imag);

        // Test Case 5: Change sel to 100
        sel = 3'b100;
        #10;
        $display("Test Case 5: sel = 100");
        $display("in1_real = %h, in1_imag = %h, in2_real = %h, in2_imag = %h", in1_real, in1_imag, in2_real, in2_imag);
        $display("constant_real = %h, constant_imag = %h, sel = %b", constant_real, constant_imag, sel);
        $display("out1_real = %h, out1_imag = %h, out2_real = %h, out2_imag = %h", out1_real, out1_imag, out2_real, out2_imag);

        // Test Case 6: Change sel to 101
        sel = 3'b101;
        #10;
        $display("Test Case 6: sel = 101");
        $display("in1_real = %h, in1_imag = %h, in2_real = %h, in2_imag = %h", in1_real, in1_imag, in2_real, in2_imag);
        $display("constant_real = %h, constant_imag = %h, sel = %b", constant_real, constant_imag, sel);
        $display("out1_real = %h, out1_imag = %h, out2_real = %h, out2_imag = %h", out1_real, out1_imag, out2_real, out2_imag);

        // Test Case 7: Test reset functionality
        reset = 1;
        #10;
        $display("Test Case 7: Reset applied");
        $display("out1_real = %h, out1_imag = %h, out2_real = %h, out2_imag = %h", out1_real, out1_imag, out2_real, out2_imag);

        // Test Case 8: Reset released and change sel to 110
        reset = 0;
        sel = 3'b110;
        #10;
        $display("Test Case 8: Reset released, sel = 110");
        $display("in1_real = %h, in1_imag = %h, in2_real = %h, in2_imag = %h", in1_real, in1_imag, in2_real, in2_imag);
        $display("constant_real = %h, constant_imag = %h, sel = %b", constant_real, constant_imag, sel);
        $display("out1_real = %h, out1_imag = %h, out2_real = %h, out2_imag = %h", out1_real, out1_imag, out2_real, out2_imag);

        // End of simulation
        $finish;
    end

endmodule
