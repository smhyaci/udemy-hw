`timescale 1ns / 1ps // = 10^3 => 3 decimal digits 

module tb();
   
  //global signal 
  reg clk = 0'b0; 
  reg clk16 = 0'b0;

  always #62.5 clk = ~clk;
  always #31.25 clk16 = ~clk16;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

  // explicit finish
  initial begin
    #200;
    $finish();
  end
  
endmodule