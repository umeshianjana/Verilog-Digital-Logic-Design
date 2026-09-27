module tb_alu_4bit;
  reg [3:0] a;
  reg [3:0] b;
  reg [1:0] opcode;
  wire [3:0] result;
  
  // Instantiation
  alu_4bit uut (
    .a(a),
    .b(b),
    .opcode(opcode),
    .result(result)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_alu_4bit);
    
    // Test Inputs: A = 8 (4b'1000), B =3 (4'b0011)
    a = 4'b1000;
    b = 4'b0011;
    
    #10 opcode = 2'b00; // Addition
    #10 opcode = 2'b01; // Subtraction
    #10 opcode = 2'b10; // AND
    #10 opcode = 2'b11; // OR
    
    #10;
    $display("4-bit ALU Simulation Completed!");
    $finish;
  end
endmodule
