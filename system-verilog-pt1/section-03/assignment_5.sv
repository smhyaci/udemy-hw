`timescale 1ns / 1ps

module assignment_5;
  int arr[];
  int i;

  initial begin
    arr = new[7];
    for (i = 0; i < 7; i++) begin
      arr[i] = 7 * (i + 1);
    end
    #20;
    arr = new[20] (arr);
    for (i = 7; i < 20; i++) begin
      arr[i] = (i - 7 + 1) * 5;
    end
    $display("arr = {%0p}", arr);
  end
endmodule
