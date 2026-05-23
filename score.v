module score(reset,clk,H0,H1,H2,H3,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7);
input reset,clk,H0,H1,H2,H3;
output Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
wire D0,D1,D2,D3,D4,D5,D6,D7,A0,A1;

assign A0 = (H1 | H3) &(~reset);
assign A1 = (H2 |H3) &(~reset);

fulladder (D0, cout0, Q0, A0, 0);
fulladder (D1, cout1, Q1, A1, cout0);
fulladder (D2, cout2, Q2 ,0, cout1);
fulladder (D3, cout3, Q3 ,0, cout2);
fulladder (D4, cout4, Q4 ,0, cout3);
fulladder (D5, cout5, Q5 ,0, cout4);
fulladder (D6, cout6, Q6 ,0, cout5);
fulladder (D7, cout7, Q7 ,0, cout6);

dff1 (D0,reset,clk,Q0,Qnot0);
dff1 (D1,reset,clk,Q1,Qnot1);
dff1 (D2,reset,clk,Q2,Qnot2);
dff1 (D3,reset,clk,Q3,Qnot3);
dff1 (D4,reset,clk,Q4,Qnot4);
dff1 (D5,reset,clk,Q5,Qnot5);
dff1 (D6,reset,clk,Q6,Qnot6);
dff1 (D7,reset,clk,Q7,Qnot7);

endmodule

module fulladder(sum, cout,x,y,cin);
output sum, cout;
input x,y,cin;
	
assign sum = x^y^cin;
assign cout = x&y | x&cin | y&cin;

endmodule
