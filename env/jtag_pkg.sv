package jtag_pkg;
    
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    `include "jtag_transaction.sv"
    `include "jtag_config.sv"
    `include "jtag_monitor.sv"
    `include "jtag_driver.sv"
    `include "jtag_sequencer.sv"
    `include "jtag_agent.sv"
    `include "jtag_scoreboard.sv"
    `include "jtag_env.sv"
endpackage