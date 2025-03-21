class jtag_env extends uvm_env;
    `uvm_component_utils(jtag_env)

    jtag_agent    agent;
    jtag_scoreboard scoreboard;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = jtag_agent::type_id::create("agent", this);
        scoreboard = jtag_scoreboard::type_id::create("scoreboard", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agent.ap.connect(scoreboard.ap_imp);
    endfunction
endclass