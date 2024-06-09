`timescale 1ns / 1ps

module always_block ();

  // clk1 = 100 MHz => 10ns => half T = 5ns
  // clk2 = 50 MHz  => 20ns => half T = 10ns
  // clk3 = 25 MHz  => 40ns => half T = 20ns

  //global signal

  reg clk;  // defaults to X
  reg clk50;
  reg clk25;
  reg rst;

  reg [3:0] temp;

  initial begin
    clk   = 1'b0;
    clk50 = 1'b0;
    clk25 = 1'b0;
    rst   = 1'b0;
  end

  // should pair empty always block with a defined finish
  always #5 clk = ~clk;  // 100 MHz
  always #10 clk50 = ~clk50;  // 50 MHz
  always #20 clk25 = ~clk25;  // 25 MHz

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
