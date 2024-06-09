`timescale 1ns / 1ps

module quiz_1 ();

  //globals
  reg clk;
  reg resetn;

  initial begin
    clk = 1'b0;
    resetn = 1'b0;
  end

  initial begin
    #60;
    resetn = 1'b1;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule
