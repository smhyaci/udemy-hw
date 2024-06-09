`timescale 1ns / 1ps

module tb;

  reg signed [7:0] v = -127;
  reg [7:0] v2 = 130;

  initial begin
    #10;
    $display("value of v %0d", v);
  end

  shortint x = 10;

endmodule
