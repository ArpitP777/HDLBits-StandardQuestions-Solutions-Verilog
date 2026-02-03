module top_module( 
    input [254:0] in,
    output reg [7:0] out );
    
    integer i;
    
    always@(*) 
        begin
            out = 8'b0;
            for(int i = 0; i<255; i = i+1) begin
                if(in[i] == 1'b1)
                	out = out + 1'b1;
            end
        end

endmodule
