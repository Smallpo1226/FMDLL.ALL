
module Select_Logic (
    input DIV_N,
    input CLK_out,
    input CLK_exit,
    input DIV_M,
    input [3:0] N, 
    input [1:0] M, 
    input [3:0] N_counter,
    input [1:0] M_counter,
    output reg [1:0] Sel
);

   always@* begin
    if(M_counter != M) begin
        if((N_counter == N) && (~DIV_N)) begin
            Sel = 2'b10;
        end
        else
        Sel = 2'b00;
    end
    else if(M_counter == M)begin
        if((~CLK_out) && (~DIV_M) && (~DIV_N)) begin
            Sel = 2'b01;
        end 
    end
end

endmodule
