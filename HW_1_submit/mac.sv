module mac(
    input logic clk,
    input logic [15:0]in1,
    input logic [15:0]in2,
    input logic func,
    output logic [15:0] out

);
    logic [15:0]product;
    logic [15:0] psum;
    logic [15:0]add1;
    logic [15:0]add2;

    assign product = in1 * in2;
    assign add1 = func ? 16'b0 : product;
    assign add2 = func ? in2 : psum;
    assign out = add1 + add2;

    always @(posedge clk) begin
        if(func)
            psum <= 15'b0;
        else
            psum <= out;
    end




endmodule
