`timescale 1ns/1ns
module HiLo( clk, MulAns, HiOut, LoOut, reset );
input clk ;
input reset ;
input [63:0] MulAns ;
output [31:0] HiOut ;
output [31:0] LoOut ;

reg [63:0] HiLo ;

always@( posedge clk or reset )
begin
  if ( reset )
  begin
    HiLo = 64'b0 ;
  end
  
/*
reset訊號 如果是reset就做歸0
*/

  else
  begin
    HiLo = MulAns ;
  end
/*
把傳入的除法答案存起來
*/
end

assign HiOut = HiLo[63:32] ;
assign LoOut = HiLo[31:0] ;
endmodule
