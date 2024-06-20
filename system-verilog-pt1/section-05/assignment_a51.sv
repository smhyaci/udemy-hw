class wrapper;

  bit [31:0] data1 = 45;
  bit [31:0] data2 = 78;
  bit [31:0] data3 = 90;

endclass



module assignment_a51;

  wrapper w;

  initial begin
    w = new();
    #10;
    $display("data1 = %0d\ndata2 = %0d\ndata3 = %0d", w.data1, w.data2, w.data3);
    w = null;
  end

endmodule
