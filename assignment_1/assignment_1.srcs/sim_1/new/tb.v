`timescale 1ns / 1ps

module tb;
    integer errors, i;

    reg[31:0] exp;
    reg[3:0] n, temp;
    reg go, clk;
    
    wire error, done;
    wire[31:0] out;
    
    CU_DP DUT(.n(n), .clk(clk), .go(go), .done(done), .error(error), .factorial(out));

//    task comp_factorial; 
//        begin
//            exp = 1;
//            temp = n;
//            while(temp > 1) begin
//                exp = exp * temp;
//                temp = temp - 1;
//            end
//        end
//    endtask

    initial begin
        clk = 0;
        go = 1;
        errors = 0;
    
        i = 3;
        n = i;
        #100;

//        for (i = 3; i >= 0; i = i - 1) begin
////            comp_factorial();
//            #50;
//            if (out != exp) begin
//                errors = errors + 1;
//                $display("Error: Expected %d, got %d", exp, out);
//            end
//        end
        
        if (errors == 0) begin
            $display("There were %d errors", errors);
        end else begin
            $display("SUCCESS: There were no errors.");        
        end
    end
    
    always #5 clk = !clk;
endmodule
