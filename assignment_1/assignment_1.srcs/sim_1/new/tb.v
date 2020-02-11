`timescale 1ns / 1ps

module tb;
    integer errors, i;

    reg[31:0] exp;
    reg[3:0] n, temp;
    reg go, clk;
    
    wire error, done;
    wire[31:0] out;
    
    CU_DP DUT(.n(n), .clk(clk), .go(go), .done(done), .error(error), .factorial(out));

    task comp_factorial; 
        begin
            exp = 1;
            temp = n;
            while(temp > 1) begin
                exp = exp * temp;
                temp = temp - 1;
            end
        end
    endtask
    
    initial begin
        comp_factorial();
        clk = 0;
        go = 1;
        errors = 0;
    
        i = 3;
        n = i;
        #4;
        go = 0;
        #20;

        if (errors == 0) begin
            $display("There were %d errors", errors);
        end else begin
            $display("SUCCESS: There were no errors.");        
        end
        
        $finish;
    end
    
    always #1 clk = !clk;
endmodule
