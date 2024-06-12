`timescale 1ns / 1ps


module assignment_6;

  int arr[20];
  int q  [ $];

  initial begin
    for (int i = 0; i < 20; i++) begin
      arr[i] = $urandom();
    end

    for (int i = 0; i < $size(arr); i++) begin
      q.push_front(arr[i]);
    end
    $display("arr = {%0p}", arr);
    $display("q = {%0p}", q);
  end

endmodule
