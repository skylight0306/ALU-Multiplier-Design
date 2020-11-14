`timescale 1ns/1ns
module TotalALU( clk, dataA, dataB, Signal, Output, reset );
input reset ;
input clk ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [31:0] Output ;

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

ALUControl ALUControl( .clk(clk), .Signal(Signal), .SignaltoALU(SignaltoALU), .SignaltoSHT(SignaltoSHT), .SignaltoMUL(SignaltoMUL), .SignaltoMUX(SignaltoMUX) );
ALU ALU( .dataA(dataA), .dataB(dataB), .Signal(SignaltoALU), .dataOut(ALUOut), .reset(reset) );

Multipler Multipler( .clk(clk), .reset(reset), .dataA(dataA), .dataB(dataB), .dataOut(MulAns), .Signal( SignaltoMUL ) ) ;
Shifter Shifter( .dataA(dataA), .dataB(dataB), .Signal(SignaltoSHT), .dataOut(ShifterOut), .reset(reset) );
HiLo HiLo( .clk(clk), .MulAns(MulAns), .HiOut(HiOut), .LoOut(LoOut), .reset(reset) );
MUX MUX( .ALUOut(ALUOut), .HiOut(HiOut), .LoOut(LoOut), .Shifter(ShifterOut), .Signal(SignaltoMUX), .dataOut(dataOut) );
/*
建立各種module
*/
assign Output = dataOut ;


endmodule