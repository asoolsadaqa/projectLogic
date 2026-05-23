module ledr(
	input clk, restart,
    output onA,onH,C0,C1,C2);

threebitcounter (clk,restart, C0,C1,C2, zero_count);
fulladder(sum, cout,zero_count,Q,0);
dff1(sum,restart,clk,Q,Qnot);
assign onH = sum;
assign onA = ~onH;

endmodule

module ledg(
