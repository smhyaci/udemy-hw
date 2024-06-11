`timescale 1ns / 1ps

module traverse_arrays;
  int arr[10];
  int i;

  initial begin
    for (i = 0; i < 10; i++) begin
      arr[i] = i;
    end
    $display("Initialized (for) arr: {%0p}", arr);

    foreach (arr[j]) begin
      arr[j] = arr[j] + 1;
    end
    $display("Updated (foreach) arr: {%0p}", arr);

    i = 0;
    repeat (10) begin
      arr[i] *= arr[i];
      i++;
    end
    $display("Updated (repeat) arr: {%0p}", arr);
  end




endmodule
