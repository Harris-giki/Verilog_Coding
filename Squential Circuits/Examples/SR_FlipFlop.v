module sr_flipflop (Q, Qbar, S,R,Clk)
input S,R, Clk;
output reg Q, Qbar

always @(posedge Clk)
begin 
    case({S,R})
    2'b00: Q<=Q;
    2'b01: q<=1'b0;
    2'b10: Q<=1'b1;
    2'b11: Q<=1'bx;
    endcase
Qbar=~Q;
end
endmodule