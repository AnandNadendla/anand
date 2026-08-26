interface intf(input logic clk, input logic rst_n);
  logic [7:0] a,b;
  logic [2:0] opcode;
  logic [7:0] result;
  logic cout;
endinterface 