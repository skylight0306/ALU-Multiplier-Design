module ID_EX( clk, rst,inpc,outpc,inRegDst, inALUSrc, inMemtoReg, inRegWrite, inMemRead, inMemWrite, inBranch, inBranchNE, inJump, inALUOp, 
			  outRegDst, outALUSrc, outMemtoReg, outRegWrite, outMemRead, outMemWrite, outBranch, outBranchNE, outJump,outALUOp,
			  inRD1, inRD2, inextend_immed,outRD1, outRD2, outextend_immed, inrt, inrd, outrt, outrd,inopcode, outopcode, inoperation, outoperation, in_jump_addr, out_jump_addr);
	input clk, rst;
	input [31:0] inpc ;
	output [31:0] outpc ;
	input inRegDst, inALUSrc, inMemtoReg, inRegWrite, inMemRead, inMemWrite, inBranch, inBranchNE, inJump ;
	input [1:0] inALUOp ;
	output outRegDst, outALUSrc, outMemtoReg, outRegWrite, outMemRead, outMemWrite, outBranch, outBranchNE, outJump ;
	output [1:0] outALUOp ;
	input [31:0] inRD1, inRD2, inextend_immed ;
	output [31:0] outRD1, outRD2, outextend_immed ;
	input [4:0] inrt, inrd ;
	output [4:0] outrt, outrd ;
	input [5:0] inopcode;
	output [5:0] outopcode;
	input [2:0] inoperation;
	output [2:0] outoperation;
	input [31:0] in_jump_addr;
	output [31:0] out_jump_addr;
	
	reg [31:0] outpc ;
	reg outRegDst, outALUSrc, outMemtoReg, outRegWrite, outMemRead, outMemWrite, outBranch, outBranchNE, outJump ;
	reg [1:0] outALUOp ;
	reg [31:0] outRD1, outRD2, outextend_immed, out_jump_addr;
	reg [4:0] outrt, outrd ;
	reg [5:0] outopcode;
	reg [2:0] outoperation;

	always @( posedge clk ) begin
		if (rst) begin
			outpc <= 32'b0;
			outRegDst <= 1'b0;
			outALUSrc <= 1'b0;
			outMemtoReg <= 1'b0;
			outRegWrite <= 1'b0;
			outMemRead <= 1'b0;
			outMemWrite <= 1'b0;
			outBranch <= 1'b0;
			outBranchNE <= 1'b0;
			outJump <= 1'b0;
			outALUOp <= 2'b0;
			outRD1 <= 32'b0;
			outRD2 <= 32'b0;
			outextend_immed <= 32'b0;
			outrt <= 4'b0;
			outrd <= 4'b0;
			outopcode <= 6'b0;
			outoperation <= 3'b0;
			out_jump_addr <= 32'b0;
		end
		else begin
			outpc <= inpc ;
			outRegDst <= inRegDst ;
			outALUSrc <= inALUSrc ;
			outMemtoReg <= inMemtoReg ;
			outRegWrite <= inRegWrite ;
			outMemRead <= inMemRead ;
			outMemWrite <= inMemWrite ;
			outBranch <= inBranch ;
			outBranchNE <= inBranchNE ;
			outJump <= inJump ;
			outALUOp <= inALUOp ;
			outRD1 <= inRD1 ;
			outRD2 <= inRD2 ;
			outextend_immed <= inextend_immed ;
			outrt <= inrt ;
			outrd <= inrd ;
			outopcode <= inopcode ;
			outoperation <= inoperation;
			out_jump_addr <= in_jump_addr;
		end
	end
		
endmodule