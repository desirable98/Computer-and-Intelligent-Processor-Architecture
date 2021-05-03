module decoder(
    input  logic [15:0]inst,
    output logic [3:0]rd_addr,
    output logic [3:0]rs1_addr,
    output logic [3:0]rs2_addr,
    output logic funct,
    output logic [2:0]opcode,
    output logic [8:0]immM,
    output logic rd_en,
    output logic mac_en,
    output logic mem_en
    );

    // logic [2:0] opcode;
    // logic [3:0] rd;
    // logic [3:0] rs1;
    // logic [3:0] rs2;
    // logic [8:0] immM;
    logic [4:0] immL;

    assign opcode   = inst[2:0];
    assign rd_addr  = inst[6:3];
    assign rs1_addr = inst[10:7];
    assign rs2_addr = inst[14:11];
    assign funct    = inst[15];
    assign immM     = inst[15:7];
    assign immL     = inst[14:11];

    always_comb begin 
        case(opcode)
            0:begin
                rd_en = 1'b1;
                mem_en = 1'b0;

            end
            1:begin
                rd_en = 1'b0;
                mem_en = 1'b1;
            end
            2:begin
                rd_en = 1'b1;
                mem_en =1'b0;
            end
            3:begin
                rd_en = 1'b1;
                mac_en = 1'b1;
                mem_en = 1'b0;
            end
            default begin
                rd_en = 1'b0;
                mem_en = 1'b0;
                mac_en = 1'b0;
            end
        endcase
    end



endmodule
