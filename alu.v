module adder(input [31:0] x, y,
             output reg [31:0] sum);
	
	always@(state)
		begin
			sum = x + y;
		end

endmodule


module inverter(
input [31:0] n,
output reg [31:0] inverse,
);

	always@(state)
		begin
			inverse = ~n;
		end

endmodule

module alu(input [31:0] a, b,
           input [2:0] f,
           output reg [31:0] y,
           output reg zero);
 
	always@(state)
		begin
			case(f)
				3'b000: begin
					y = a & b;
				end
					
				3'b001: begin
					y = a | b;
				end
				
				3'b010: begin
					adder positive(a,b,y);
				end
				
				3'b100: begin
					inverter inverse notb (b);
					y = a & b;
				end
				
				3'b101: begin
					inverter inverse1 notb (b);
					y = a | b;
				end
				
				3'b110: begin
					
				end
				
				3'b111: begin
					
				end
			endcase
			if (y == 0)
				zero = true;
		end
endmodule
