module ALU_8bit(
    input [7:0] A,
    input [7:0] B,
    input [3:0] select,
    output reg [7:0] X,
    output reg [3:0] Flags
    );
    reg [8:0] temp;
    always @(*)
    begin
    X=8'b0;
    temp=9'b0;
    Flags=4'b0;
    case (select)
                
                4'b0000: begin // ADD
                    temp = A + B;
                    X = temp[7:0];
                    Flags[1] = temp[8];                   // Carry
                    Flags[3] = (A[7] == B[7]) && (X[7] != A[7]); // Overflow
                end

                4'b0001: begin // SUB (A - B)
                    temp = A - B;
                    X = temp[7:0];
                    Flags[1] = (A < B);                   // Borrow treated as carry
                    Flags[3] = (A[7] != B[7]) && (X[7] != A[7]); // Overflow
                end
    
    
                // Logical
                4'b0010: X = A & B;   // AND
                4'b0011: X = A | B;   // OR
                4'b0100: X = A ^ B;   // XOR
    
    
                // Unary / Shift
                4'b0101: X = ~A;      // NOT
                4'b0110: X = A << 1;  // Logical Shift Left
                4'b0111: X = A >> 1;  // Logical Shift Right
    
    
                default: X = 8'b0;
            endcase
    
    
            // Flags update (common)
            Flags[0] = X[7];               // Sign flag
            Flags[2] = (X == 8'b0) ? 1'b1 : 1'b0; // Zero flag
            // Flags[1] and Flags[3] are already set for arithmetic
    end
endmodule
