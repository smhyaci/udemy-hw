`timescale 1ns / 1ps

module assignment_a53;

  bit clk;
  bit [5:0] addr;
  bit wr;
  bit en;

  bit [5:0] q_addr[$];
  bit q_wr[$];
  bit q_en[$];

  always #40 clk = ~clk;

  task automatic stim_mem();
    @(posedge clk);
    addr = q_addr.pop_front();
    wr   = q_wr.pop_front();
    en   = q_en.pop_front();
    $display("%0t:\t\taddr = %0d\t\twr = %0d\t\ten = %0d", $time, addr, wr, en);
  endtask

  always begin
    stim_mem();
  end

  initial begin
    q_addr = {12, 14, 23, 48, 56};
    q_wr   = {1, 1, 0, 0, 0};
    q_en   = '{5{1}};
    #440;
    $finish();
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end


endmodule
