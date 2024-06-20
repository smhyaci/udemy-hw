class example;

  reg [2:0] data;
  reg [1:0] data2;
endclass


module first;

  example ex;  // instance/handler

  initial begin
    ex = new();  // referred to as constructor & allocates memory for class
    ex.data = 3'b010;
    ex.data2 = 2'b01;
    ex = null;  // deallocating memory for class
    #1;
    $display("data = %0d   data2 = %0d", ex.data, ex.data2);
  end

endmodule
