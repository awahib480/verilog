module test_rwm;
reg [7:0] data_drive;     // Used only during write
    wire [7:0] DB_8;          // Shared bus
    reg WR_n, RD_n, CS_n;


    rwm_cell uut (
        .DB_8(DB_8),
        .WR(WR_n),
        .RD(RD_n),
        .CS(CS_n)
    );

    // During write, testbench drives DB_8
    assign DB_8 = (!WR_n && !CS_n) ? data_drive : 8'bz;

    initial begin
        // Initial state
        CS_n = 1; WR_n = 1; RD_n = 1; data_drive = 8'b0;
        #10;

        // ---- WRITE Operation ----
        $display("Writing 10101010 to memory...");
        CS_n = 0; WR_n = 0; RD_n = 1;     // enable chip and write
        data_drive = 8'b10101010;
        #10;
        WR_n = 1; CS_n = 1;              // disable after write
        #10;

        // ---- READ Operation ----
        $display("Reading from memory...");
        CS_n = 0; RD_n = 0; WR_n = 1;     // enable chip and read
        #10;
        $display("Data read from memory = %b", DB_8);
        #10
        RD_n = 1; CS_n = 1;               // disable after read
        #10;

        // ---- HIGH-Z state ----
        $display("High impedance (disabled)...");
        CS_n = 1; RD_n = 1; WR_n = 1;
        #10;

        $finish;
    end

endmodule
