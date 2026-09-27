module tb_mux_4to1;
    reg [3:0] in;
    reg [1:0] sel;
    wire out;
       
    // Instantiation
         mux_4to1 uut (
           .in(in),
           .sel(sel),
           .out(out)
         );
         
         initial begin
             $dumpfile("dump.vcd");
             $dumpvars(0, tb_mux_4to1);
           
           // Test Setup: Set inputs in = 4'b1010 (in[0]=0, in[1]=1, in[2]=0, in[3]=1
           in = 4'b1010;
           sel = 2'b00;
           
           #10 sel = 2'b00; // Expected out == in[0] (0)
           #10 sel = 2'b01;
           #10 sel = 2'b10;
           #10 sel = 2'b11;
           
           #10;
           $display("4-to-1 MUX Simulation Completed!");
           $finish;
       end
   endmodule
