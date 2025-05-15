module JK_Fliplfop(J,K,Q,Qbar,Clk)
input J,K;
output reg Q,Qbar;
always @(posedge Clk)
begin
    case({J,K})
    2'b00: Q<=Q; //hold
    2'b01: Q<=1'b0; //Reset
    2'b10: Q<=1'b1; //Set
    2'b11: Q<=~Q; //Toggle
    endcase
end
Qbar<=~Q;
endmodule 
    