module FA(cout, s, a, b, cin);

	input a, b, cin;
	output cout, s;
		
	wire   e1, e2, e3, e4;

	// cout
	or(e1, a, b);
	and(e2, e1, cin);
	and(e3, a, b);
	or(cout, e2, e3);

	// sum
	xor(e4, a, b);
	xor(s, cin, e4);	

endmodule

