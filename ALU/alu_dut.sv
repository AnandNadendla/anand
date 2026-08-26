//dut 

module alu(
	input [7:0]a,b,
	input [3:0]op_code,
	input clk,reset,
	output reg [7:0]result,
	output reg cout
);

always @(*)begin
	if(reset==1)begin
			result=8'd0;
			cout=1'd0;
	end else begin
	case(op_code)
		4'b0001:{cout,result} =  a + b;
		4'b0010:{cout,result} =  a - b;
		4'b0011:result =  a & b;
		4'b0100:result =  a ^ b;
		4'b0101:result =  a * b;
		4'b0110:result =  a % b;
		4'b0111:result =  ~(a & b);
		default:{cout,result}= a + b;
	endcase
end
end
endmodule
