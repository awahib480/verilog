module pipo_siso(
    input shift_clk,
    input en,
    input shift_load_bar,
    input [7:0] parallel_input,
    input serial_input,
    output reg [7:0] parallel_output,
    output reg serial_output
    );
    
    reg [7:0] shift_register;
    
    always @(posedge shift_clk)begin
    if (en)begin
        if(!shift_load_bar)begin
            shift_register<=parallel_input;
             parallel_output<=parallel_input;
            end
            
        else begin
            serial_output<=shift_register[7];
            shift_register<={shift_register[6:0],serial_input};
            parallel_output<={shift_register[6:0],serial_input};
            end
    end 
    end
endmodule
