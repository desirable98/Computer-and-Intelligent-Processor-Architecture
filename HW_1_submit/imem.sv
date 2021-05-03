module imem(
    input logic clk,
    input logic imem_en,
    input logic [15:0]winst,

    input logic [10:0]addr,
    output logic [15:0]rinst
);

    logic [15:0] imem [0:63];

    always @(posedge clk) begin
        if(imem_en) begin
            imem[addr] <= winst;
        end
    end

    assign rinst = imem[addr];

    // assign imem[0] = 16'b;


endmodule
