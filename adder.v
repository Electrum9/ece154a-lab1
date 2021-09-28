// Example adder module from section.
module adder_v1 ( input a,
        input b,
        input c_in,
        output c_out,
        output sum);

assign {c_out,sum} = a + b + c_in;

endmodule
