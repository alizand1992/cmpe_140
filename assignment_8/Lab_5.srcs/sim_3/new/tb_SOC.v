module tb_SOC;

    reg         clk, rst;
    wire [31:0] gpI2, gpO1, gpO2, pc;
    reg [31:0] gpI1;
    
    soc DUT (
            .clk        (clk),
            .rst        (rst),
            .gpI1       (gpI1),
            .gpI2       (gpI2),
            .gpO1       (gpO1),
            .gpO2       (gpO2),
            .pc         (pc)
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
    
    assign gpI2 = gpO1;
    
    initial begin
        reset;
        gpI1 = {27'b0,5'b00100};
        while(pc != 32'h48) tick;
        $finish;
    end

endmodule