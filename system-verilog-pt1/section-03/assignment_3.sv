`timescale 1ns / 1ps

module assignment_3;
  initial begin
    bit [31:0] arr[10];
    for (integer i = 0; i < $size(arr); i++) begin
      arr[i] = i * i;
    end
    $display("value of arr: {%0p}", arr);
  end
endmodule
