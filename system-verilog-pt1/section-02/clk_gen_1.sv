`timescale 1ns / 1ps  // = 10^3 => 3 decimal digits

module clk_gen_1 ();

  reg ref_clk = 0;
  reg clk = 0;

  always #5 ref_clk = ~ref_clk;


  task automatic clk_gen(input real phase, input real t_on, input real t_off);
    #phase;
    while (1) begin
      clk = 1;
      #t_on;
      clk = 0;
      #t_off;
    end
  endtask

  initial begin
    clk_gen(7, 5, 5);
  end

  initial begin
    #200;
    $finish();
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule
