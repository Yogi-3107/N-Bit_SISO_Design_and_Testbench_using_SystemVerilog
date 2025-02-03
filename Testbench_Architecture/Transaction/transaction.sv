class transaction;
  rand bit serial_in;
  bit serial_out;
  
  function void display(string tag);
    $display("[%s] serial_in=%b | serial_out=%b", tag, serial_in, serial_out);
  endfunction
  
endclass