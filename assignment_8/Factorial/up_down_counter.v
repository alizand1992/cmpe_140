module cnt(
input clk, rst, ld, en,
input [3:0] d,
output reg [3:0] q,
output reg err
);
always @ (d)begin
    if(d > 12) err = 1;
    else err = 0;
end
always @ (posedge clk, posedge rst)
    if (rst)
     q <= 0;
    else if (ld) q <= d;
    else if(en) q <= q - 1;
    else q <= q;
endmodule