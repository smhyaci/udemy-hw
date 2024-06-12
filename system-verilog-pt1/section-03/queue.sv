module queue;
  int q[$];
  int head;
  int tail;

  initial begin
    q = {1, 2, 3};
    $display("q = {%0p}", q);

    q.push_front(7);
    $display("q = {%0p}", q);

    q.push_back(9);
    $display("q = {%0p}", q);

    q.insert(2, 10);
    $display("q = {%0p}", q);

    head = q.pop_front();
    $display("haed = %0d", head);
    $display("q = {%0p}", q);

    tail = q.pop_back();
    $display("tail = %0d", tail);
    $display("q = {%0p}", q);

    q.delete(1);
    $display("q = {%0p}", q);


  end
endmodule
