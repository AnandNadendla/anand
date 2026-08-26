`timescale 1ns/1ps

module alu_top;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "files.sv"

  logic clk;
  logic rst_n;
  intf vif(clk, rst_n);

  alu dut (
    .a(vif.a),
    .b(vif.b),
    .op_code({1'b0, vif.opcode}),
    .clk(clk),
    .reset(~rst_n),
    .result(vif.result),
    .cout(vif.cout)
  );

  initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end

  initial begin
    rst_n = 1'b0;
    #10 rst_n = 1'b1;
  end

  initial begin
    uvm_config_db#(virtual intf)::set(null, "*", "vif", vif);
    run_test("alu_test");
  end

endmodule