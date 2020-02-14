`timescale 1ns / 1ps

module tb;
    integer i, errors;
   
    reg[3:0] n;
    reg go, clk;
    
    wire error, done;
    wire[31:0] out;
    reg[31:0] temp;
    
    CU_DP DUT(.n(n), .clk(clk), .go(go), .done(done), .error(error), .factorial(out));

    task compute_fact;
        while (n > 0) begin
            temp = temp * n;
            n = n - 1;
        end
    endtask
    
    initial begin
        clk = 0;
        
        i = 0;
        errors = 0;
    
        for (i = 0; i < 13; i = i + 1) begin
            go = 1;
            n = i;
            temp = 1;
            #4;
            go = 0;
            while (!done) #1;
            
            compute_fact();
            if (out != temp) begin
                $display("Error: expected %d but got %d", temp, out);
                errors = errors + 1;
             end
        end        
                  
        go = 1;
        n = 13;
        #4;
        go = 0;
        #2;
        
        if (error != 1'b1) begin
            $display("Error: expected error but did not get any");
            errors = errors + 1;
        end

        if (errors > 0) 
            $display("There were %d errors", errors);
        else
            $display("SUCCESS");

        $finish;
    end
    
    always #1 clk = !clk;
endmodule
