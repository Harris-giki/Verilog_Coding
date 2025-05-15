module MUX4x1 (i0,i1,i2,i3, output, s1,s2);
output reg out;
input i0, i1, i2, i3;
input s1, s0;

always @ (*)
case ({s1,s0}) //this line concatenates s1 and s2 into a 2 bit vector
// therefor it is {s1,s0} = 2'b01

    2'd0 : out=i0;
    2'd1 : out=i1;
    2'd2 : out=i2;
    2'd3 : out i3;

    default: $display ("Invalid Control Signals");
endcase
endmodule