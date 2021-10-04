`timescale 1ns/100ps

module testbench();

/* 
test_cases is loaded with all test cases from test vector file.
There are 21 tests total, where the inputs and outputs for each tests are encoded
in a 100 length bit vector. 

The structure of the bit vector is as follows (from MSB to LSB):
- The leftmost 3 bits = f
- The next couple 32 bit blocks are a, b, y (in that order)
- Final bit is Zero

*/
reg [99:0] test_cases [20:0]; 

// These hold inputs to be fed into the ALU 
reg [2:0] f; // Control input
reg [31:0] a;
reg [31:0] b;

wire [31:0] y;
wire zero;

alu dut(.f(f), .a(a), .b(b), .y(y), .zero(zero));

integer i;

initial begin
  $readmemh("../ece154a/new-alu-tests.tv", test_cases); //might need to change file path to find new-alu-tests.tv
  //$readmemh("/fs/student/vikrambhagavatula/ece154a/ece154a-lab1/alu-tests.tv", test_cases);
  //$readmemb("/fs/student/vikrambhagavatula/ece154a/ece154a-lab1/new-alu-tests.tv", test_cases); // contains bit strings, not hex

  for (i = 0; i < 21; i = i + 1) begin
    #3
    f = test_cases[i][99:97];
    a = test_cases[i][96:65];
    b = test_cases[i][64:33];
    #1 $display("f=%h, a=%h, b=%h, y=%h, zero=%h", f, a, b, y, zero);
  end
end

endmodule
