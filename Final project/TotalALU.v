module TotalALU(a, b, opcode, immed, ctl, result, BNE, zero);
	input [31:0] a ;
	input [31:0] b ;
	input [5:0] opcode;
	input [15:0] immed ;
	input [2:0] ctl;
	input BNE;
	output [31:0] result ;
	output zero;

	wire [5:0] func;
//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SLL  : 00
//   SLT  : 42
//   MULTU : 25

wire [31:0] temp ;

parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

parameter SLL = 6'b000000;

parameter MULU= 6'b011011;
parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;
/*
定義各種訊號
*/
//============================
wire [5:0]  SignaltoALU ;
wire [5:0]  SignaltoSHT ;
wire [5:0]  SignaltoMUL ;
wire [5:0]  SignaltoMUX ;
wire [31:0] ALUOut, HiOut, LoOut, ShifterOut ;
wire [31:0] dataOut ;
wire [63:0] MulAns ;
/*
定義各種接線
*/
//============================

	assign func = immed[5:0];
	
	alu ALU(a, b, ctl, ALUOut, zero, BNE);
	Shifter Shifter(b, immed[10:6], func, ShifterOut);

	assign result = (func == 6'b0) ? ShifterOut : 
					 ALUOut;

endmodule