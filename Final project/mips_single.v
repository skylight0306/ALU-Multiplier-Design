//	Title: MIPS Single-Cycle Processor
//	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
module mips_single( clk, rst );
	input clk, rst;
	
	// instruction bus
	wire[31:0] instr;
	
	// break out important fields from instruction
	wire [5:0] opcode, funct;
    wire [4:0] rs, rt, rd, shamt;
    wire [15:0] immed;
    wire [31:0] extend_immed, b_offset;
    wire [25:0] jumpoffset;
	
	// datapath signals
    wire [4:0] rfile_wn;
    wire [31:0] rfile_rd1, rfile_rd2, rfile_wd, alu_b, alu_out, b_tgt, 
	            pc_next, pc, pc_incr, dmem_rdata, jump_addr, branch_addr;

	// control signals
	wire [31:0] temppc ;
    wire RegWrite, Branch, BranchNE, PCSrc, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Zero, Jump;
    wire [1:0] ALUOp;
    wire [2:0] Operation;
	
	wire cycle3_out_zero;
	wire cycle2_out_RegDst, cycle2_out_ALUSrc, cycle2_out_MemtoReg, cycle2_out_RegWrite, cycle2_out_MemRead,
		 cycle2_out_MemWrite, cycle2_out_Branch, cycle2_out_BranchNE, cycle2_out_Jump,
		 cycle3_out_RegWrite, cycle3_out_Branch, cycle3_out_BranchNE,cycle3_out_MemtoReg,
		 cycle3_out_MemRead, cycle3_out_MemWrite, cycle3_out_Jump,
		 cycle4_out_RegWrite, cycle4_out_MemtoReg, cycle4_out_Jump;
		 
	wire [5:0] cycle2_out_opcode, cycle3_out_opcode, cycle4_out_opcode;
	wire [2:0] cycle2_out_ctl ;
	
	wire [1:0] cycle2_out_ALUOp;
	wire [4:0] cycle2_out_rt, cycle2_out_rd, cycle3_out_mux, cycle4_out_mux;
	wire [31:0] cycle1_out_pc, cycle1_out_instr, 
				cycle2_out_pc, cycle2_out_rd1, cycle2_out_rd2, cycle2_out_extend_immed, cycle2_out_jump_addr,
				cycle3_outpc, cycle3_out_pc, cycle3_out_alu_out, cycle3_out_rd2, cycle3_out_jump_addr,
				cycle4_outpc, cycle4_out_rd, cycle4_out_alu_out;
				
	assign temppc = pc_incr ;
    assign opcode = cycle1_out_instr[31:26];
    assign rs = cycle1_out_instr[25:21];
    assign rt = cycle1_out_instr[20:16];
    assign rd = cycle1_out_instr[15:11];
    assign shamt = cycle1_out_instr[10:6];
    assign funct = cycle1_out_instr[5:0];
    assign immed = cycle1_out_instr[15:0];
    assign jumpoffset = cycle1_out_instr[25:0];
	
	// branch offset shifter
    assign b_offset = cycle2_out_extend_immed << 2;
	// jump offset shifter & concatenation
	assign jump_addr = { pc_incr[31:28], jumpoffset << 2 };

	// module instantiations
	add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr) );// PC = PC + 4;
	mux2 #(32) JMUX( .sel(cycle3_out_Jump), .a(branch_addr), .b(cycle3_out_jump_addr), .y(pc_next) );
	reg32 PC( .clk(clk), .rst(rst), .en_reg(1'b1), .d_in(pc_next), .d_out(pc) );// PC
	memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(instr) );
	IF_ID Cycle1(.clk(clk), .rst(rst), .inpc(pc_incr) , .ininstr(instr), .outpc(cycle1_out_pc), .outinstr(cycle1_out_instr)); // pipeline 暫存器
	// 一個clock ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	
	
	reg_file RegFile( .clk(clk), .RegWrite(cycle4_out_RegWrite), .RN1(rs), .RN2(rt), .WN(cycle4_out_mux), 
					  .WD(rfile_wd), .RD1(rfile_rd1), .RD2(rfile_rd2) );
	sign_extend SignExt( .immed_in(immed), .ext_immed_out(extend_immed) ); //sign extend
	control_single CTL(.opcode(opcode), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg), 
                       .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), .BranchNE(BranchNE),
                       .Jump(Jump), .ALUOp(ALUOp), .instr(cycle1_out_instr));
					   
	ID_EX Cycle2(.clk(clk), .rst(rst), .inpc(cycle1_out_pc),.outpc(cycle2_out_pc),.inRegDst(RegDst), .inALUSrc(ALUSrc), .inMemtoReg(MemtoReg), .inRegWrite(RegWrite), 
				 .inMemRead(MemRead), .inMemWrite(MemWrite), .inBranch(Branch), .inBranchNE(BranchNE) , .inJump(Jump),.inALUOp(ALUOp), .outRegDst(cycle2_out_RegDst), .outALUSrc(cycle2_out_ALUSrc), 
				 .outMemtoReg(cycle2_out_MemtoReg), .outRegWrite(cycle2_out_RegWrite), .outMemRead(cycle2_out_MemRead), .outMemWrite(cycle2_out_MemWrite), .outBranch(cycle2_out_Branch), .outBranchNE(cycle2_out_BranchNE),
				 .outJump(cycle2_out_Jump), .outALUOp(cycle2_out_ALUOp),.inRD1(rfile_rd1), .inRD2(rfile_rd2), .inextend_immed(extend_immed),.outRD1(cycle2_out_rd1), .outRD2(cycle2_out_rd2), 
				 .outextend_immed(cycle2_out_extend_immed), .inrt(rt), .inrd(rd), .outrt(cycle2_out_rt), .outrd(cycle2_out_rd), .inopcode(opcode), .outopcode(cycle2_out_opcode), 
				 .inoperation(Operation), .outoperation(cycle2_out_ctl), .in_jump_addr(jump_addr), .out_jump_addr(cycle2_out_jump_addr)); 
	// 一個clock ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	 
	
	
	
	
	
	
	
	
	
    add32 BRADD( .a(cycle2_out_pc), .b(b_offset), .result(b_tgt) ); // BRANCH ADD
	mux2 #(32) ALUMUX( .sel(cycle2_out_ALUSrc), .a(cycle2_out_rd2), .b(cycle2_out_extend_immed), .y(alu_b) );// ALU前的MUX
	alu_ctl ALUCTL( .ALUOp(ALUOp), .Funct(funct), .ALUOperation(Operation) );
	TotalALU alu( .ctl(cycle2_out_ctl), .opcode(cycle2_out_opcode), .immed(cycle2_out_extend_immed[15:0]), .a(cycle2_out_rd1), .b(alu_b), .result(alu_out), .BNE(cycle2_out_BranchNE), .zero(Zero) );
	mux2 #(5) RFMUX( .sel(cycle2_out_RegDst), .a(cycle2_out_rt), .b(cycle2_out_rd), .y(rfile_wn) );
	
	
	
	EX_MEM Cycle3(.clk(clk), .rst(rst), .in_RegWrite(cycle2_out_RegWrite), .in_Branch(cycle2_out_Branch), .in_BranchNE(cycle2_out_BranchNE), .in_MemtoReg(cycle2_out_MemtoReg), .in_MemRead(cycle2_out_MemRead), 
	              .in_MemWrite(cycle2_out_MemWrite), .in_Jump(cycle2_out_Jump), .in_opcode(cycle2_out_opcode), .inpc(cycle2_out_pc), .in_pc(b_tgt), .in_zero(Zero), .in_alu_out(alu_out), 
				  .in_rd2(cycle2_out_rd2), .in_mux(rfile_wn), .outpc(cycle3_outpc), .out_pc(cycle3_out_pc), .out_zero(cycle3_out_zero), .out_alu_out(cycle3_out_alu_out), 
				  .out_rd2(cycle3_out_rd2), .out_mux(cycle3_out_mux), .out_RegWrite(cycle3_out_RegWrite), .out_Branch(cycle3_out_Branch), .out_BranchNE(cycle3_out_BranchNE), .out_MemtoReg(cycle3_out_MemtoReg), 
				  .out_MemRead(cycle3_out_MemRead), .out_MemWrite(cycle3_out_MemWrite), .out_Jump(cycle3_out_Jump), .out_opcode(cycle3_out_opcode), 
				  .in_jump_addr(cycle2_out_jump_addr), .out_jump_addr(cycle3_out_jump_addr));// pipeline EX/MEM暫存器
				  
				  
				  
	// 一個clock ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			
			
			
			
			
	memory DatMem( .clk(clk), .MemRead(cycle3_out_MemRead), .MemWrite(cycle3_out_MemWrite), .wd(cycle3_out_rd2), 
				   .addr(cycle3_out_alu_out), .rd(dmem_rdata) );			
			
	and BR_AND(PCSrc, cycle3_out_Branch, cycle3_out_zero);// branch的邏輯闸		
	MEM_WB Cycle4(.clk(clk), .rst(rst), .in_RegWrite(cycle3_out_RegWrite), .in_MemtoReg(cycle3_out_MemtoReg), .in_Jump(cycle3_out_Jump), .in_opcode(cycle3_out_opcode),
			      .in_pc(cycle3_outpc), .in_rd(dmem_rdata), .in_alu_out(cycle3_out_alu_out), .in_mux(cycle3_out_mux), .out_pc(cycle4_outpc), .out_rd(cycle4_out_rd),.out_alu_out(cycle4_out_alu_out), .out_mux(cycle4_out_mux),
			      .out_RegWrite(cycle4_out_RegWrite), .out_MemtoReg(cycle4_out_MemtoReg), .out_Jump(cycle4_out_Jump), .out_opcode(cycle4_out_opcode)); // pipeline 暫存器
	// 一個clock ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




	
    
    mux2 #(32) WRMUX( .sel(cycle4_out_MemtoReg), .a(cycle4_out_alu_out), .b(cycle4_out_rd), .y(rfile_wd) );
	mux2 #(32) PCMUX( .sel(PCSrc), .a(pc_incr), .b(cycle3_out_pc), .y(branch_addr) );

    

								   
endmodule
