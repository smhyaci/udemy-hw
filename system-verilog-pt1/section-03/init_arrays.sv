module init_arrays;

  int unique_arr[2] = '{1, 3};
  int rep_arr[] = '{5{3}};
  int default_arr[10] = '{default: 2};

  initial begin
    $display("print all elements of arr: %0p", unique_arr);
    $display("print all elements of arr: %0p", rep_arr);
    $display("print all elements of arr: %0p", default_arr);

  end

endmodule
