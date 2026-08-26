class alu_agent extends uvm_agent;

  `uvm_component_utils(alu_agent)

  alu_driver m_driver;
  alu_monitor m_monitor;
  alu_seqr m_sequencer;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    m_sequencer = alu_seqr::type_id::create("m_sequencer", this);
    m_driver = alu_driver::type_id::create("m_driver", this);
    m_monitor = alu_monitor::type_id::create("m_monitor", this);

  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    m_driver.seq_item_port.connect(m_sequencer.seq_item_export);

  endfunction   
  endclass