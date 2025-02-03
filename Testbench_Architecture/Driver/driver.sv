class driver;
  virtual intf vif;
  mailbox gen2drv;
  
  function new(virtual intf vif, mailbox gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction
  
  task run();
    transaction tx;
    vif.rst = 1;
    #10 vif.rst = 0;
    
    forever begin
      gen2drv.get(tx);
      vif.serial_in = tx.serial_in;
      #10;
    end
  endtask
  
endclass