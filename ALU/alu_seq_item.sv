 class alu_seq_item extends uvm_sequence_item;

    rand bit [7:0] a, b;
    rand bit [2:0] opcode;  
    bit [7:0] result;
    bit cout;
      `uvM_object_utils_begin(alu_seq_item)
        `uvm_field_int(a, UVM_ALL_ON)
        `uvm_field_int(b, UVM_ALL_ON)
        `uvm_field_int(opcode, UVM_ALL_ON)
        `uvm_field_int(result, UVM_ALL_ON)
        `uvm_field_int(cout, UVM_ALL_ON)
        `uvM_object_utils_end

        function new(string name = "alu_seq_item");
            super.new(name);
            endfunction

            constraint opcode_c {opcode inside {[0:7]};}
            constraint a_c {a inside {[0:255]};}
 endclass