// 4-bit Simple ALU Module
module alu_4bit (
    input wire [3:0] a,        // 4-bit Input A
    input wire [3:0] b,        // 4-bit Input B
    input wire [1:0] opcode,   // 2-bit Opcode
    output reg [3:0] result    // 4-bit Result
);
  
  always @(*) begin
     case (opcode)
        2'b00: result = a + b; // Addition
        2'b01: result = a - b; // Subtraction
        2'b10: result = a & b; // Bitwise AND
        2'b11: result = a | b; // Bitwise OR
        default: result = 4'b0000;
     endcase
  end
  
endmodule
