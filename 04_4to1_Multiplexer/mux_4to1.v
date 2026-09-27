// 4-to-1 Multiplexer Module
module mux_4to1 (
  input wire [3:0] in,   // 4-bit Data Inputs (in[0], in[1], in[2], in[3])
  input wire [1:0] sel,  // 2-bit Select Signal
  output reg out      
);
  
  always @(*) begin
    case (sel)
      2'b00: out = in[0];
      2'b01: out = in[1];
      2'b10: out = in[2];
      2'b11: out = in[3];
      default: out = 1'b0;
    endcase
  end
endmodule
