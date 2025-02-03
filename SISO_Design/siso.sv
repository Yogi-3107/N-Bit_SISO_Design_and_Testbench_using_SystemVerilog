module siso #(parameter N = 4)(
  input logic clk, 
  input logic rst, 
  input logic serial_in,
  output logic serial_out
);
  
  logic [N-1:0] temp;
  
  always_ff@(posedge clk, posedge rst) begin
    if (rst) begin
      temp <= '0; // At rst = 1, resets value to 0
    end
    else begin
      //Left-Shift Operation at rst = 0, clk = 1
      temp <= {temp[N-2:0],serial_in};
    end
  end
  
  assign serial_out = temp[N-1];
  
endmodule