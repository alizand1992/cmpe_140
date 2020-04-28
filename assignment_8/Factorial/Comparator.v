module comparator #(parameter width = 4)(a,b,lt);
input [width-1:0] a,b;
output lt;
assign lt = (a > b) ? 1:0;
endmodule