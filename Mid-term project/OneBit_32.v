`timescale 1ns/1ns
module OneBit_32(cout, sum, dataA, dataB, cin, Binvert, Signal, less, set);

input dataA, dataB, less;
input cin, Binvert, set;
input [5:0] Signal;
output cout, sum;

wire bi,s;
wire e1, e2, e3; //e1=and e2=or  

reg temp[5:0] ;

xor(bi, dataB, Binvert);
and(e1, dataA, dataB);
or(e2, dataA, dataB);
FA totalfa(cout, s, dataA, bi, cin);
/*
assign sum = (Signal == 6'b000000)?e1: // AND
	     (Signal == 6'b000001)?e2:  // OR
	     (Signal == 6'b000010)?s:    // ADD
	     (Signal == 6'b000110)?s:    // SUB
	     (Signal == 6'b000111)?s:    // SLT
	      s;
*/

assign sum = (Signal == 6'b100100)?e1: // AND
	     (Signal == 6'b100101)?e2:  // OR
	     (Signal == 6'b100000)?s:    // ADD
	     (Signal == 6'b100010)?s:    // SUB
	     (Signal == 6'b101010)?s:    // SLT
	      s;
assign set = s;

endmodule
