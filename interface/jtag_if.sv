interface jtag_if (input logic tclk, input logic trst_n);

    rand logic tdi;
    logic tdo;
    rand logic tms;     //TODO: Randc instead?

    modport in (input tdi, tms,  output tdo);
    modport out (output tdi, tms, input tdo);
    
endinterface