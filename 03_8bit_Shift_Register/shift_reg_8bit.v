// 8-bit Shift Register Module
module shift_reg_8bit (
    input wire clk,          // Clock
    input wire rst_n,        // Active-low Reset
    input wire load,         // 1 = Load fresh data, 0 = Shift data
    input wire shift_in,     // New bit coming in during shift
    input wire [7:0] data_in,// 8-bit data to load in parallel
    output reg [7:0] q       // 8-bit output register
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= 8'b00000000;      //when Reset be 0
        end else if (load) begin
            q <= data_in;          // If Load = 1 take Data 8 in
        end else begin
          q <= {q[6:0], shift_in}; // If Load = 0 Shift Left side
        end
    end

endmodule
