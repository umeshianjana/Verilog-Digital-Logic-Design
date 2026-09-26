// 4-bit Up Counter Module
module counter_4bit (
    input wire clk,       // Clock signal
    input wire rst_n,     // Active-low Reset
    output reg [3:0] count // 4-bit output (0 to 15)
);

    // For Clock in positive edge or Reset 
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 4'b0000; // If Reset count will 0
        end else begin
            count <= count + 1; // If not add 1 for count
        end
    end

endmodule
