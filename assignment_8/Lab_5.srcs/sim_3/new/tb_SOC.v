module tb_SOC;

    reg         clk, rst;
    wire [31:0] gpI1, gpI2, gpO1, gpO2;
    
    soc DUT (
            .clk        (clk),
            .rst        (rst),
            .gpI1       (gpI1),
            .gpI2       (gpI2),
            .gpO1       (gpO1),
            .gpO2       (gpO2)
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
        reset;
        while(pc_current != 32'h58) tick;
        $finish;
    end

endmodule