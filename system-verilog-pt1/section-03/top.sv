`timescale 1ns / 1ps

module top (
    input  a,
    input  b,
    input  sel,
    output y
);

  logic temp;

  always_comb begin : main
    if (~sel) temp = a;
    else temp = b;
  end

  assign y = temp;

endmodule
