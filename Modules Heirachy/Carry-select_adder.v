module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire[15:0] n1,n2;
    wire carry;
    add16 inst1(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(carry));
    add16 inst2(.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(n1), .cout());
    add16 inst3(.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(n2), .cout());
    always @(*) begin
        case(carry)
            1'b0 : sum[31:16] = n1;
            1'b1 : sum[31:16] = n2;
        endcase
    end
endmodule
