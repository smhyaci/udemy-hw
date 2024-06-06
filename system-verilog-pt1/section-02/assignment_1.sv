`timescale 1ns / 1ps

module assignment_1 ();

  reg  ref_clk;
  reg  clk;

  real ton;
  real toff;


  initial begin
    ref_clk = 1'b0;
    clk = 1'b0;
    clk_gen(40, 0.4);
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #200;
    $finish;
  end

  always #5 ref_clk = ~ref_clk;

  task automatic clk_gen(input real i_period, input real i_duty);
    begin

      ton  = i_duty * i_period;
      toff = i_period - ton;

      @(posedge ref_clk) begin
        forever begin
          clk = ~clk;
          #ton;
          clk = ~clk;
          #toff;
        end
      end
    end
  endtask

endmodule
