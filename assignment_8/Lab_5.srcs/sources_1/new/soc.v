module soc (
    input clk, rst
);
    wire [31:0] d_mem_data, fact_data, gpio_data, read_data, write_data, pc, instruction;
    wire [11:2] address;
    wire we, we2, we1, wem;
    wire [1:0]  RdSel;
    
    dmem data_memory(
        .clk(clk), .a(address[7:2]), .d(write_data), .we(wem),
        .q(d_mem_data)
    );
    imem instruction_memory(
        .a      (pc),
        .y      (instruction)
    );
    
    SingleCycleMips processor(
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
       .wd      (write_data[3:0]),
       .gpI1    (), //not sure but these are in the diagram
       .gpI2    (), //not sure but these are in the diagram
       .rd      (gpio_data)
    );
    
    FactorialAccelerator Fact_Accel(
        .clk    (clk),
        .rst    (rst),
        .we     (we2),
        .a      (address[3:2]), 
        .wd     (write_data[3:0]),
       .rd      (gpio_data)
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