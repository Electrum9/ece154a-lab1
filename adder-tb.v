// Example testbench for adder from section.
`timescale 1ns / 1ns

module adder_tb_v1;

reg a;
reg b;
reg c_in;
wire sum;
wire c_out;

adder_v1 UUT_adder1 (.b(b), .a(a), .c_in(c_in), .c_out(c_out), .sum(sum));

initial 
begin

#10;
a = 1'b0;
b = 1'b0;
c_in = 1'b0;
#1;
$display("A = %b, B = %b, C_in = %b, Sum = %b, C_out = %b",a,b,c_in,sum,c_out);

#10;
a = 1'b0;
b = 1'b1;
c_in = 1'b0;
#1;
$display("A = %b, B = %b, C_in = %b, Sum = %b, C_out = %b",a,b,c_in,sum,c_out);

#10;
a = 1'b1;
b = 1'b0;
c_in = 1'b0;
#1;
$display("A = %b, B = %b, C_in = %b, Sum = %b, C_out = %b",a,b,c_in,sum,c_out);

#10;
a = 1'b1;
b = 1'b1;
c_in = 1'b0;
#1;
$display("A = %b, B = %b, C_in = %b, Sum = %b, C_out = %b",a,b,c_in,sum,c_out);

#10;
a = 1'b0;
b = 1'b0;
c_in = 1'b1;
#1;
$display("A = %b, B = %b, C_in = %b, Sum = %b, C_out = %b",a,b,c_in,sum,c_out);

#10;
a = 1'b0;
b = 1'b1;
c_in = 1'b1;
#1;
$display("A = %b, B = %b, C_in = %b, Sum = %b, C_out = %b",a,b,c_in,sum,c_out);

#10;
a = 1'b1;
b = 1'b0;
c_in = 1'b1;
#1;
$display("A = %b, B = %b, C_in = %b, Sum = %b, C_out = %b",a,b,c_in,sum,c_out);

#10;
a = 1'b1;
b = 1'b1;
c_in = 1'b1;
#1;
$display("A = %b, B = %b, C_in = %b, Sum = %b, C_out = %b",a,b,c_in,sum,c_out);

end

endmodule
