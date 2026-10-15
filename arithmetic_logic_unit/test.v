// Simulation File

module testbench;
  reg [7:0] A;
  reg [7:0] B;
  reg [3:0] ALU_Sel;

  // Outputs from ALU
  wire [7:0] X;
  wire [3:0] Flags;

  // Instantiate ALU
  ALU_8bit uut (
      .A(A),
      .B(B),
      .select(ALU_Sel),
      .X(X),
      .Flags(Flags)
  );

 initial begin
  
          // Table heading
         $display("==========================================================================");
          $display("                         8-BIT ALU TESTBENCH");
          $display("==========================================================================");
          $display("| Time |    A     |    B     | Sel  |    X     | O | Z | C | S |");
          $display("-------------------------------------------------------------------------");
          
          $monitor("| %4d | %8b | %8b | %4b | %8b | %1b | %1b | %1b | %1b |",
                   $time, A, B, ALU_Sel, X,
                   Flags[3], Flags[2], Flags[1], Flags[0]);
  
  
          A = 8'b00001010;
          B = 8'b00000101;
          ALU_Sel = 4'b0000;
          #10;
  
          
          A = 8'b11001000;
          B = 8'b01100100;
          ALU_Sel = 4'b0000;
          #10;
    
       
          A = 8'b00001010;
          B = 8'b00000101;
          ALU_Sel = 4'b0001;
          #10;
   
        
          A = 8'b00000101;
          B = 8'b00001010;
          ALU_Sel = 4'b0001;
          #10;
 
          A = 8'b10101010;
          B = 8'b11001100;
          ALU_Sel = 4'b0010;
          #10;
  
  
          A = 8'b10101010;
          B = 8'b11001100;
          ALU_Sel = 4'b0011;
          #10;
  
  
          A = 8'b10101010;
          B = 8'b11001100;
          ALU_Sel = 4'b0100;
          #10;
  
  
          A = 8'b10101010;
          B = 8'b00000000;
          ALU_Sel = 4'b0101;
          #10;
  
  
      
          A = 8'b00001111;
          B = 8'b00000000;
          ALU_Sel = 4'b0110;
          #10;
  
  
  
          A = 8'b11110000;
          B = 8'b00000000;
          ALU_Sel = 4'b0111;
          #10;
  
  
  
          A = 8'b10101010;
          B = 8'b10101010;
          ALU_Sel = 4'b0010;
          #10;
  
  
    
          A = 8'b10000000;
          B = 8'b00000001;
          ALU_Sel = 4'b0011;
          #10;
  
  
          $display("==========================================================================");
          $display("                         SIMULATION COMPLETE");
          $display("==========================================================================");
  
          $finish;
  
      end
endmodule
