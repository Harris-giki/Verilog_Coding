always @(reset or clock or d)
begin 
if (reset) //if reset signal is high, set q to 0 
q=1'b0;
else if(clock) //if clock is high, q = d 
q=b;
end