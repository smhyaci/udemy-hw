`timescale 1ns / 1ps

module task_ex;

  bit [3:0] a, b;
  bit [4:0] y;
  bit clk = 0;
  always #5 clk = ~clk;

  // default if not specified is input for parameters
  task automatic add(input bit [3:0] a, input bit [3:0] b, output bit [4:0] y);
    y = a + b;
  endtask

  task automatic add2();
    y = a + b;
    $display("%0t\t\t:a = %0d\t\t b = %0d\t\t y = %0d", $time, a, b, y);
  endtask

  task automatic stim_a_b();
    a = 1;
    b = 3;
    add2();
    #10;
    a = 5;
    b = 6;
    add2();
    #10;
    a = 3;
    b = 5;
    add2();
    #10;
  endtask

  task automatic stim_clk();
    @(posedge clk);  // wait
    a = $urandom();  // automatically constrains to fit width of a & b
    b = $urandom();
    add2();
  endtask


  initial begin
    for (int i = 0; i < 11; i++) begin
      stim_clk();
    end
  end

  initial begin
    #110;
    $finish();
  end

endmodule
