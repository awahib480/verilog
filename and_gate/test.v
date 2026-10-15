`timescale 1ns / 1ps
// Module Name: test

module test;
    reg a;
    reg b;
    wire c;

    and_gate uut (
        .a(a),
        .b(b),
        .c(c)
        );
        
    initial begin
    a = 0;
    b = 0;
    
    #100;
    a = 0;
    b = 1;
    
    #100;
    a = 1;
    b = 0;
    
    #100;
    a = 1;
    b = 1;
    
    #100;
    
    end
    
endmodule
