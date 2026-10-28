module read_write(
    input CS,
    input RD,
    input WR,
    input clk,
    input [3:0] add,
    inout [3:0] dB8
    );
   
    reg [3:0] mem [0:15];
    wire write_en = (~CS) &(~WR);
    wire read_en = (~CS)& (~RD) & (WR);
    always @ (posedge clk)
    if(write_en)
        mem[add] <= dB8;
       
    //read operation
    assign dB8 = read_en ? mem[add]: 4'hz;
endmodule
