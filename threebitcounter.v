module threebitcounter (clk,reset, C0,C1,C2, zero_count);
input reset,clk;
output C1, C2, C0, zero_count;

wire D0,D1,D2;
assign D2 = !C0 & !C1 & !C2 | C0 & !C1 & C2;
assign D1 = C0 & C1 & !C2 | !C0 & !C1 & C2;
assign D0 = !C0 & !C1 & !C2 | !C0 & C1 & !C2 | !C0 & !C1 & C2;
assign zero_count = !C0 & !C1 & !C2;

dff1(D2,reset,clk,C2,Qnot);
dff1(D1,reset,clk,C1,Qnot);
dff1(D0,reset,clk,C0,Qnot);

endmodule
