module stack(clk,val1,val2,push,pop,ret1,ret2,empty);
parameter N = 64;
input[31:0] val1,val2;
input clk,push,pop;
output reg empty;
output reg[31:0] ret1,ret2;
reg[31:0]  counter;
reg[31:0] mem[0:N];
always @(posedge clk) begin
    if(push)begin
        mem[counter]<=val1;
        mem[counter+1]<=val2;
        counter<=counter+2;
    end
    else if(pop && counter!=0)begin
      ret1<=mem[counter-1];
      ret2<=mem[counter-2];
      counter<=counter-2;
    end
end
always @(counter) begin
    empty<=(counter==0);
end
endmodule