/*
`timescale 1ns/1ns
module FA(cout, sum, dataA, dataB, cin);

input dataA, dataB, cin;
output cout, sum;

wire e1, e2, e3, e4;

or(e4, dataA, dataB); // cout
and(e2, dataA, dataB);
and(e3, e4, c);
or(cout,e2, e3);

xor(e1, dataA, dataB); // sum
xor(sum, e1, cin);


endmodule
*/
`timescale 1ns/1ns
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

