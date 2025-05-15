module adder
(
    input wire [31:0] a,
    output wire [31:0] sum
);
    assign sum = a + 32d'4;
endmodule

module counter_32Bit (input wire clk,
    input wire reset,
    input wire [31:0]next,
    output reg [31:0] count);

    always @(posedge clk or posedge reset) 
    begin
        if (reset)
        count<=32'b0;
        else
        count<=next;
    end
endmodule;

//TOP-LEVEL MODULE TO CONNECT THE BOTH

module pc_counter
(
    input wire clk,
    input wire reset,
    output wire [31:0] pc,
);
wire [31:0] next_pc //connection btw the modules

    // Instantiate the counter
counter_32Bit counter(
.clk(clk),
.reset(reset),
.next(next_pc),
.count(pc)
);
// Instantiate the adder
    adder_32bit adder (
        .a(pc),
        .sum(next_pc)
    );
endmodule
