module registerfile(
    input clk,
    input logic [3:0]rdaddr,
    input logic [3:0]rs1_addr,
    input logic [3:0]rs2_addr,
    input logic rd_en,
    input logic [15:0]rd_wdata,
    output logic [15:0]rs1_rdata,
    output logic [15:0]rs2_rdata

);

    logic [15:0] registerfile [0:15] ;

    always @(posedge clk) begin
        if (rd_en) begin
            registerfile[rdaddr] <= rd_wdata;
        end
    end

    assign rs1_rdata = rs1_addr == 4'b0 ? 15'b0 : registerfile[rs1_addr];
    assign rs2_rdata = rs2_addr == 4'b0 ? 15'b0 : registerfile[rs2_addr];


endmodule
