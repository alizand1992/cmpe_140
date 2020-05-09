module tb_gpio;

    reg clk, rst, we;
    reg [1:0] a;
    reg [31:0] wd, gpI1, gpI2;
    wire[31:0] gpO1, gpO2, rd;

    task tick; 
    begin 
        clk = 1'b0; #5;
        clk = 1'b1; #5;
    end
    endtask

    task reset;
    begin 
        rst = 1'b0; #5;
        rst = 1'b1; #5;
        rst = 1'b0;
    end
    endtask

    GPIO DUT (
        .clk(clk), .rst(rst), .we(we),
        .a(a), .wd(wd), .gpI1(gpI1), .gpI2(gpI2),

        .gpO1(gpO1), .gpO2(gpO2), .rd(rd)
    );

    initial begin
        clk = 1'b0;
        rst = 1'b0;
        gpI1 = {31'b0, 1'b1};
        gpI2 = {30'b0, 2'b10};
        wd = {29'b0, 3'b100};
        we = 1'b1;

        reset;

        a = 2'b00;
        tick;

        a = 2'b01;
        tick;

        a = 2'b10;
        tick;

        a = 2'b11;
        tick;

        $finish;
    end
endmodule