class alu_driver extends uvm_driver #(alu_seq_item);
`uvm_component_utils(alu_driver)
alu_seq_item item;
virtual intf vif;

function new(string name = "alu_driver", uvm_component parent);
  super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);   
    item=alu_seq_item::type_id::create("item");

    if(!uvm_config_db#(virtual intf)::get(this, "*", "vif", vif))
      `uvm_fatal("NOVIF", $sformatf("Virtual interface must be set for: %s.vif", get_full_name()));
      endfunction

      task run_phase(uvm_phase phase);
      super.run_phase(phase);
        forever begin
            @(posedge vif.clk);
            seq_item_port.get_next_item(item);
            vif.a=item.a;
            vif.b=item.b;
            vif.opcode=item.opcode;
            #1;
            seq_item_port.item_done();
            `uvm_info(get_type_name(), $sformatf("a=%0d, b=%0d, opcode=%0d, result=%0d, cout=%0d", item.a, item.b, item.opcode, vif.result, vif.cout), UVM_MEDIUM)

          
        end
        endtask

    endclass