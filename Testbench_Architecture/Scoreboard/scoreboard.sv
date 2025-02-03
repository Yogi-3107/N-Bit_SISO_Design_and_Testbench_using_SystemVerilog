class scoreboard;
  parameter N=4;
  mailbox mon2scb;
  logic [N-1:0] expected;
  
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  task run();
    transaction tx;
    expected = 0;
    
    forever begin
      mon2scb.get(tx);
      expected <= {expected[N-2:0], tx.serial_in};
      if (tx.serial_out !== expected[N-1]) begin
        $display("MISMATCH: Expected=%b | Got=%b;", expected[N-1], tx.serial_out);
      end
      else
        tx.display("SCOREBOARD");
    end
  endtask
  
endclass