`timescale 1ns / 1ps

module list;

  int arr[];
  int fixed_arr[30];

  initial begin

    //essentially constructuor
    arr = new[5];

    for (int j = 0; j < 5; j++) begin
      arr[j] = 5 * j;
    end

    $display("arr = {%0p}", arr);

    // copies elements from arr after creating new arr
    arr = new[30] (arr);
    fixed_arr = arr;
    $display("fixed_arr = {%0p}", fixed_arr);
  end
endmodule
