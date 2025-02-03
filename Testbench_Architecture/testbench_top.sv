`include "intf.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"

module testbench_top;
  logic clk;
  intf siso_if(clk);
  siso #(4) dut (
    .clk(clk),
    .rst(siso_if.rst),
    .serial_in(siso_if.serial_in),
    .serial_out(siso_if.serial_out)
  );
  
  environment env;
  
  initial begin
    env = new(siso_if);
    env.run();
  end
  
  always #5 clk = ~clk;
    
  initial begin
    clk = 0;
    #150 $finish;
  end

endmodule