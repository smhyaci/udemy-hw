`timescale 1ns / 1ps  // = 10^3 => 3 decimal digits

module timescale_directives ();

  //global signal
  reg clk = 1'b0;
  reg clk16 = 1'b0;

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
