module MEM_WB(clk, rst, in_RegWrite, in_MemtoReg, in_Jump, in_opcode,
			  in_pc, in_rd, in_alu_out, in_mux, out_pc, out_rd, out_alu_out, out_mux,
			  out_RegWrite, out_MemtoReg, out_Jump, out_opcode);

	input clk, rst;
	input [4:0] in_mux;
	input [5:0] in_opcode;
	input [31:0] in_pc, in_rd, in_alu_out;
	input in_RegWrite, in_MemtoReg, in_Jump;
	output [4:0] out_mux;
	output [5:0] out_opcode;
	output [31:0] out_pc, out_rd, out_alu_out;
	output out_RegWrite, out_MemtoReg, out_Jump;
	
	reg [4:0] out_mux;
	reg [5:0] out_opcode;
	reg [31:0] out_pc, out_rd, out_alu_out;
	reg out_RegWrite, out_MemtoReg, out_Jump;
	
	always @(posedge clk) begin
		if (rst) begin
			out_RegWrite <= 1'b0;
			out_MemtoReg <= 1'b0;
			out_Jump <= 1'b0;
			out_opcode <= 6'b0;
			out_mux <= 5'b0;
			out_pc <= 32'b0;
			out_rd <= 32'b0;
			out_alu_out <= 32'b0;
		end
		else begin
			out_mux <= in_mux;
			out_pc <= in_pc;
			out_rd <= in_rd;
			out_alu_out <= in_alu_out;
			out_RegWrite <= in_RegWrite;
			out_MemtoReg <= in_MemtoReg;
			out_Jump <= in_Jump;
			out_opcode <= in_opcode;
		end
	end
	
endmodule

