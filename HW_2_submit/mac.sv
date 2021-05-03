module mac(
    input logic clk,
    input logic [31:0]in1,
    input logic [31:0]in2,
    input logic [3:0]func,
    output logic [31:0] out

);
    logic [19:0]product;
    logic [19:0]add1;
    logic [19:0]add2;
    logic [19:0]psum;
    logic [3:0][19:0]scrachpad;

    assign product = $signed(in1[7:0]) * $signed(in2[7:0]) + $signed(in1[15:8]) * $signed(in2[15:8]) + $signed(in1[23:16]) * $signed(in2[23:16]) + $signed(in1[31:24]) * $signed(in2[31:24]);

    // always_comb begin
    //     case(func[1:0])
    //         2'b00: begin
    //             add1 = scrachpad[0];
    //         end
    //         2'b01: begin
    //             add1 = scrachpad[1];
    //         end
    //         2'b10: begin
    //             add1 = scrachpad[2];
    //         end
    //         2'b11: begin
    //             add1 = scrachpad[3];
    //         end
    //     endcase
    // end
    // assign add2 =  func[3] ? in1 : add1 + product;
    // assign out = func[2] ? {scrachpad[3][7:0],scrachpad[2][7:0],scrachpad[1][7:0],scrachpad[0][7:0]} : 32'b0;

    always @(posedge clk) begin


        scrachpad[0] <= func[3] ? in1[7:0] : (func[1:0]==2'b00) ? scrachpad[0] + product: scrachpad[0];
        scrachpad[1] <= func[3] ? in1[15:8] : (func[1:0]==2'b01) ? scrachpad[1] + product: scrachpad[1];
        scrachpad[2] <= func[3] ? in1[23:16] : (func[1:0]==2'b10) ? scrachpad[2] + product: scrachpad[2];
        scrachpad[3] <= func[3] ? in1[31:24] : (func[1:0]==2'b11) ? scrachpad[3] + product: scrachpad[3];
        out = func[2] ? {scrachpad[3][7:0],scrachpad[2][7:0],scrachpad[1][7:0],scrachpad[0][7:0]} : 32'b0;
        // case(func[1:0])
        //     00: scrachpad[0] <= add2;
        //     01: scrachpad[1] <= add2;
        //     10: scrachpad[2] <= add2;
        //     11: scrachpad[3] <= add2;
        // endcase
    end




endmodule
