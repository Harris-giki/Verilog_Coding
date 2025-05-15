module counter (
    input reset, clk,
    output reg [3:0] counter
);
always @(posedge clk, posedge reset)
begin
    if (reset)
        counter<=4'b1111;
    else
    counter<=counter-1;
end
endmodule
