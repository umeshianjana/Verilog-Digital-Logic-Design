// Testbench to verify the 4-bit Counter
module tb_counter;

    reg clk;
    reg rst_n;
    wire [3:0] count;

    // Counter module Instantiation
    counter_4bit uut (
        .clk(clk),
        .rst_n(rst_n),
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

        #12 rst_n = 1; // Reset release

        #100; // Simulate For 100ns 

        $display("Counter Test Finished!");
        $finish;
    end

endmodule
