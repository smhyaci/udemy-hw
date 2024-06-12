`timescale 1ns / 1ps

module compare;

  int a[5] = '{1, 2, 3, 4, 5};
  int b[5] = '{1, 2, 3, 4, 5};

  int status;

  initial begin
    status = (a != b);
    $display("status = %0d", status);
  end

endmodule
