module tb_shift_reg;

    reg clk;
    reg rst_n;
    reg load;
    reg shift_in;
    reg [7:0] data_in;
    wire [7:0] q;

    // Instantiation
    shift_reg_8bit uut (
        .clk(clk),
        .rst_n(rst_n),
        .load(load),
        .shift_in(shift_in),
        .data_in(data_in),
        .q(q)
    );

    // Clock signal (10ns period)
    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_shift_reg);

        // Initial Values
        clk = 0;
        rst_n = 0;
        load = 0;
        shift_in = 0;
        data_in = 8'b10110011; // Sample 8-bit Data (179 in decimal)

        #12 rst_n = 1;     // Reset release
        #10 load = 1;      // Parallel Load data_in into q
        #10 load = 0;      // Stop loading, start shifting mode!
        
        // Shift in 1s and 0s one by one
        shift_in = 1; #10;
        shift_in = 0; #10;
        shift_in = 1; #10;

        #30;
        $display("Shift Register Test Complete!");
        $finish;
    end

endmodule
