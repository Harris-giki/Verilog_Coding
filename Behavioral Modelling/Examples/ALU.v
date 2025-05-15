module example4(
    input A,B, Cin,
	 input ALU1, ALU2,
    output reg ALUOut, Cout
    );
	 
always @(ALUct1, A, B, Cin)
	begin
    Cout=0;
		case({ALU1, ALU2})
		2'd0: ALUOut <= A&B;
		2'd1: ALUOut <= A|B;
		2'd2: {Cout, ALUOut} <= Cin+A+B; //2'd2 == 2-bit binary value of decimal 2 == 2'b10
		default: ALUOut <= 0;
		endcase
	end
endmodule
