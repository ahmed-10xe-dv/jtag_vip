class jtag_agent extends uvm_agent;
    `uvm_component_utils(jtag_agent)

    uvm_analysis_port#(jtag_transaction) ap;

    jtag_sequencer sequencer;
    jtag_driver    driver;
    jtag_monitor   monitor;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        ap = new("ap", this);

        if (get_is_active() == UVM_ACTIVE) begin
            sequencer = jtag_sequencer::type_id::create("sequencer", this);
            driver    = jtag_driver::type_id::create("driver", this);
        end

        monitor = jtag_monitor::type_id::create("monitor", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        if (get_is_active() == UVM_ACTIVE) begin
            driver.seq_item_port.connect(sequencer.seq_item_export);
        end
        monitor.ap.connect(ap);
    endfunction
endclass