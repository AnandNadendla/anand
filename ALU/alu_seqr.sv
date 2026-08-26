class alu_seqr extends uvm_sequence #(alu_seq_item);

  `uvm_object_utils(alu_seqr)

  function new(string name = "alu_seqr");
    super.new(name);
  endfunction

  endclass