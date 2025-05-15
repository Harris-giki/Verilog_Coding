module half_Adder(sum, carry, a, b);
input a,b;
output sum, carry;
reg sum, carry;

always @(a or b) //same as always @(*)
begin
    sum=a^b;
    carry=a&b;
end
endmodule