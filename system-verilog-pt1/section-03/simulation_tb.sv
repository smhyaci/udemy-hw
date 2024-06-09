`timescale 1ns / 1ps

module simulation_tb;

  time fix_time = 0;
  realtime real_time = 0;

  // $time() - fixed point format current time
  // $realtime() - floating point format current time

  initial begin
    #12;
    fix_time = $time();
    $display("Current simulation time: %0t", fix_time);

    #12.53;
    real_time = $realtime();
    $display("Current simulation realtime: %0t", real_time);
  end

endmodule
