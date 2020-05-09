module soc (
    input clk, rst,
    input [31:0] gpI1, gpI2,
    output [31:0] gpO1, gpO2, pc
);
    wire [31:0] d_mem_data, fact_data, gpio_data, read_data, write_data, instruction, address;
    wire we, we2, we1, wem;
    wire [1:0]  RdSel;
    
    dmem data_memory(
        .clk    (clk), 
        .a      (address[7:2]), 
        .d      (write_data), 
        .we     (wem),
        .q      (d_mem_data)
    );
    
    main_ad AD(
        .A      (address[11:2]),
        .WE     (we),
        .WE1    (we1),
        .WE2    (we2),
        .WEM    (wem),
        .RdSel  (RdSel)
    );
    
    imem instruction_memory(
        .a      (pc[7:2]),
        .y      (instruction)
    );
    
    PilelinedProcessor processor(
        .clk    (clk),
        .rst    (rst),
        .instr  (instruction),
        .rd     (read_data),
        .we     (we),
        .addr   (address),
        .pc     (pc),
        .wd     (write_data)
    );
    
    GPIO gpio (
       .clk     (clk),
       .rst     (rst), 
       .we      (we2), 
       .a       (address[3:2]), 
       .wd      (write_data),
       .gpI1    (gpI1),
       .gpI2    (gpI2),
       .gpO1    (gpO1),
       .gpO2    (gpO2),
       .rd      (gpio_data)
    );
    
    FactorialAccelerator Fact_Accel(
        .clk    (clk),
        .rst    (rst),
        .we     (we1),
        .a      (address[3:2]), 
        .wd     (write_data[3:0]),
       .rd      (fact_data)
    );
    
    mux4 #(32) data_mux(
        .sel    (RdSel),
        .a      (d_mem_data), 
        .b      (d_mem_data), 
        .c      (fact_data), 
        .d      (gpio_data),
        .y      (read_data)
    );

endmodule