module segdriver_devic (A,B,C,D,a,b,c,d,e,f,g);
input A,B,C,D;
output a,b,c,d,e,f,g;

assign a = ~B&~D | C | B&D | A  ;
assign b = ~B| ~C&~D | C&D;
assign c = B| D| ~C;
assign d = ~B&~D|B&~C&D| ~B&C|A|C&~D;
assign e = ~B&~D|C&~D;
assign f = ~C&~D|A|B&~C|B&~D;
assign g = B&~D | B&~C| ~B&C|A;

endmodule
