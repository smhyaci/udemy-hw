`timescale 1ns / 1ps

module assignment_2;

  reg [8:0] a = 12;
  reg [8:0] b = 34;
  integer c = 67;
  integer d = 255;

  initial begin
    #12;
    $display("a = %0d", a);
    $display("b = %0d", b);
    $display("c = %0d", c);
    $display("d = %0d", d);
  end
endmodule
