`timescale 1ns/100ps
module testbench();

reg [4:0] test_cases [20:0]; // loaded with all test cases from test vector file

// These hold inputs to be fed into the ALU 
reg [2:0] f; // Control input
reg [31:0] a;
reg [31:0] b;

wire y, zero;

alu dut(.f(f), .a(a), .b(b), .y(y), .zero(zero));

initial begin
  #3;
  a = 0;
  b = 0;
  #1 $display("a=%d, b=%d, s=%d, cout=%d", a, b, s, cout);

  #3;
  a = 1;
  b = 0;
  #1 $display("a=%d, b=%d, s=%d, cout=%d", a, b, s, cout);

  #3;
  a = 0;
  b = 1;
  #1 $display("a=%d, b=%d, s=%d, cout=%d", a, b, s, cout);

  #3;
  a = 1;
  b = 1;
  #1 $display("a=%d, b=%d, s=%d, cout=%d", a, b, s, cout);
end

endmodule
