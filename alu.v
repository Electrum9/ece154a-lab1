module adder(input [31:0] x, y,
             output reg [31:0] sum);
	
	always@(state)
		begin
			sum = x + y;
		end

endmodule

module adder(
	input [31:0] x, 
	input [31:0] y,
	input msb,
	output reg [31:0] sum
);
	
	always@(*)
		begin
			sum = x + y + msb;
		end

endmodule

module AND(
	input [31:0] x,
	input [31:0] y,
	output reg [31:0] out
);
	integer i;

	always@(*)
		begin
			for (i=0; i < 32; i = i+1)
				begin
					out[i] = x[i] & y[i];
				end
		end
endmodule

module OR(
	input [31:0] x,
	input [31:0] y,
	output reg [31:0] out
);
	integer i;

	always@(*)
		begin
			for (i=0; i < 32; i = i+1)
				begin
					out[i] = x[i] | y[i];
				end
		end
endmodule

module NOT(
input [31:0] n,
output reg [31:0] inverse
);

	always@(*)
		begin
			inverse = ~n;
		end

endmodule

module multiplex1(
input f2,
input [31:0] b,
output reg [31:0] nb
);
always@(*)
begin
	if (f2==0)
		nb = b;
	else
		nb = ~b;
end

endmodule


module multiplex2( //need to change this mux
input [1:0] f,
input [31:0] a,
input [31:0] newb,
output reg [31:0] y
);
wire ando, oro, addo, slt;

	AND and2 (a,newb,ando);
	OR or2 (a,newb,oro);
	adder add1 (a, newb, addo);
	adder slt1 (a, newb, slt);

y = f[1] ? (f[0] ? slt : addo) : (f[0] ? oro : ando);
/*
	case(f10)
		2'b00:
			begin
				AND and1 (a,newb,y);
			end
		
		2'b01:
			begin
				OR or1 (a,newb,y);
			end
		2'b10:
			begin
				adder add1 (a,newb,f10[2],y);
			end
			
		2'b11:
			begin
				adder add2 (a,newb,f10[2],y);
				if (y[31] == 1)
					y = 1;
				else
					y = 0;
			end
	endcase
	*/
endmodule


module alu(input [31:0] a, 
 input [31:0] b,
 input [2:0] f,
 output reg [31:0] y,
 output reg zero);

	reg [31:0] transb;
	
	multiplex1 mult1 (f[2], b, transb);
	multiplex2 mult2 (f[1:0],a,transb,y);
	
endmodule
