module disp_driver(
    input clk, rst, 
    input[3:0] hex3, hex2, hex1, hex0, dp_in,
    
    output [3:0] an, 
    output [7:0] sseg
);
  
    wire [7:0] digit0;
    wire [7:0] digit1;
    wire [7:0] digit2;
    wire [7:0] digit3;
    
    hex_to_7seg hex_0(.HEX(hex0), .s(digit0));
    hex_to_7seg hex_1(.HEX(hex1), .s(digit1));
    hex_to_7seg hex_2(.HEX(hex2), .s(digit2));
    hex_to_7seg hex_3(.HEX(hex3), .s(digit3));

    led_mux led_mux (
        .clk        (clk), 
        .rst        (rst), 
        .LED3       (digit3), 
        .LED2       (digit2), 
        .LED1       (digit1), 
        .LED0       (digit0),
        .LEDSEL     (an), 
        .LEDOUT     (sseg)
    );
    


endmodule
