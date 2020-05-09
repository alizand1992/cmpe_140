module fpga_top(
    input wire clk, rst, sw4, sw3, sw2, sw1, sw0, button_clk,
    output wire ld4, ld3, ld2, ld1, ld0,
    output wire [3:0] LEDSEL,
    output wire [7:0] LEDOUT
);

    wire clk_5KHz, clk_sec, clk_pb;
    wire [31:0] gpo1, gpo2, pc;
    wire [15:0] hex;


    clk_gen clk_gen (
        .clk100MHz(clk), .rst(rst),
        .clk_4sec(clk_sec), .clk_5KHz(clk_5KHz)
    );
    
    button_debouncer bd (
            .clk                (clk_5KHz),
            .button             (button_clk),
            .debounced_button   (clk_pb)
        );
    
    soc soc(
        .clk(clk_sec), .rst(rst), 
        .gpI1({27'b0, sw4, sw3, sw2, sw1, sw0}),
        .gpI2(gpo1),
        
        .gpO2(gpo2), .gpO1(gpo1), .pc(pc)
    );
        
    mux2 #(16) gpo_mux (
        .sel(gpo1[4]), .a(gpo2[15:0]), .b(gpo2[31:16]),
        .y(hex)    
    );
    
    disp_driver disp_driver (
        .clk(clk_5KHz), .rst(rst),
        .hex3(hex[15:12]), .hex2(hex[11:8]), .hex1(hex[7:4]), .hex0(hex[3:0]),
         
        .an(LEDSEL), .sseg(LEDOUT)
    );
    
    assign ld4 = gpo1[0];
    assign ld3 = gpo1[1];
    assign ld2 = gpo1[1];
    assign ld1 = gpo1[1];
    assign ld0 = gpo1[1]; 
    
endmodule
