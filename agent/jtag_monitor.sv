class jtag_monitor extends uvm_monitor;
    `uvm_component_utils(jtag_monitor)

    uvm_analysis_port#(jtag_transaction) ap;
    virtual jtag_if vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual jtag_if)::get(this, "", "vif", vif))
            `uvm_fatal("NOVIF", "Virtual interface not found")
    endfunction

    virtual task run_phase(uvm_phase phase);
        forever begin
            jtag_transaction trans;
            // Monitor the AXI3 signals and create transactions
            #20;
            ap.write(trans);
        end
    endtask
endclass