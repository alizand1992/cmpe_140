module tb_fpga_top;

    reg clk, rst, sw4, sw3, sw2, sw1, sw0, button_clk;
    wire ld4, ld3, ld2, ld1, ld0;
    wire [3:0] ledsel;
    wire [7:0] ledout;
    
    fpga_top DUT (
        .clk(clk), .rst(rst), .sw4(sw4), .sw3(sw3), .sw2(sw2), .sw1(sw1), .sw0(sw0), .button_clk(button_clk),
        .ld4(ld4), .ld3(ld3), .ld2(ld2), .ld1(ld1), .ld0(ld0),
        .LEDSEL(ledsel), .LEDOUT(ledout)
    );

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
    
    initial begin
        clk = 1'b0;
        rst = 1'b0;
        reset;

        $finish;
    end

endmodule