module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    
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
