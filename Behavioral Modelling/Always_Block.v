inital              //look how we initialized the simultation in an inital block
clock = 1b'0;
always
#10 clock=`clock;
initial                 //look how we halted the simultation in an initial block
#1000 $finish 