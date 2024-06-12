`timescale 1ns / 1ps

module assignment_4;
  reg [31:0] a[15];
  reg [31:0] b[15];

  initial begin
    for (int i = 0; i < 15; i++) begin
      a[i] = $urandom();
      b[i] = $urandom();
    end
    $display("a = {%0p}", a);
    $display("b = {%0p}", b);
  end

endmodule
