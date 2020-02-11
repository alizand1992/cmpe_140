module cu_tb;
    reg go, clk;
    reg lt1, gt12;
    wire done, error;
    wire [1:0] cs;
    
    CU DUT (
        .clk(clk), .go(go), .lt1(lt1), .gt12(gt12),
        .done(done), .error(error), .cs(cs)
    );
    
    integer count;
    
    initial
    begin
        clk = 0;
        #2;
        go = 1;
        count = 0;
        gt12 = 1;
        lt1 = 0;

        //Otherwise, hold stat
        if (cs != 0)
            count  = count + 1;
        #10
            
        gt12 = 0;
        if (cs != 0)
            count = count + 1;
        #10
        
        if (cs != 1)
            count = count + 1;
        #10
        
        if (cs != 2)
            count = count + 1;
        #10
        
        lt1 = 1;
        if (cs != 0 && done != 1)
            count = count + 1;
            
        $finish;
        
        
    
    end
    
    always
    begin
        clk = #1 ~clk;
    end
    
    
    
endmodule
