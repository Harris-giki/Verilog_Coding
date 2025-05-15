module 1_darray
();

reg[7:0] array_1d[15:0];
integer i;

initial begin
    array_1d[0]=8'h11;
    array_1d[1]=8'h12;
    //similarly so on fill upto 16 locations

    $display("1D array elements:");
    for(i=0; i<16; i=i+1)
    begin
        $display("array_1d[%0d]=%h", i,array_1d[i]);
    end
end
endmodule