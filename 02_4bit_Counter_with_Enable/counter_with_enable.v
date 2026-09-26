// 4-bit Up Counter with Enable and Reset
module counter_with_enable (
    input wire clk,       // Clock signal
    input wire rst_n,     // Active-low Reset
    input wire enable,    // Enable Control Signal 
  output reg [3:0] count // 4-bit output (0 - 15)
);

    // For Clock in positive edge or Reset 
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 4'b0000; // If Reset count will 0
        end else if (enable) begin // If Enable 1 then count
            count <= count + 1; // If not add 1 for count
        end    // If Enable 0 count will same
    end

endmodule
