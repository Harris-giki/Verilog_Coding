module full_Adder(
    input [1:0] A,  //2-bit input for A
    input [1:0] B,  
    input Cin,
    output reg [1:0] Sum,
    output reg Cout
);

always @ (A or B or Cin)
begin
    (Cout, Sum)=A+B+Cin;
end
endmodule