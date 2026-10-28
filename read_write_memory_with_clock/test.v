`timescale 1ns / 1ps

module read_write_tb;
    reg CS,RD,WR,clk;
    reg [3:0] add;
    reg [3:0]mem;
    wire [3:0]dB8;
   
    assign dB8 = (~CS && ~WR)? mem: 4'hz;
   
    read_write uut(.CS(CS),.RD(RD),.WR(WR),.clk(clk),.add(add),.dB8(dB8));

initial clk = 0;
always #5 clk = ~clk;
   
 initial begin
 
 CS=0;WR=0;mem=4'b1010;add=4'b0000;#100
 
 CS=0;WR=1;RD=0;mem=4'b1011;add=4'b0000;#100
 
 CS=0;WR=1;RD=1;add=4'b0000;#100
 
 CS=1;WR=1;RD=0;add = 4'b0000;#100;
 
 CS=0;WR=0;mem=4'b1000;add=4'b0001;#100
 
 CS=0;WR=1;RD=0;add=4'b0001;#100;
 
 CS=0;WR=0;mem=4'b1111;add=4'b1010;#100;
 end
endmodule
