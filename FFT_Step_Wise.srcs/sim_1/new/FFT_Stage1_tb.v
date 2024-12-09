`timescale 1ns / 1ps

module FFT_Stage1_tb;

    // Parameters
    parameter DATA_WIDTH = 32;
    parameter INTEGER = 15;
    parameter FRACTION = 16;

    // Testbench signals
    reg clk;
    reg reset;
    reg stage1_start;
    wire stage1_Finish;

    reg [DATA_WIDTH-1:0] in_real[0:31];
    reg [DATA_WIDTH-1:0] Constant_W0;

    wire [DATA_WIDTH-1:0] Stage1_out_real[0:31];
    wire [DATA_WIDTH-1:0] Stage1_out_imag[0:31];

    // Instantiate the DUT
    FFT_Stage1 #(
        .DATA_WIDTH(DATA_WIDTH),
        .INTEGER(INTEGER),
        .FRACTION(FRACTION)
    ) FFT_Stage1_inst (
        .clk(clk),
        .reset(reset),
        .stage1_start(stage1_start),
        .stage1_Finish(stage1_Finish),
        .in0_real(in_real[0]),
        .in1_real(in_real[1]),
        .in2_real(in_real[2]),
        .in3_real(in_real[3]),
        .in4_real(in_real[4]),
        .in5_real(in_real[5]),
        .in6_real(in_real[6]),
        .in7_real(in_real[7]),
        .in8_real(in_real[8]),
        .in9_real(in_real[9]),
        .in10_real(in_real[10]),
        .in11_real(in_real[11]),
        .in12_real(in_real[12]),
        .in13_real(in_real[13]),
        .in14_real(in_real[14]),
        .in15_real(in_real[15]),
        .in16_real(in_real[16]),
        .in17_real(in_real[17]),
        .in18_real(in_real[18]),
        .in19_real(in_real[19]),
        .in20_real(in_real[20]),
        .in21_real(in_real[21]),
        .in22_real(in_real[22]),
        .in23_real(in_real[23]),
        .in24_real(in_real[24]),
        .in25_real(in_real[25]),
        .in26_real(in_real[26]),
        .in27_real(in_real[27]),
        .in28_real(in_real[28]),
        .in29_real(in_real[29]),
        .in30_real(in_real[30]),
        .in31_real(in_real[31]),
        .Constant_W0(Constant_W0),
        .Stage1_out0_real(Stage1_out_real[0]),
        .Stage1_out0_imag(Stage1_out_imag[0]),
        .Stage1_out1_real(Stage1_out_real[1]),
        .Stage1_out1_imag(Stage1_out_imag[1]),
        .Stage1_out2_real(Stage1_out_real[2]),
        .Stage1_out2_imag(Stage1_out_imag[2]),
        .Stage1_out3_real(Stage1_out_real[3]),
        .Stage1_out3_imag(Stage1_out_imag[3]),
        .Stage1_out4_real(Stage1_out_real[4]),
        .Stage1_out4_imag(Stage1_out_imag[4]),
        .Stage1_out5_real(Stage1_out_real[5]),
        .Stage1_out5_imag(Stage1_out_imag[5]),
        .Stage1_out6_real(Stage1_out_real[6]),
        .Stage1_out6_imag(Stage1_out_imag[6]),
        .Stage1_out7_real(Stage1_out_real[7]),
        .Stage1_out7_imag(Stage1_out_imag[7]),
        .Stage1_out8_real(Stage1_out_real[8]),
        .Stage1_out8_imag(Stage1_out_imag[8]),
        .Stage1_out9_real(Stage1_out_real[9]),
        .Stage1_out9_imag(Stage1_out_imag[9]),
        .Stage1_out10_real(Stage1_out_real[10]),
        .Stage1_out10_imag(Stage1_out_imag[10]),
        .Stage1_out11_real(Stage1_out_real[11]),
        .Stage1_out11_imag(Stage1_out_imag[11]),
        .Stage1_out12_real(Stage1_out_real[12]),
        .Stage1_out12_imag(Stage1_out_imag[12]),
        .Stage1_out13_real(Stage1_out_real[13]),
        .Stage1_out13_imag(Stage1_out_imag[13]),
        .Stage1_out14_real(Stage1_out_real[14]),
        .Stage1_out14_imag(Stage1_out_imag[14]),
        .Stage1_out15_real(Stage1_out_real[15]),
        .Stage1_out15_imag(Stage1_out_imag[15]),
        .Stage1_out16_real(Stage1_out_real[16]),
        .Stage1_out16_imag(Stage1_out_imag[16]),
        .Stage1_out17_real(Stage1_out_real[17]),
        .Stage1_out17_imag(Stage1_out_imag[17]),
        .Stage1_out18_real(Stage1_out_real[18]),
        .Stage1_out18_imag(Stage1_out_imag[18]),
        .Stage1_out19_real(Stage1_out_real[19]),
        .Stage1_out19_imag(Stage1_out_imag[19]),
        .Stage1_out20_real(Stage1_out_real[20]),
        .Stage1_out20_imag(Stage1_out_imag[20]),
        .Stage1_out21_real(Stage1_out_real[21]),
        .Stage1_out21_imag(Stage1_out_imag[21]),
        .Stage1_out22_real(Stage1_out_real[22]),
        .Stage1_out22_imag(Stage1_out_imag[22]),
        .Stage1_out23_real(Stage1_out_real[23]),
        .Stage1_out23_imag(Stage1_out_imag[23]),
        .Stage1_out24_real(Stage1_out_real[24]),
        .Stage1_out24_imag(Stage1_out_imag[24]),
        .Stage1_out25_real(Stage1_out_real[25]),
        .Stage1_out25_imag(Stage1_out_imag[25]),
        .Stage1_out26_real(Stage1_out_real[26]),
        .Stage1_out26_imag(Stage1_out_imag[26]),
        .Stage1_out27_real(Stage1_out_real[27]),
        .Stage1_out27_imag(Stage1_out_imag[27]),
        .Stage1_out28_real(Stage1_out_real[28]),
        .Stage1_out28_imag(Stage1_out_imag[28]),
        .Stage1_out29_real(Stage1_out_real[29]),
        .Stage1_out29_imag(Stage1_out_imag[29]),
        .Stage1_out30_real(Stage1_out_real[30]),
        .Stage1_out30_imag(Stage1_out_imag[30]),
        .Stage1_out31_real(Stage1_out_real[31]),
        .Stage1_out31_imag(Stage1_out_imag[31])
    );

    // Clock generation
    always #5 clk = ~clk;

    // Debugging to monitor Stage1_out_real[15]
    always @(Stage1_out_real[15]) begin
        $display("Time: %0t, Stage1_out_real[15]: %h", $time, Stage1_out_real[15]);
    end

    // Test procedure
    integer j;
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        stage1_start = 0;
        Constant_W0 = 32'h00010000;  // Example constant value

        // Initialize inputs with values from 0 to 31
        for (j = 0; j < 32; j = j + 1) begin
            in_real[j] = j;  // Set input values from 0 to 31
        end

        // Apply reset
        #10 reset = 0;

        // Start the FFT stage
        #10 stage1_start = 1;
        #20 stage1_start = 0;

        // Wait for stage1_Finish signal
        wait(stage1_Finish);

        // Display the output values
        for (j = 0; j < 32; j = j + 1) begin
            $display("Output Real[%0d]: %h, Imag[%0d]: %h", j, Stage1_out_real[j], j, Stage1_out_imag[j]);
        end

        // End simulation
        #20 $finish;
    end

endmodule
