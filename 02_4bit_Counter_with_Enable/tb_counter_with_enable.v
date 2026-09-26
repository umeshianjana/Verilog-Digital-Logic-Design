// Testbench to verify the 4-bit Counter
module tb_counter;

    reg clk;
    reg rst_n;
    reg enable;
    wire [3:0] count;

    // Counter module Instantiation
    counter_with_enable uut (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .count(count)
    );

  // Generate Clock Signal (for Once a 5 seconds toggle)
    always #5 clk = ~clk;

    initial begin
        //For get Waveform 
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_counter);

        // Initial settings
        clk = 0;
        rst_n = 0; // Reset Active
        enable = 0;

        #12 rst_n = 1; // Reset release
        #10 enable = 1; //Enable set to 1 (Count Start)
        #40 enable = 0; // Enable set to 0 (Pause Counting)
      #30 enable = 1; // Enable set to 1 (Resume Counting)

        #50; // Simulate For 50ns 

        $display("Test Finished!");
        $finish;
    end

endmodule
