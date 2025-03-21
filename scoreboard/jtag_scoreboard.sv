class jtag_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(jtag_scoreboard)

    uvm_analysis_imp#(jtag_transaction, jtag_scoreboard) ap_imp;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        ap_imp = new("ap_imp", this);
    endfunction

    virtual function void write(jtag_transaction trans);
        // Compare the received transaction with the expected transaction
    endfunction
endclass