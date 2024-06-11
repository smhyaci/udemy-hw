module array;
  bit a[8];
  bit b[] = {1, 0, 1, 1};

  initial begin
    $display("size of a: %0d", $size(a));
    $display("size of b: %0d", $size(b));

    $display("value of 1st element %0d", a[0]);
    a[1] = 1;
    $display("value of 2nd element %0d", a[1]);

    $display("all values in b: {%0p}", b);
  end

endmodule
