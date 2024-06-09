`timescale 1ps / 1ps

module quiz_2 ();

  reg clk;

  initial begin
    clk = 1'b0;
  end

  always #20000 clk = ~clk;

  initial begin
    #200;
    $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule
