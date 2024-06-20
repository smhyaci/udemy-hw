module assignment_a52;

  bit [31:0] a = 12;
  bit [31:0] b = 10;

  function automatic bit [63:0] mult();
    return a * b;
  endfunction

  function automatic void compare();
    if (a * b != mult()) $display("Test Failed");
    else $display("Test Passed");
  endfunction

  initial begin
    #1;
    compare();
  end


endmodule
