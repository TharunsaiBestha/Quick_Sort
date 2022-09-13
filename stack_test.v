module stack_test;
parameter N = 64;
reg[31:0] val1,val2;
reg clk,push,pop;
wire empty;
wire[31:0] ret1,ret2;
integer i;
stack DUT(clk,val1,val2,push,pop,ret1,ret2,empty);
initial begin
    clk=0;
    push=0;
    pop=0;
    DUT.counter=0;
    for(i=0;i<N;i=i+1)begin
      DUT.mem[i]=0;
    end
    #5 val1=11;
      val2=22;push=1;
      #5 val1=36;
      val2=44;
    #10 push=0;pop=1;
    #500 $finish;
end
always #5 clk=~clk;
initial begin
    $dumpfile("stack_test.vcd");
    $dumpvars(0,stack_test);
end
endmodule