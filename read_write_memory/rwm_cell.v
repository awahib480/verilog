module rwm_cell(
    input CS,
    input RD,
    input WR,
    inout [7:0] DB_8
    );
    
    reg [7:0] memory_reg;
    
   assign DB_8 = (!CS&&!RD)? memory_reg:8'bz;
   always @(*)
   begin
    if (!CS&&!WR) 
        memory_reg=DB_8;
   end
endmodule
