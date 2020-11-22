module mux2X1( in0,in1,sel,out,signal);
input in0,in1;
input sel;
output out;
input [5:0]signal;

assign out=(sel==1'b1&&signal == 6'b000000)?in1:in0;

endmodule