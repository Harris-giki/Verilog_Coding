module ALU32 (
    input  [31:0] A,        // Operand A
    input  [31:0] B,        // Operand B
    input  [3:0] ALUControl, // ALU control signal
    output reg [31:0] ALUOut, // ALU output
    output Zero             // Zero flag
);

    always @(*) begin
        case (ALUControl)
            4'b0000: ALUOut = A & B;         // AND
            4'b0001: ALUOut = A | B;         // OR
            4'b0010: ALUOut = A + B;         // ADD
            4'b0110: ALUOut = A - B;         // SUB
            4'b0111: ALUOut = (A < B) ? 32'b1 : 32'b0; // SLT
            4'b1100: ALUOut = ~(A | B);      // NOR
            default: ALUOut = 32'b0;         // Default to 0
        endcase
    end

    assign Zero = (ALUOut == 32'b0) ? 1'b1 : 1'b0;

endmodule
