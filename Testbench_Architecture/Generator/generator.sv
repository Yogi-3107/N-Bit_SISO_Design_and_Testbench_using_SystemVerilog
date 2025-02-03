class generator;
  rand transaction tx;
  mailbox gen2drv;
  
  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  task run();
    repeat(10) begin
      tx = new();
      assert(tx.randomize());
      gen2drv.put(tx);
    end
  endtask

endclass