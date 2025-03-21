class jtag_transaction extends uvm_sequence_item;
    `uvm_object_utils(jtag_transaction)

    // Define the transaction fields

    function new(string name = "jtag_transaction");
        super.new(name);
    endfunction
endclass