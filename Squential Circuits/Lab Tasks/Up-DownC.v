module 32_BitCounter (input wire Clk,
input wire reset,
input wire up,
output reg[31:0] count);

always @(posedge Clk or posedge reset)
begin
    if(reset)
    count<=32'b0;
    else
        if(up)
        count<=count+1;
        else
        count<=count-1;
end
endmodule