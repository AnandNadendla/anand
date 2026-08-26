class alu_test extends uvm_test;

  `uvm_component_utils(alu_test)

  alu_env m_env;

  function new(string name = "alu_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_env = alu_env::type_id::create("m_env", this);
  endfunction

  task run_phase(uvm_phase phase);
    alu_seq alu_sequence;

    phase.raise_objection(this);
    alu_sequence = alu_seq::type_id::create("alu_sequence");
    alu_sequence.start(m_env.m_agent.m_sequencer);
    phase.drop_objection(this);
  endtask

endclass