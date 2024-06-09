`timescale 1ns / 1ps  // = 10^3 => 3 decimal digits

module clk_gen_final ();

  reg  ref_clk = 0;
  reg  clk = 0;

  real phase;
  real t_on;
  real t_off;

  always #5 ref_clk = ~ref_clk;


  task automatic calc(input real freq_hz, input real duty, input real phase, output real pout,
                      output real t_on, output real t_off);

    pout  = phase;
    t_on  = (1.0 / freq_hz) * duty * 1000_000_000;
    t_off = (1000_000_000 / freq_hz) - t_on;

  endtask

  task automatic clk_gen(input real phase, input real t_on, input real t_off);

    @(posedge ref_clk);
    #phase;
    while (1) begin
      clk = 1;
      #t_on;
      clk = 0;
      #t_off;
    end
  endtask

  initial begin
    calc(1000_000_000, 0.3, 0, phase, t_on, t_off);
    clk_gen(phase, t_on, t_off);
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
