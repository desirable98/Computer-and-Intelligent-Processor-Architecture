module top(
    input logic clk,
    input logic rst,
    input logic imem_en,
    input logic [15:0]inst

);

    logic [15:0] instcurrent;
    logic [3:0]  rdaddr;
    logic [3:0]  rs1_addr;
    logic [3:0]  rs2_addr;
    logic        func;
    logic [2:0]  opcode;
    logic [8:0]  immM;
    logic        rd_en;
    logic        mac_en;
    logic        mem_en;
    logic [15:0] rd_wdata;
    logic [15:0] rs1_rdata;
    logic [15:0] rs2_rdata;
    logic [15:0] dmem_rdata;

    logic [4:0]  dmem_addr;
    logic [4:0]  dmem_addr1;
    // logic [4:0]  dmem_addr2;
    logic [15:0] mac_result;
    
    logic [10:0] PC;


//dmem
    assign dmem_addr1 = rs1_rdata + immM[8:4];
    assign dmem_addr = opcode == 3'b000 ? dmem_addr1 : rs1_rdata;

// 取指令

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            PC <= 10'b0;
        end
        else if(PC == 10'd44) begin
            PC <= 10'b0; 
        end
        else begin
            PC <= PC + 1;
        end
    end

// rd_wdata
    assign rd_wdata = opcode==3'b000 ? dmem_rdata : (opcode==3'b010 ? immM : (opcode==3'b011 ? mac_result : 15'b0));

    imem imem(
        .clk(clk),
        .imem_en(imem_en),
        .winst(inst),
        .addr(PC),
        .rinst(instcurrent)
    );

    decoder decoder(
        .inst(instcurrent),
        .rd_addr(rdaddr),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .funct(func),
        .opcode(opcode),
        .immM(immM),
        .rd_en(rd_en),
        .mac_en(mac_en),
        .mem_en(mem_en)
    );

    registerfile rf(
        .clk(clk),
        .rdaddr(rdaddr),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .rd_en(rd_en),
        .rd_wdata(rd_wdata),
        .rs1_rdata(rs1_rdata),
        .rs2_rdata(rs2_rdata)
    );

    dmem dmem(
        .clk(clk),
        .mem_en(mem_en),
        .wdata(rs2_rdata),
        .addr(dmem_addr),
        .rdata(dmem_rdata)
    );

    mac mac(
        .*,
        .in1(rs1_rdata),
        .in2(rs2_rdata),
        .func(func),
        .out(mac_result)
    );

endmodule
