module IF_ID(clk, rst,inpc ,ininstr, outpc, outinstr);
	input clk, rst;
	input [31:0] inpc, ininstr ;
	output [31:0] outpc, outinstr ;
	reg [31:0] outpc, outinstr ;

	
	always @( posedge clk ) begin
		if (rst) begin
			outpc <= 32'b0;
			outinstr <= 32'b0;
		end
		else begin
			outpc <= inpc ;
			outinstr <= ininstr ;
		end
	end
		
endmodule