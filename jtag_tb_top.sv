module jtag_tb_top;

    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import jtag_tests_pkg::*;

    logic tclk;
    logic trst_n;

    jtag_if jtag_if(tclk, trst_n);


    initial begin
        uvm_config_db#(virtual jtag_if)::set(null, "*", "vif", jtag_if);
        run_test("jtag_test");
    end

    // Clock generation
    initial begin
        tclk = 0;
        forever #5 tclk = ~tclk;
    end

    // Reset generation
    initial begin
        trst_n = 0;
        #20 trst_n = 1;
    end

    initial begin
        $dumpfile("jtag_tb_top.vcd");
        $dumpvars(0, jtag_tb_top);
    end
endmodule