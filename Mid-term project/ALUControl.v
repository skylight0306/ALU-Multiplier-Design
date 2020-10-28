`timescale 1ns/1ns
module ALUControl( clk, Signal, SignaltoALU, SignaltoSHT, SignaltoMUL, SignaltoMUX );
input clk ;
input [5:0] Signal ;
output [5:0] SignaltoALU ;
output [5:0] SignaltoSHT ;
output [5:0] SignaltoMUL ;
output [5:0] SignaltoMUX ;

//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SLL  : 00
//   SLT  : 42
//   DIVU : 27


reg [5:0] temp ;
reg [5:0] SignaltoALU;
reg [5:0] SignaltoSHT;
reg [5:0] SignaltoMUL;
reg [5:0] SignaltoMUX;
reg [6:0] counter ;


parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

parameter SLL = 6'b000000;

parameter MUL= 6'b011011;
parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;
/*
定義各種訊號
*/

/*
=====================================================
下面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/
always@( Signal )
begin
  if ( Signal == MUL )
  begin
    counter = 0 ;
  end
/*
如果訊號改變成除法 就把counter歸0
*/
end

always@( posedge clk )
begin
  temp = Signal ;
  if ( Signal == MUL )
  begin
    counter = counter + 1 ;
    if ( counter == 32 )
    begin
      temp = 6'b111111 ; // Open HiLo reg for Div
      counter = 0 ;
    end
  end
/*
  case ( Signal )
    AND:  temp = 6'b000000 ;
    OR:   temp = 6'b000001 ;
    ADD:  temp = 6'b000010 ;
    SUB:  temp = 6'b000110 ;
    SLT:  temp = 6'b000111 ;
	default temp = temp ;
  endcase
*/	
  SignaltoALU = temp ;
  SignaltoSHT = temp ;
  SignaltoMUL = temp ;
  SignaltoMUX = temp ;

end

endmodule