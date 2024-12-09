`timescale 1ns / 1ps

module FFT_Stage2_tb();

    parameter DATA_WIDTH = 32;
    parameter INTEGER = 15;
    parameter FRACTION = 16;
    parameter NUM_INPUTS = 32;

    // Testbench Signals
    reg clk;
    reg reset;
    reg stage2_start;

    wire stage2_Finish;

    // Input arrays
    reg [DATA_WIDTH-1:0] Stage1_out_real [NUM_INPUTS-1:0];
    reg [DATA_WIDTH-1:0] Stage1_out_imag [NUM_INPUTS-1:0];

    // Output arrays
    wire [DATA_WIDTH-1:0] Stage2_out_real [NUM_INPUTS-1:0];
    wire [DATA_WIDTH-1:0] Stage2_out_imag [NUM_INPUTS-1:0];

    // Constants
    reg [DATA_WIDTH-1:0] Constant_W0_real;
    reg [DATA_WIDTH-1:0] Constant_W0_imag;
    reg [DATA_WIDTH-1:0] Constant_W8_real;
    reg [DATA_WIDTH-1:0] Constant_W8_imag;

    integer i;

    // Clock Generation
    always #5 clk = ~clk;

    // Device Under Test (DUT)
    FFT_Stage2 #(
        .DATA_WIDTH(DATA_WIDTH),
        .INTEGER(INTEGER),
        .FRACTION(FRACTION)
    ) FFT_Stage2_inst (
        .clk(clk),
        .reset(reset),
        .stage2_start(stage2_start),
        .stage2_Finish(stage2_Finish),

        // Map inputs and outputs dynamically using generate statements
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
        .Stage1_out31_imag(Stage1_out_imag[31]),
        // (Add all other connections up to NUM_INPUTS)

        .Constant_W0_real(Constant_W0_real),
        .Constant_W0_imag(Constant_W0_imag),
        .Constant_W8_real(Constant_W8_real),
        .Constant_W8_imag(Constant_W8_imag),

        .Stage2_out0_real(Stage2_out_real[0]),
        .Stage2_out0_imag(Stage2_out_imag[0]),
        .Stage2_out1_real(Stage2_out_real[1]),
        .Stage2_out1_imag(Stage2_out_imag[1]),
        .Stage2_out2_real(Stage2_out_real[2]),
        .Stage2_out2_imag(Stage2_out_imag[2]),
        .Stage2_out3_real(Stage2_out_real[3]),
        .Stage2_out3_imag(Stage2_out_imag[3]),
        .Stage2_out4_real(Stage2_out_real[4]),
        .Stage2_out4_imag(Stage2_out_imag[4]),
        .Stage2_out5_real(Stage2_out_real[5]),
        .Stage2_out5_imag(Stage2_out_imag[5]),
        .Stage2_out6_real(Stage2_out_real[6]),
        .Stage2_out6_imag(Stage2_out_imag[6]),
        .Stage2_out7_real(Stage2_out_real[7]),
        .Stage2_out7_imag(Stage2_out_imag[7]),
        .Stage2_out8_real(Stage2_out_real[8]),
        .Stage2_out8_imag(Stage2_out_imag[8]),
        .Stage2_out9_real(Stage2_out_real[9]),
        .Stage2_out9_imag(Stage2_out_imag[9]),
        .Stage2_out10_real(Stage2_out_real[10]),
        .Stage2_out10_imag(Stage2_out_imag[10]),
        .Stage2_out11_real(Stage2_out_real[11]),
        .Stage2_out11_imag(Stage2_out_imag[11]),
        .Stage2_out12_real(Stage2_out_real[12]),
        .Stage2_out12_imag(Stage2_out_imag[12]),
        .Stage2_out13_real(Stage2_out_real[13]),
        .Stage2_out13_imag(Stage2_out_imag[13]),
        .Stage2_out14_real(Stage2_out_real[14]),
        .Stage2_out14_imag(Stage2_out_imag[14]),
        .Stage2_out15_real(Stage2_out_real[15]),
        .Stage2_out15_imag(Stage2_out_imag[15]),
        .Stage2_out16_real(Stage2_out_real[16]),
        .Stage2_out16_imag(Stage2_out_imag[16]),
        .Stage2_out17_real(Stage2_out_real[17]),
        .Stage2_out17_imag(Stage2_out_imag[17]),
        .Stage2_out18_real(Stage2_out_real[18]),
        .Stage2_out18_imag(Stage2_out_imag[18]),
        .Stage2_out19_real(Stage2_out_real[19]),
        .Stage2_out19_imag(Stage2_out_imag[19]),
        .Stage2_out20_real(Stage2_out_real[20]),
        .Stage2_out20_imag(Stage2_out_imag[20]),
        .Stage2_out21_real(Stage2_out_real[21]),
        .Stage2_out21_imag(Stage2_out_imag[21]),
        .Stage2_out22_real(Stage2_out_real[22]),
        .Stage2_out22_imag(Stage2_out_imag[22]),
        .Stage2_out23_real(Stage2_out_real[23]),
        .Stage2_out23_imag(Stage2_out_imag[23]),
        .Stage2_out24_real(Stage2_out_real[24]),
        .Stage2_out24_imag(Stage2_out_imag[24]),
        .Stage2_out25_real(Stage2_out_real[25]),
        .Stage2_out25_imag(Stage2_out_imag[25]),
        .Stage2_out26_real(Stage2_out_real[26]),
        .Stage2_out26_imag(Stage2_out_imag[26]),
        .Stage2_out27_real(Stage2_out_real[27]),
        .Stage2_out27_imag(Stage2_out_imag[27]),
        .Stage2_out28_real(Stage2_out_real[28]),
        .Stage2_out28_imag(Stage2_out_imag[28]),
        .Stage2_out29_real(Stage2_out_real[29]),
        .Stage2_out29_imag(Stage2_out_imag[29]),
        .Stage2_out30_real(Stage2_out_real[30]),
        .Stage2_out30_imag(Stage2_out_imag[30]),
        .Stage2_out31_real(Stage2_out_real[31]),
        .Stage2_out31_imag(Stage2_out_imag[31])
        // (Add all other connections up to NUM_INPUTS)
    );

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        stage2_start = 0;

        // Reset stage
        #10 reset = 0;

        // Assign values to constants
        Constant_W0_real = 32'h00010000; // Example fixed-point value
        Constant_W0_imag = 32'h00008000;
        Constant_W8_real = 32'hFFFF8000;
        Constant_W8_imag = 32'h00004000;
        // Assign random values to the input arrays
        Stage1_out_real[0] = 32'h00100000; Stage1_out_imag[0] = 32'h00000000; // 16.0000 + 0.0000i
        Stage1_out_real[1] = 32'hFFF00000; Stage1_out_imag[1] = 32'h00000000; // -16.0000 + 0.0000i
        Stage1_out_real[2] = 32'h00200000; Stage1_out_imag[2] = 32'h00000000; // 32.0000 + 0.0000i
        Stage1_out_real[3] = 32'hFFF00000; Stage1_out_imag[3] = 32'h00000000; // -16.0000 + 0.0000i
        Stage1_out_real[4] = 32'h00180000; Stage1_out_imag[4] = 32'h00000000; // 24.0000 + 0.0000i
        Stage1_out_real[5] = 32'hFFF00000; Stage1_out_imag[5] = 32'h00000000; // -16.0000 + 0.0000i
        Stage1_out_real[6] = 32'h00280000; Stage1_out_imag[6] = 32'h00000000; // 40.0000 + 0.0000i
        Stage1_out_real[7] = 32'hFFF00000; Stage1_out_imag[7] = 32'h00000000; // -16.0000 + 0.0000i
        Stage1_out_real[8] = 32'h00140000; Stage1_out_imag[8] = 32'h00000000; // 20.0000 + 0.0000i
        Stage1_out_real[9] = 32'hFFF00000; Stage1_out_imag[9] = 32'h00000000; // -16.0000 + 0.0000i
        Stage1_out_real[10] = 32'h00240000; Stage1_out_imag[10] = 32'h00000000; // 36.0000 + 0.0000i
        Stage1_out_real[11] = 32'hFFF00000; Stage1_out_imag[11] = 32'h00000000; // -16.0000 + 0.0000i
        Stage1_out_real[12] = 32'h001C0000; Stage1_out_imag[12] = 32'h00000000; // 28.0000 + 0.0000i
        Stage1_out_real[13] = 32'hFFF00000; Stage1_out_imag[13] = 32'h00000000; // -16.0000 + 0.0000i
        Stage1_out_real[14] = 32'h002C0000; Stage1_out_imag[14] = 32'h00000000; // 44.0000 + 0.0000i
        Stage1_out_real[15] = 32'hFFF00000; Stage1_out_imag[15] = 32'h00000000; // -16.0000 + 0.0000i
        Stage1_out_real[16] = 32'h00120000; Stage1_out_imag[16] = 32'h00000000; // 18.0000 + 0.0000i
        Stage1_out_real[17] = 32'hFFF00000; Stage1_out_imag[17] = 32'h00000000; // -16.0000 + 0.0000i
        Stage1_out_real[18] = 32'h00220000; Stage1_out_imag[18] = 32'h00000000; // 34.0000 + 0.0000i
        Stage1_out_real[19] = 32'hFFF00000; Stage1_out_imag[19] = 32'h00000000; // -16.0000 + 0.0000i
        Stage1_out_real[20] = 32'h001A0000; Stage1_out_imag[20] = 32'h00000000; // 26.0000 + 0.0000i
        Stage1_out_real[21] = 32'hFFF00000; Stage1_out_imag[21] = 32'h00000000; // -16.0000 + 0.0000i
        Stage1_out_real[22] = 32'h002A0000; Stage1_out_imag[22] = 32'h00000000; // 42.0000 + 0.0000i
        Stage1_out_real[23] = 32'hFFF00000; Stage1_out_imag[23] = 32'h00000000; // -16.0000 + 0.0000i
        Stage1_out_real[24] = 32'h00160000; Stage1_out_imag[24] = 32'h00000000; // 22.0000 + 0.0000i
        Stage1_out_real[25] = 32'hFFF00000; Stage1_out_imag[25] = 32'h00000000; // -16.0000 + 0.0000i
        Stage1_out_real[26] = 32'h00260000; Stage1_out_imag[26] = 32'h00000000; // 38.0000 + 0.0000i
        Stage1_out_real[27] = 32'hFFF00000; Stage1_out_imag[27] = 32'h00000000; // -16.0000 + 0.0000i
        Stage1_out_real[28] = 32'h001E0000; Stage1_out_imag[28] = 32'h00000000; // 30.0000 + 0.0000i
        Stage1_out_real[29] = 32'hFFF00000; Stage1_out_imag[29] = 32'h00000000; // -16.0000 + 0.0000i
        Stage1_out_real[30] = 32'h002E0000; Stage1_out_imag[30] = 32'h00000000; // 46.0000 + 0.0000i
        Stage1_out_real[31] = 32'hFFF00000; Stage1_out_imag[31] = 32'h00000000; // -16.0000 + 0.0000i

        #10 reset = 0;

        // Start FFT Stage 2
        #20 stage2_start = 1;
        #10 stage2_start = 0;

        // Wait for operation to complete
        wait (stage2_Finish);

        // Display results
        for (i = 0; i < 32; i = i + 1) begin
            $display("Output %0d: Real = %h, Imag = %h", i, Stage2_out_real[i], Stage2_out_imag[i]);
        end

        #20$finish;
    end

endmodule
