module Onebit(cout, sum, a, b, cin, bInvert, ctl);

	input a, b;
	input cin, bInvert;
	input [2:0] ctl;
	output cout, sum;

	wire bi, s;
	wire e1, e2, e3; // e1=and e2=or 

    reg temp[5:0] ;
	
	
	xor(bi, b, bInvert);
	and(e1, a, b);
	or(e2, a, b);

	FA totalfa(cout, s, a, bi, cin);

	assign sum = (ctl == 3'b000)?e1: // AND
				 (ctl == 3'b001)?e2: // OR
				  s; // ADD SUB SLT

endmodule

