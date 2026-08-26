class alu_monitor extends uvm_monitor;
`uvm_component_utils(alu_monitor)
virtual intf vif;
alu_seq_item item2;
uvm_analysis_port #(alu_seq_item) ap;

function new(string name ="alu_monitor",uvm_component parent = null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);  
item2=alu_seq_item::type_id::create("item2");
ap=new("ap",this);
if(!uvm_config_db#(virtual intf)::get(this, "*", "vif", vif))
`uvm_fatal("NOVIF", "Virtual interface must be set for: " + get_full_name() + ".vif");

endfunction
task run_phase(uvm_phase phase);
super.run_phase(phase);
forever begin
    @(posedge vif.clk);
    item2.a=vif.a;  
    item2.b=vif.b;
    item2.opcode=vif.opcode;
    item2.result=vif.result;
    item2.cout=vif.cout;
    #1;
    `uvm_info(get_type_name(), $sformatf("a=%0d, b=%0d, opcode=%0d, result=%0d, cout=%0d", item2.a, item2.b, item2.opcode, item2.result, item2.cout), UVM_MEDIUM)
    ap.write(item2);
end
endtask

 endclass