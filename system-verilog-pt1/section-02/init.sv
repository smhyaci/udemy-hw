`timescale 1ns  1ps

module tb();
  
  global signal clk, rst
  reg clk;
  reg rst;  
  
  reg [30] temp;
  
   //1. used to init global variables
  initial begin
    clk = 1'b0;
    rst = 1'b0;
  end
  
   //2. generate random signals for controldata
  initial begin
    rst = 1'b1;
    #30;
    rst = 1'b0;
  end
  
  initial begin
    temp = 4'b0100;
    #10;  10 ns - based on the numerator of the timescale
    temp = 4'b1100;
    #10; 
    temp = 4'b0011;
    #10;
  end
  
  // 3. run system tasks at start of sim
  initial begin
    $dumpfile(dump.vcd);
    $dumpvars;
  end
  
   //4. analyze value of variable
  initial begin
     $monitor(Temp %0d at time  %0t, temp, $time);
  end

   //5. stop simulatution forcefully
  initial begin
    #200;
    $finish();
  end
  
endmodule