`timescale 1ns/1ns
module Multipler( clk, reset, dataA, dataB, dataOut, Signal) ;
input [31:0] dataA, dataB;
input clk;
input reset;
input [5:0]Signal ;
output [63:0] dataOut;

reg [31:0] tempE1;
reg [31:0] tempE2;
reg [63:0] temp;
reg [7:0] count; 


initial //初始化
begin
tempE1 = dataA ;
tempE2 = dataB ;
temp = 64'h0;
count = 0;
end


always @( negedge  reset or Signal ) begin
  tempE1 = dataA ;
  tempE2 = dataB ;
  if ( Signal == 6'd25 )
    temp = 64'h0;
  count = 0;
end

always @( posedge clk )
begin
//tempE1 被乘數   tempE2乘數
	if ( reset == 1 )
	begin 
	  tempE1 = dataA ;
      tempE2 = dataB ;
	  temp = 64'h0;
	  count = 0;
	end
	
	else
	begin
	  if ( count < 31 && Signal == 6'd25 ) begin
		if (tempE2[0] == 1 ) 
		begin
		  temp = temp + tempE1;
		end
	
	    
		tempE1 = tempE1 << 1; //左移
		tempE2 = tempE2 >> 1; //右移
		count = count + 1;
	  end
	end
end

//assign dataOut = ( count == 32  )?temp:64'h0;
assign dataOut = temp;

endmodule



