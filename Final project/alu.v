module alu(a, b, ctl, result, zero, BNE);

	input [2:0] ctl;
	input [31:0] a, b;
	input BNE;
	output [31:0] result;
	output zero;

	wire [31:0] c, sum;
	wire Binvert;
	assign Binvert = (ctl == 3'b110)? 1'b1: // SUBTRACT
					 (ctl == 3'b111)? 1'b1: // SLT
					  1'b0;
			   
	Onebit bit0(.cout(c[0]), .sum(sum[0]), .a(a[0]), .b(b[0]), .cin(Binvert), .Binvert(Binvert), .ctl(ctl));
	Onebit bit1(.cout(c[1]), .sum(sum[1]), .a(a[1]), .b(b[1]), .cin(c[0]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit2(.cout(c[2]), .sum(sum[2]), .a(a[2]), .b(b[2]), .cin(c[1]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit3(.cout(c[3]), .sum(sum[3]), .a(a[3]), .b(b[3]), .cin(c[2]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit4(.cout(c[4]), .sum(sum[4]), .a(a[4]), .b(b[4]), .cin(c[3]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit5(.cout(c[5]), .sum(sum[5]), .a(a[5]), .b(b[5]), .cin(c[4]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit6(.cout(c[6]), .sum(sum[6]), .a(a[6]), .b(b[6]), .cin(c[5]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit7(.cout(c[7]), .sum(sum[7]), .a(a[7]), .b(b[7]), .cin(c[6]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit8(.cout(c[8]), .sum(sum[8]), .a(a[8]), .b(b[8]), .cin(c[7]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit9(.cout(c[9]), .sum(sum[9]), .a(a[9]), .b(b[9]), .cin(c[8]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit10(.cout(c[10]), .sum(sum[10]), .a(a[10]), .b(b[10]), .cin(c[9]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit11(.cout(c[11]), .sum(sum[11]), .a(a[11]), .b(b[11]), .cin(c[10]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit12(.cout(c[12]), .sum(sum[12]), .a(a[12]), .b(b[12]), .cin(c[11]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit13(.cout(c[13]), .sum(sum[13]), .a(a[13]), .b(b[13]), .cin(c[12]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit14(.cout(c[14]), .sum(sum[14]), .a(a[14]), .b(b[14]), .cin(c[13]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit15(.cout(c[15]), .sum(sum[15]), .a(a[15]), .b(b[15]), .cin(c[14]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit16(.cout(c[16]), .sum(sum[16]), .a(a[16]), .b(b[16]), .cin(c[15]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit17(.cout(c[17]), .sum(sum[17]), .a(a[17]), .b(b[17]), .cin(c[16]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit18(.cout(c[18]), .sum(sum[18]), .a(a[18]), .b(b[18]), .cin(c[17]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit19(.cout(c[19]), .sum(sum[19]), .a(a[19]), .b(b[19]), .cin(c[18]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit20(.cout(c[20]), .sum(sum[20]), .a(a[20]), .b(b[20]), .cin(c[19]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit21(.cout(c[21]), .sum(sum[21]), .a(a[21]), .b(b[21]), .cin(c[20]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit22(.cout(c[22]), .sum(sum[22]), .a(a[22]), .b(b[22]), .cin(c[21]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit23(.cout(c[23]), .sum(sum[23]), .a(a[23]), .b(b[23]), .cin(c[22]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit24(.cout(c[24]), .sum(sum[24]), .a(a[24]), .b(b[24]), .cin(c[23]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit25(.cout(c[25]), .sum(sum[25]), .a(a[25]), .b(b[25]), .cin(c[24]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit26(.cout(c[26]), .sum(sum[26]), .a(a[26]), .b(b[26]), .cin(c[25]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit27(.cout(c[27]), .sum(sum[27]), .a(a[27]), .b(b[27]), .cin(c[26]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit28(.cout(c[28]), .sum(sum[28]), .a(a[28]), .b(b[28]), .cin(c[27]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit29(.cout(c[29]), .sum(sum[29]), .a(a[29]), .b(b[29]), .cin(c[28]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit30(.cout(c[30]), .sum(sum[30]), .a(a[30]), .b(b[30]), .cin(c[29]), .Binvert(Binvert), .ctl(ctl));
	Onebit bit31(.cout(c[31]), .sum(sum[31]), .a(a[31]), .b(b[31]), .cin(c[30]), .Binvert(Binvert), .ctl(ctl));

	assign result = (ctl == 3'b111) ? {31'b0, sum[31]} : sum;

	assign zero = (result == 32'b0 && BNE == 1'b0) ? 1'b1 : // result 為0且不做BNE
	              (result != 32'b0 && BNE == 1'b1) ? 1'b1 : // result 不為0且BNE
				  1'b0;
										 

endmodule