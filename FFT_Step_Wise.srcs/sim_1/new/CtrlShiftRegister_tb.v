`timescale 1ns / 1ps

module CtrlShiftRegister_tb;

    // Parameters
    parameter CLK_CYCLES = 3;

    // Inputs
    reg clk;
    reg reset;
    reg start;

    // Outputs
    wire internal_enable;
    wire finish;

    // Instantiate the CtrlShiftRegister module
    CtrlShiftRegister #(
        .CLK_CYCLES(CLK_CYCLES)
    ) DUT (
        .clk(clk),
        .reset(reset),
        .start(start),
        .internal_enable(internal_enable),
        .finish(finish)
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
        // Apply reset and start signals
        reset = 1;
        start = 0;
        #10;
        reset = 0;

        // Test Case 1: Start signal asserted with reset low
        #10;
        start = 1;
        #10;
        start = 0;

        // Test Case 2: Internal enable pulse and finish signal
        #10;
        start = 1;  // Start shifting
        #10;
        start = 0;
        #10;

        // Test Case 3: Reset signal is asserted again
        reset = 1;
        #10;
        reset = 0;

        // Test Case 4: Start signal again after reset
        #10;
        start = 1;
        #10;
        start = 0;

        // Test Case 5: Check finish signal
        #10;
        start = 1; // Start shifting
        #10;
        start = 0;
        #10;

        // End of simulation
        $finish;
    end

    // Display output signals during the simulation for debugging
    initial begin
        $monitor("Time = %0t, reset = %b, start = %b, internal_enable = %b, finish = %b", $time, reset, start, internal_enable, finish);
    end

endmodule
