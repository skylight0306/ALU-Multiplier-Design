`timescale 1ns/1ns
module ALU( dataA, dataB, Signal, dataOut, reset );

input reset;
input [5:0] Signal;
input [31:0] dataA;
input [31:0] dataB;
output [31:0] dataOut;

wire Binvert, set;
wire [31:0] c, sum;

assign Binvert = (Signal == 6'b101010 || Signal == 6'b100010 )?1'b1: // SUB SLT
				  1'b0;
				  
OneBit bit0(.cout(c[0]), .sum(sum[0]), .dataA(dataA[0]), .dataB(dataB[0]), .cin(Binvert), .Binvert(Binvert), .Signal(Signal), .less(set) );
OneBit bit1(.cout(c[1]), .sum(sum[1]), .dataA(dataA[1]), .dataB(dataB[1]), .cin(c[0]), .Binvert(Binvert), .Signal(Signal) , .less(1'b0));
OneBit bit2(.cout(c[2]), .sum(sum[2]), .dataA(dataA[2]), .dataB(dataB[2]), .cin(c[1]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit3(.cout(c[3]), .sum(sum[3]), .dataA(dataA[3]), .dataB(dataB[3]), .cin(c[2]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit4(.cout(c[4]), .sum(sum[4]), .dataA(dataA[4]), .dataB(dataB[4]), .cin(c[3]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit5(.cout(c[5]), .sum(sum[5]), .dataA(dataA[5]), .dataB(dataB[5]), .cin(c[4]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit6(.cout(c[6]), .sum(sum[6]), .dataA(dataA[6]), .dataB(dataB[6]), .cin(c[5]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit7(.cout(c[7]), .sum(sum[7]), .dataA(dataA[7]), .dataB(dataB[7]), .cin(c[6]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit8(.cout(c[8]), .sum(sum[8]), .dataA(dataA[8]), .dataB(dataB[8]), .cin(c[7]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit9(.cout(c[9]), .sum(sum[9]), .dataA(dataA[9]), .dataB(dataB[9]), .cin(c[8]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit10(.cout(c[10]), .sum(sum[10]), .dataA(dataA[10]), .dataB(dataB[10]), .cin(c[9]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit11(.cout(c[11]), .sum(sum[11]), .dataA(dataA[11]), .dataB(dataB[11]), .cin(c[10]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit12(.cout(c[12]), .sum(sum[12]), .dataA(dataA[12]), .dataB(dataB[12]), .cin(c[11]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit13(.cout(c[13]), .sum(sum[13]), .dataA(dataA[13]), .dataB(dataB[13]), .cin(c[12]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit14(.cout(c[14]), .sum(sum[14]), .dataA(dataA[14]), .dataB(dataB[14]), .cin(c[13]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit15(.cout(c[15]), .sum(sum[15]), .dataA(dataA[15]), .dataB(dataB[15]), .cin(c[14]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit16(.cout(c[16]), .sum(sum[16]), .dataA(dataA[16]), .dataB(dataB[16]), .cin(c[15]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit17(.cout(c[17]), .sum(sum[17]), .dataA(dataA[17]), .dataB(dataB[17]), .cin(c[16]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit18(.cout(c[18]), .sum(sum[18]), .dataA(dataA[18]), .dataB(dataB[18]), .cin(c[17]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit19(.cout(c[19]), .sum(sum[19]), .dataA(dataA[19]), .dataB(dataB[19]), .cin(c[18]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit20(.cout(c[20]), .sum(sum[20]), .dataA(dataA[20]), .dataB(dataB[20]), .cin(c[19]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit21(.cout(c[21]), .sum(sum[21]), .dataA(dataA[21]), .dataB(dataB[21]), .cin(c[20]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit22(.cout(c[22]), .sum(sum[22]), .dataA(dataA[22]), .dataB(dataB[22]), .cin(c[21]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit23(.cout(c[23]), .sum(sum[23]), .dataA(dataA[23]), .dataB(dataB[23]), .cin(c[22]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit24(.cout(c[24]), .sum(sum[24]), .dataA(dataA[24]), .dataB(dataB[24]), .cin(c[23]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit25(.cout(c[25]), .sum(sum[25]), .dataA(dataA[25]), .dataB(dataB[25]), .cin(c[24]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit26(.cout(c[26]), .sum(sum[26]), .dataA(dataA[26]), .dataB(dataB[26]), .cin(c[25]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit27(.cout(c[27]), .sum(sum[27]), .dataA(dataA[27]), .dataB(dataB[27]), .cin(c[26]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit28(.cout(c[28]), .sum(sum[28]), .dataA(dataA[28]), .dataB(dataB[28]), .cin(c[27]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit29(.cout(c[29]), .sum(sum[29]), .dataA(dataA[29]), .dataB(dataB[29]), .cin(c[28]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit bit30(.cout(c[30]), .sum(sum[30]), .dataA(dataA[30]), .dataB(dataB[30]), .cin(c[29]), .Binvert(Binvert), .Signal(Signal), .less(1'b0));
OneBit_32 bit31(.cout(c[31]), .sum(sum[31]), .dataA(dataA[31]), .dataB(dataB[31]), .cin(c[30]), .Binvert(Binvert), .Signal(Signal), .less(1'b0), .set(set) );


assign dataOut = (Signal == 6'b101010)?set: // SLT
			                            sum[31:0];



endmodule
