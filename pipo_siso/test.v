module TB_pipo_siso;  
      reg shift_clk;
      reg en;
      reg shift_load_bar;
      reg [7:0] parallel_input;
      reg serial_input;
  
      wire [7:0] parallel_output;
      wire serial_output;
  
      // Instantiate the design
      pipo_siso uut (
          .shift_clock(shift_clk),
          .en(en),
          .shload_bar(shift_load_bar),
          .parallel_input(parallel_input),
          .serial_input(serial_input),
          .parallel_output(parallel_output),
          .serial_out(serial_output)
      );
  
      // Generate clock
      always #5 shift_clk = ~shift_clk;
  
      initial begin
  
          // Initial values
          shift_clk = 0;
          en = 0;
          shift_load_bar = 0;
          parallel_input = 8'b00000000;
          serial_input = 0;
  
          $display("==========================================================================");
          $display("                    8-BIT PIPO-SISO TESTBENCH");
          $display("==========================================================================");
          $display("| Time | En | Load | Parallel In | Serial In | Parallel Out | Serial Out |");
          $display("--------------------------------------------------------------------------");
  
          $monitor("| %4d | %2b | %4b |    %8b |     %1b     |    %8b   |     %1b     |",
                   $time, en, shift_load_bar, parallel_input,
                   serial_input, parallel_output, serial_output);
  
          // TEST 1: Parallel Load
          #10;
          en = 1;
          shift_load_bar = 0;
          parallel_input = 8'b10110010;
  
          #10;
 
          // TEST 2: Shift Left, Serial Input = 1
          shift_load_bar = 1;
          serial_input = 1;
  
          #10;

          // TEST 3: Shift Left, Serial Input = 0
          serial_input = 0;
  
          #10;
  
          // TEST 4: Shift Left, Serial Input = 1
          serial_input = 1;
  
          #10;
  
          // TEST 5: Disable / Hold
          en = 0;
          serial_input = 0;
          parallel_input = 8'b11111111;
  
          #20;

          // TEST 6: Enable Again and Shift
          en = 1;
          shift_load_bar = 1;
          serial_input = 0;
  
          #10;
  
          // TEST 7: Parallel Load Again
          shift_load_bar = 0;
          parallel_input = 8'b11001100;
  
          #10;
          $finish;

      end
endmodule
