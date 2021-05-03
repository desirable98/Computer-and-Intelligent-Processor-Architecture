module top_tb();
    logic clk, rst;
    logic imem_en;
    logic [15:0] inst;
    initial begin
        clk = 1'b0;
        forever #1ns clk = ~ clk;
    end
    initial begin
        rst = 1'b1;
        imem_en = 0;
        inst = 0;
        #4ns rst = 1'b0;
        #2ns rst = 1'b1;
    end

    top top(
        .*
    );

    initial begin
        top.imem.imem[0] = {5'b00000,    4'b0000,    4'b0001,   3'b000};
        top.imem.imem[1] = {5'b00001,    4'b0000,    4'b0010,   3'b000};
        top.imem.imem[2] = {5'b00010,    4'b0000,    4'b0011,   3'b000};
        top.imem.imem[3] = {5'b00011,    4'b0000,    4'b0100,   3'b000};
        top.imem.imem[4] = {5'b00100,    4'b0000,    4'b0101,   3'b000};
        top.imem.imem[5] = {5'b00101,    4'b0000,    4'b0110,   3'b000};
        top.imem.imem[6] = {5'b00110,    4'b0000,    4'b0111,   3'b000};
        top.imem.imem[7] = {5'b00111,    4'b0000,    4'b1000,   3'b000};
        top.imem.imem[8] = {1'b1,   4'b0000,     4'b0000,    4'b1010,   3'b011};
        top.imem.imem[9] = {1'b0,   4'b0101,     4'b0001,    4'b1010,   3'b011};
        top.imem.imem[10] = {1'b0,   4'b0110,     4'b0010,    4'b1010,   3'b011};
        top.imem.imem[11] = {1'b0,   4'b0111,     4'b0011,    4'b1010,   3'b011};
        top.imem.imem[12] = {1'b0,   4'b1000,     4'b0100,    4'b1010,   3'b011};
        top.imem.imem[13] = {1'b0,   4'b1010,     4'b1100,    4'b0000,   3'b001};
        
        top.imem.imem[14] = {5'b01000,    4'b0000,    4'b0101,   3'b000};
        top.imem.imem[15] = {5'b01001,    4'b0000,    4'b0110,   3'b000};
        top.imem.imem[16] = {5'b01010,    4'b0000,    4'b0111,   3'b000};
        top.imem.imem[17] = {5'b01011,    4'b0000,    4'b1000,   3'b000};
        top.imem.imem[18] = {1'b1,   4'b0000,     4'b0000,    4'b1010,   3'b011};
        top.imem.imem[19] = {1'b0,   4'b0101,     4'b0001,    4'b1010,   3'b011};
        top.imem.imem[20] = {1'b0,   4'b0110,     4'b0010,    4'b1010,   3'b011};
        top.imem.imem[21] = {1'b0,   4'b0111,     4'b0011,    4'b1010,   3'b011};
        top.imem.imem[22] = {1'b0,   4'b1000,     4'b0100,    4'b1010,   3'b011};
        top.imem.imem[23] = {1'b0,   4'b1010,     4'b1101,    4'b0000,   3'b001};
        
        top.imem.imem[24] = {5'b01100,    4'b0000,    4'b0101,   3'b000};
        top.imem.imem[25] = {5'b01101,    4'b0000,    4'b0110,   3'b000};
        top.imem.imem[26] = {5'b01110,    4'b0000,    4'b0111,   3'b000};
        top.imem.imem[27] = {5'b01111,    4'b0000,    4'b1000,   3'b000};
        top.imem.imem[28] = {1'b1,   4'b0000,     4'b0000,    4'b1010,   3'b011};
        top.imem.imem[29] = {1'b0,   4'b0101,     4'b0001,    4'b1010,   3'b011};
        top.imem.imem[30] = {1'b0,   4'b0110,     4'b0010,    4'b1010,   3'b011};
        top.imem.imem[31] = {1'b0,   4'b0111,     4'b0011,    4'b1010,   3'b011};
        top.imem.imem[32] = {1'b0,   4'b1000,     4'b0100,    4'b1010,   3'b011};
        top.imem.imem[33] = {1'b0,   4'b1010,     4'b1110,    4'b0000,   3'b001};
        
        top.imem.imem[34] = {5'b10000,    4'b0000,    4'b0101,   3'b000};
        top.imem.imem[35] = {5'b10001,    4'b0000,    4'b0110,   3'b000};
        top.imem.imem[36] = {5'b10010,    4'b0000,    4'b0111,   3'b000};
        top.imem.imem[37] = {5'b10011,    4'b0000,    4'b1000,   3'b000};
        top.imem.imem[38] = {1'b1,   4'b0000,     4'b0000,    4'b1010,   3'b011};
        top.imem.imem[39] = {1'b0,   4'b0101,     4'b0001,    4'b1010,   3'b011};
        top.imem.imem[40] = {1'b0,   4'b0110,     4'b0010,    4'b1010,   3'b011};
        top.imem.imem[41] = {1'b0,   4'b0111,     4'b0011,    4'b1010,   3'b011};
        top.imem.imem[42] = {1'b0,   4'b1000,     4'b0100,    4'b1010,   3'b011};
        top.imem.imem[43] = {1'b0,   4'b1010,     4'b1111,    4'b0000,   3'b001};
        
    end
    initial begin
        top.dmem.dmem[0] = -1;
        top.dmem.dmem[1] = 16'd2;
        top.dmem.dmem[2] = -3;
        top.dmem.dmem[3] = 16'd4;
        top.dmem.dmem[4] = 16'd1;
        top.dmem.dmem[5] = 16'd2;
        top.dmem.dmem[6] = 16'd3;
        top.dmem.dmem[7] = 16'd4;
        top.dmem.dmem[8] = -1;
        top.dmem.dmem[9] = 16'd2;
        top.dmem.dmem[10] = -3;
        top.dmem.dmem[11] = 16'd4;
        top.dmem.dmem[12] = 16'd0;
        top.dmem.dmem[13] = 16'd3;
        top.dmem.dmem[14] = 16'd1;
        top.dmem.dmem[15] = 16'd2;
        top.dmem.dmem[16] = 16'd2;
        top.dmem.dmem[17] = 16'd1;
        top.dmem.dmem[18] = 16'd4;
        top.dmem.dmem[19] = 16'd5;

    end

    initial begin
        top.rf.registerfile[12] = 16'd28;
        top.rf.registerfile[13] = 16'd29;
        top.rf.registerfile[14] = 16'd30;
        top.rf.registerfile[15] = 16'd31;
    end
  
endmodule
