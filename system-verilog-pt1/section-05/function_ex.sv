module function_ex;

  bit [4:0] res = 0;
  bit [3:0] ain = 4'b0100;
  bit [3:0] bin = 4'b0010;

  function automatic bit [4:0] add();
    return ain + bin;
  endfunction

  function automatic void display_ain_bin();
    $display("value of ain = %0d\nvalue of bin = %0d", ain, bin);
  endfunction

  initial begin
    //res = add();
    //$display("value of addition = %0d", res);
    display_ain_bin();
  end


endmodule
