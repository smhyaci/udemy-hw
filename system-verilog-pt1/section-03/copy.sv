`timescale 1ns / 1ps

module copy;

  int a[5];
  int b[5];

  initial begin
    for (int i = 0; i < 5; i++) begin
      a[i] = 5 * i;
    end
    b = a;
    $display("b = {%0p}", b);
  end

endmodule
