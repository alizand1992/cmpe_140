module GPIO (
    input clk, rst, we,
    input [1:0] a,
    input [31:0] wd, gpI1, gpI2,
    output [31:0] gpO1, gpO2, rd
);

    wire        We2;
    wire        We1;
    wire [1:0]  RdSel;
    wire [31:0] gpio1;
    wire [31:0] gpio2;
    
    gpio_ad decoder(
        .A      (a),
        .WE     (we),
        .WE1    (We1),
        .WE2    (We2),
        .RdSel  (RdSel)
    );

    Gate #(32) GPIO1(
        .clk    (clk),
        .en     (We1),
        .i      (wd),
        .o      (gpio1)
    );
    
    Gate #(32) GPIO2(
        .clk    (clk),
        .en     (We2),
        .i      (wd),
        .o      (gpio2)
    );

mux4 #(32) data_mux(
        .sel    (RdSel),
        .a      (gpI1), 
        .b      (gpI2), 
        .c      (gpio1), 
        .d      (gpio2),
        .y      (rd)
    );
    
    assign gpO1 = gpio1;
    assign gpO2 = gpio2;

endmodule