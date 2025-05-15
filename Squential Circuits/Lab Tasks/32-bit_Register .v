module register_32bit (
    input wire clk,          // Clock input
    input wire reset,        // Active-high reset
    input wire [31:0] data_in,  // 32-bit data input
    output reg [31:0] data_out  // 32-bit data output
);

// Register behavior
always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset condition - clear the output
        data_out <= 32'b0;
    end else begin
        // Normal operation - pass input to output
        data_out <= data_in;
    end
end

endmodule