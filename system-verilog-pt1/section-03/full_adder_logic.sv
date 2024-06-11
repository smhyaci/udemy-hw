module half_adder (
    input  wire a,
    b,
    output wire sout,
    cout
);
  assign sout = a ^ b;
  assign cout = a & b;
endmodule


module full_adder_logic (
    input  a,
    b,
    cin,
    output s,
    c
);

  logic t1, t2, t3;

  half_adder h1 (
      .a(a),
      .b(b),
      .sout(t1),
      .cout(t2)
  );

  half_adder h2 (
      .a(t1),
      .b(cin),
      .sout(s),
      .cout(t3)
  );

  assign c = t2 | t3;
endmodule
