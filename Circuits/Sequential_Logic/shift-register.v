module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    /*MUXDFF inst1 (.clk(KEY[0]), .w(KEY[3]), .R(SW[3]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[3]));
    MUXDFF inst2 (.clk(KEY[0]), .w(KEY[3]), .R(SW[2]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[2]));
    MUXDFF inst3 (.clk(KEY[0]), .w(KEY[3]), .R(SW[1]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[1]));
    MUXDFF inst4 (.clk(KEY[0]), .w(KEY[3]), .R(SW[0]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[0]));
    */
    
    always@(posedge KEY[0]) begin
        LEDR[3]<= KEY[2]?SW[3]:(KEY[1]?KEY[3]:LEDR[3]);
        LEDR[2]<= KEY[2]?SW[2]:(KEY[1]?LEDR[3]:LEDR[2]);
        LEDR[1]<= KEY[2]?SW[1]:(KEY[1]?LEDR[2]:LEDR[1]);
        LEDR[0]<= KEY[2]?SW[0]:(KEY[1]?LEDR[1]:LEDR[0]);
    end
    
endmodule

/*module MUXDFF (
    input clk,
    input w, R, E, L,
    output Q);
    
    always@(posedge clk) begin
        if(E && L) begin
           Q <= R; 
        end
        else if(E && ~L) begin
           Q <= w;
        end
        else if(~E && L) begin
           Q <= R;
        end
        else begin
            Q <= Q;
        end
    end

endmodule
*/