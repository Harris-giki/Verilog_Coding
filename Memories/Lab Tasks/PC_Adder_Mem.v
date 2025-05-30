module PC_Adder(
    input [31:0] current_PC,
    output [31:0] next_PC
);
    assign next_PC = current_PC + 32'd4;
endmodule

module Program_Counter(
    input clk,
    input reset,
    input [31:0] next_PC,
    output reg [31:0] PC
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            PC <= 32'b0;
        else
            PC <= next_PC;
    end
endmodule

module INST_MEM(
    input [31:0] PC,
    input reset,
    output [31:0] Instruction_Code
);
    reg [7:0] Memory [31:0]; // Byte addressable memory with 32 locations

    // Under normal operation (reset = 0), we assign the instr. code, based on PC
    Assign Instruction_Code = {Memory[PC+3],Memory[PC+2],Memory[PC+1],Memory[PC]};

    // Initializing memory when reset is one
    always @(reset)
    begin
        if(reset == 1)
        begin
            // Setting 32-bit instruction: add t1, s0,s1 
            Memory[3] = 8'h00;
            Memory[2] = 8'h94;
            Memory[1] = 8'h03;
            Memory[0] = 8'h33;
            // Setting 32-bit instruction: sub t2, s2, s3 
            Memory[7] = 8'h41;
            Memory[6] = 8'h39;
            Memory[5] = 8'h03;
            Memory[4] = 8'hb3;

            // Setting 32-bit instruction: mul t0, s4, s5 
            Memory[11] = 8'h03;
            Memory[10] = 8'h5a;
            Memory[9] = 8'h02;
            Memory[8] = 8'hb3;
            // Setting 32-bit instruction: xor t3, s6, s7 
            Memory[15] = 8'h01;
            Memory[14] = 8'h7b;
            Memory[13] = 8'h4e;
            Memory[12] = 8'h33;
            // Setting 32-bit instruction: sll t4, s8, s9
            Memory[19] = 8'h01;
            Memory[18] = 8'h9c;
            Memory[17] = 8'h1e;
            Memory[16] = 8'hb3;
            // Setting 32-bit instruction: srl t5, s10, s11
            Memory[23] = 8'h01;
            Memory[22] = 8'hbd;
            Memory[21] = 8'h5f;
            Memory[20] = 8'h33;
            // Setting 32-bit instruction: and t6, a2, a3
            Memory[27] = 8'h00;
            Memory[26] = 8'hd6;
            Memory[25] = 8'h7f;
            Memory[24] = 8'hb3;
            // Setting 32-bit instruction: or a7, a4, a5
            Memory[31] = 8'h00;
            Memory[30] = 8'hf7;
            Memory[29] = 8'h68;
            Memory[28] = 8'hb3;
        end
    end

endmodule

module top_level(
    input clk,
    input reset,
    output [31:0] Instruction_Code
);
    // Wire declarations
    wire [31:0] current_PC;
    wire [31:0] next_PC;
    
    // Module instantiations
    
    // Program Counter module
    Program_Counter pc_module(
        .clk(clk),
        .reset(reset),
        .next_PC(next_PC),
        .PC(current_PC)
    );
    
    // PC Adder module - adds 4 to the current PC to get the next PC
    PC_Adder pc_adder_module(
        .current_PC(current_PC),
        .next_PC(next_PC)
    );
    
    // Instruction Memory module - retrieves instruction based on PC
    INST_MEM inst_mem_module(
        .PC(current_PC),
        .reset(reset),
        .Instruction_Code(Instruction_Code)
    );
    
endmodule