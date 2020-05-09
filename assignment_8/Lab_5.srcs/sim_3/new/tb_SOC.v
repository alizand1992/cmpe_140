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
        clk = 1'b0;
        rst = 1'b0;
        gpI1 = {27'b0,5'b00110};//6
        reset;
        while(pc != 32'h44) tick;
        
        gpI1 = {27'b0,5'b01101};//13
        tick;
        while(pc != 32'h44) tick;
        
        gpI1 = {27'b0,5'b01100};//12
        tick;
        while(pc != 32'h44) tick;
        $finish;
    end

endmodule