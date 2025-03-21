class jtag_sequence extends uvm_sequence #(jtag_transaction);
    `uvm_object_utils(jtag_sequence)

    function new(string name = "jtag_sequence");
        super.new(name);
    endfunction

    virtual task body();
        jtag_transaction txn;
        `uvm_info(get_type_name(), "Starting jtag_sequence", UVM_MEDIUM)

        repeat (10) begin // Generate 10 transactions
            txn = jtag_transaction::type_id::create("txn");
            start_item(txn);
            if (!txn.randomize()) begin
                `uvm_error(get_type_name(), "Randomization failed")
            end
            finish_item(txn);
        end

        `uvm_info(get_type_name(), "jtag_sequence completed", UVM_MEDIUM)
    endtask

endclass
