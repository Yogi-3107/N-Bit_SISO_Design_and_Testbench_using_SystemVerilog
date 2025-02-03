class monitor;
  virtual intf vif;
  mailbox mon2scb;
  
  function new(virtual intf vif, mailbox mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction
  
  task run();
    transaction tx;
    forever begin
      tx = new();
      #10;
      tx.serial_in = vif.serial_in;
      tx.serial_out = vif.serial_out;
      mon2scb.put(tx);
    end
  endtask
  
endclass