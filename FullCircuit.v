module FullCircuit(
	input clk, reset,H0,H1,H2,H3,A0,A1,A2,A3,
	output TeamHball, TeamAball,TeamHwins,TeamAwins,
	a0,b0,c0,d0,e0,f0,g0,
	a1,b1,c1,d1,e1,f1,g1,
	a2,b2,c2,d2,e2,f2,g2,
	a3,b3,c3,d3,e3,f3,g3,
	a4,b4,c4,d4,e4,f4,g4
	);
	
counterFiveToZero (clk,reset, C0,C1,C2, zero_count);
segdriver_devic (0,C2,C1,C0,a0,b0,c0,d0,e0,f0,g0);

score scoreH(reset,clk,H0,H1,H2,H3,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7);
score scoreA(reset,clk,A0,A1,A2,A3,R0,R1,R2,R3,R4,R5,R6,R7);

wire [4:0] tensH;
wire [4:0] onesH; 
assign tensH = {Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0} / 10;
assign onesH = {Q7,Q6,Q5,Q4,Q3,Q2,Q1,Q0} % 10;

segdriver_devic (onesH[3],onesH[2],onesH[1],onesH[0],a1,b1,c1,d1,e1,f1,g1);
segdriver_devic (tensH[3],tensH[2],tensH[1],tensH[0],a2,b2,c2,d2,e2,f2,g2);

wire [4:0] tensA;
wire [4:0] onesA;
	
assign tensA = {R7,R6,R5,R4,R3,R2,R1,R0} / 10;
assign onesA = {R7,R6,R5,R4,R3,R2,R1,R0} % 10;

segdriver_devic (onesA[3],onesA[2],onesA[1],onesA[0],a3,b3,c3,d3,e3,f3,g3);
segdriver_devic (tensA[3],tensA[2],tensA[1],tensA[0],a4,b4,c4,d4,e4,f4,g4);

whoWins(clk,reset,H0,H1,H2,H3,A0,A1,A2,A3,TeamHwins, TeamAwins);
ledr (clk, restart, TeamAball,TeamHball);

endmodule