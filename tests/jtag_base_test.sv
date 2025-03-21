class jtag_base_test extends uvm_test;
    `uvm_component_utils(jtag_base_test)

    jtag_env env;
    jtag_sequence seq;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = jtag_env::type_id::create("env", this);
        seq = jtag_sequence::type_id::create("seq", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        // Create and start sequences here
        seq.start(env.agent.sequencer);
        phase.drop_objection(this);
    endtask
endclass