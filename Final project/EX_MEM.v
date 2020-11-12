module EX_MEM(clk, rst, in_RegWrite, in_Branch, in_BranchNE, in_MemtoReg, in_MemRead, in_MemWrite, in_Jump, in_opcode,
			  inpc, in_pc, in_zero, in_alu_out, in_rd2, in_mux, outpc, out_pc, out_zero, out_alu_out, out_rd2, out_mux,
			  out_RegWrite, out_Branch, out_BranchNE, out_MemtoReg, out_MemRead, out_MemWrite, out_Jump, out_opcode, in_jump_addr, out_jump_addr);

	input clk, rst;
	input in_zero;
	input [4:0] in_mux;
	input [5:0] in_opcode;
	input [31:0] inpc, in_pc, in_alu_out, in_rd2, in_jump_addr;
	input in_RegWrite, in_Branch, in_BranchNE, in_MemtoReg, in_MemRead, in_MemWrite, in_Jump;
	output out_zero;
	output [4:0] out_mux;
	output [5:0] out_opcode;
	output [31:0] outpc, out_pc, out_alu_out, out_rd2, out_jump_addr;
	output out_RegWrite, out_Branch, out_BranchNE, out_MemtoReg, out_MemRead, out_MemWrite, out_Jump;
	
	reg out_zero;
	reg [4:0] out_mux;
	reg [5:0] out_opcode;
	reg [31:0] outpc, out_pc, out_alu_out, out_rd2, out_jump_addr;
	reg out_RegWrite, out_Branch, out_BranchNE, out_MemtoReg, out_MemRead, out_MemWrite, out_Jump;
	
	always @(posedge clk) begin
		if (rst) begin
			out_MemtoReg <= 1'b0;
			out_RegWrite <= 1'b0;
			out_MemRead <= 1'b0;
			out_MemWrite <= 1'b0;
			out_Branch <= 1'b0;
			out_BranchNE <= 1'b0;
			out_Jump <= 1'b0;
			out_opcode <= 6'b0;
			out_mux <= 5'b0;
			outpc <= 32'b0;
			out_pc <= 32'b0;
			out_alu_out <= 32'b0;
			out_rd2 <= 32'b0;
			out_jump_addr <= 32'b0;
			out_zero <= 1'b0;
		end
		else begin
			out_MemtoReg <= in_MemtoReg;
			out_RegWrite <= in_RegWrite;
			out_MemWrite <= in_MemWrite;
			out_MemRead <= in_MemRead;
			out_Branch <= in_Branch;
			out_BranchNE <= out_BranchNE;
			out_mux <= in_mux;
			outpc <= inpc;
			out_pc <= in_pc;
			out_alu_out <= in_alu_out;
			out_rd2 <= in_rd2;
			out_Jump <= in_Jump;
			out_opcode <= in_opcode; 
			out_jump_addr <= in_jump_addr;
			out_zero <= in_zero;
		end
	end
	
endmodule

