module dmem(
    input logic clk,
    input logic mem_en,
    input logic [15:0]wdata,

    input logic [4:0]addr,
    output logic [15:0]rdata
);

    logic [15:0] dmem [0:31];

    always @(posedge clk) begin
        if(mem_en) begin
            dmem[addr] <= wdata;
        end
    end

    assign rdata = dmem[addr];


endmodule
