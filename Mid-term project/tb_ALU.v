`timescale 1ns/ 1ns
module tb_ALU();
	reg clk, rst;
	reg[5:0] ctrl;
	reg[31:0] inputA, inputB, ans;
	wire[31:0] out;
	integer fp_r, fp_r_ans, eof;
	
	// 產生時脈，週期：10ns
	initial begin
		clk = 1'b1;
		forever #5 clk = ~clk;
	end
	
	initial begin
		eof = 0;
		rst = 1'b1;
		#10;
		rst = 1'b0;
		/*
			讀取輸入指令，檔名"input.txt"可自行修改
			每一行為一筆輸入
			格式為：控制訊號  InputA  InputB
		*/
		fp_r = $fopen( "input.txt", "r" );
		/*
			讀取答案，檔名"ans.txt"可自行修改
			每一行為一筆正確答案
		*/
		fp_r_ans = $fopen( "ans.txt", "r" );
		/*
			自此開始模擬ALU並比對輸出結果
			如結果正確，將輸出："Correct"
			不正確將輸出執行結果與正確答案
			以上輸出的第一個數字為cycle number
		*/
		$display( "Start\n" );
		eof = $fscanf(fp_r_ans, "%d", ans);
		while( eof != -1 ) begin
			$fscanf(fp_r, "%d%d%d", ctrl, inputA, inputB );
			$write( "%d: Input: ", $time/10 );
			if ( ctrl == 6'd36 ) $write( "AND(%d)", ctrl );
			else if ( ctrl == 6'd37 ) $write( "OR(%d) ", ctrl );
			else if ( ctrl == 6'd32 ) $write( "ADD(%d) ", ctrl );
			else if ( ctrl == 6'd34 ) $write( "SUB(%d) ", ctrl );
			else if ( ctrl == 6'd42 ) $write( "SLT(%d) ", ctrl );
			else if ( ctrl == 6'd0) $write( "SRL(%d) ", ctrl );
			else if ( ctrl == 6'd25) $write( "MUL(%d) ", ctrl );
			$display( "%d%d", inputA, inputB  );
			if ( ctrl == 32'd25) begin
				#320;
				$display( "%d: MUL End\n", $time/10 );
				/*
					除法器執行結束後，答案存至Hi-Lo暫存器
					以下自動產生MFHI, MFLO指令檢查除法運算結果
				*/
				
				$display( "                   Move Hi" );
				ctrl = 6'd16;
				#10;
				if ( ans == out )
					$display( "%d: Correct: Your answer is:%d,\n                                 Correct answer is:%d\n", $time/10, out, ans );
				else
					$display( "%d: Wrong Answer: Your answer is:%d,\n                                             Correct answer is:%d\n", $time/10, out, ans );
				$display( "                   Move Lo" );
				ctrl = 6'd18;
				eof = $fscanf(fp_r_ans, "%d", ans);
				#10;
				if ( ans == out )
					$display( "%d: Correct: Your answer is:%d,\n                                 Correct answer is:%d\n", $time/10, out, ans );
				else
					$display( "%d: Wrong Answer: Your answer is:%d,\n                                             Correct answer is:%d\n", $time/10, out, ans );
			end
			else begin
				#10;
				if ( ans == out )
					$display( "%d: Correct: Your answer is:%d,\n                                 Correct answer is:%d\n", $time/10, out, ans );
				else
					$display( "%d: Wrong Answer: Your answer is:%d,\n                                             Correct answer is:%d\n", $time/10, out, ans );
			end
			eof = $fscanf(fp_r_ans, "%d", ans);
		end
		$fclose( fp_r );
		$fclose( fp_r_ans );
		$display( "Simulation End\n" );
		$stop();
	end

	TotalALU alu( .clk(clk), .reset(rst), .dataA(inputA), 
				  .dataB(inputB), .Signal(ctrl), .Output(out) );

endmodule 

/*
	AND  : 36
	OR   : 37
	ADD  : 32
	SUB  : 34
	SLT  : 42
	SRL  : 02
	DIVU : 27
*/