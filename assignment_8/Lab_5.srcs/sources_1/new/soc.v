module soc (
    input clk, rst,
    input [31:0] address, write_data
);
    wire [31:0] d_mem_data, fact_data, gpio_data, read_data;
    wire we2, we1, wem;
    
    dmem data_memory(
        .clk(clk), .a(address[7:2]), .d(write_data), .we(wem),
        .q(d_mem_data)
    );
    
    GPIO gpio (
       .clk(clk), .rst(rst), .we(we2), .a(address[3:2]), .wd(write_data[3:0]),
       .rd(gpio_data)
    );
    
    mux4 #(32) data_mux(
        .a(d_mem_data), .b(d_mem_data), .c(fact_data), .d(gpio_data),
        .y(read_data)
    );

endmodule