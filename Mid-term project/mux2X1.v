module mux2X1( in0,in1,sel,out,Signal);
input in0,in1;
input sel;
output out;
input [5:0]Signal;

assign out = (sel == 1'b1 && Signal == 6'b000000 )?in1:
	         in0;

endmodule