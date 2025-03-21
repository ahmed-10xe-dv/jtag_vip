class jtag_driver extends uvm_driver#(jtag_transaction);
    `uvm_component_utils(jtag_driver)

    virtual jtag_if vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual jtag_if)::get(this, "", "vif", vif))
            `uvm_fatal("NOVIF", "Virtual interface not found")
    endfunction

    virtual task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(req);
            drive_transaction(req);
            seq_item_port.item_done();
        end
    endtask

    virtual task drive_transaction(jtag_transaction trans);
        // Implement the logic to drive AXI3 signals based on the transaction
        #20;
    endtask
endclass