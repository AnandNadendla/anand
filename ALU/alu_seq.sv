class alu_seq extends uvm_sequence #(alu_seq_item);

  `uvm_object_utils(alu_seq)

  function new(string name = "alu_seq");
    super.new(name);
  endfunction

  task body();
  repeat (10) begin
    alu_seq_item item;
    item = alu_seq_item::type_id::create("item");
    assert(item.randomize());
    start_item(item);
    finish_item(item);
  end




endclass