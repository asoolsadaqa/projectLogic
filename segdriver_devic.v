module segdriver_devic (A,B,C,D,a,b,c,d,e,f,g);
input A,B,C,D;
output a,b,c,d,e,f,g;

assign a = ~A|(~B&C)| (A&~B&~C)| (A&~B&C);
assign b = ~A| (A&~B&~C) | (A&~B&C);
assign c = ~A|(B&~C)| (A&~B&~C)| (A&~B&C);
assign d =  ~A|(~B&C)| (A&~B&~C)| (A&~B&C);
assign e = ~A |C| (A&~B&~C)| (A&~B&C);
assign f = ~A|B|C| (A&~B&~C)| (A&~B&C);
assign g = A&~B| (A&~B&~C)| (A&~B&C);

endmodule
