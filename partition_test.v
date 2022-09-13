module partition_test;
parameter N = 8;
reg clk,init;
reg[31:0] i,j;
reg[31:0] loc_in;
integer c;
wire complete;
partition DUT(i,j,loc_in,clk,init,complete);
initial begin
    clk=0;
    init=0;
    DUT.state=4'b0000;
    DUT.set=0;
    DUT.vec[0]=13;DUT.vec[1]=2;DUT.vec[2]=8;DUT.vec[3]=12;DUT.vec[4]=1;DUT.vec[5]=3;DUT.vec[6]=31;DUT.vec[7]=22;
    i=0;
    j=N-1;
    loc_in=0;
    for(c=0;c<N;c=c+1)begin
      $write("%0d ",DUT.vec[c]);
    end
    $write("\n");
    #2 init=1;
    #500 $finish;
end
always #5 clk=~clk;
always @(posedge complete) begin
    for(c=0;c<N;c=c+1)begin
      $write("%0d ",DUT.vec[c]);
    end
    $write("\n");
end
initial begin
    $dumpfile("partition_test.vcd");
    $dumpvars(0,partition_test);
end
endmodule