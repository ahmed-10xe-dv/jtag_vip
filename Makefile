ENV_DIR = $(shell pwd)

# Simulator executables and directories
QUESTA_HOME = $(QUESTA21)
VCS_HOME =
XCELIUM_HOME =


SIM = questa
gui = 0
test = jtag_base_test



ifeq ($(SIM), questa)
	BUILD_CMD   = vlog
	SIM_CMD     = vsim
	BUILD_OPTS  = -L $(QUESTA_HOME)/uvm-1.2 
	BUILD_OPTS += -sv -timescale=1ns/1ps
	BUILD_OPTS += -work $(ENV_DIR)/sim/work -l $(ENV_DIR)/sim/compile.log
	BUILD_OPTS += -l $(ENV_DIR)/sim/compile.log
	SIM_OPTS    = -work $(ENV_DIR)/sim/work jtag_tb_top 
	SIM_OPTS   += -voptargs=+acc $(gui_flag)
	SIM_OPTS   += -l $(ENV_DIR)/sim/tests/$(test)/sim.log
	SIM_OPTS   += -do "run -all; q;"
	# Include Directories
	INCDIR  = +incdir+$(ENV_DIR)/agent
	INCDIR += +incdir+$(ENV_DIR)/configs
	INCDIR += +incdir+$(ENV_DIR)/env
	INCDIR += +incdir+$(ENV_DIR)/include
	INCDIR += +incdir+$(ENV_DIR)/tests
	INCDIR += +incdir+$(ENV_DIR)/interface
	INCDIR += +incdir+$(ENV_DIR)/scoreboard
	INCDIR += +incdir+$(ENV_DIR)/seqs
	ifeq ($(gui), 1)
	gui_flag = -gui
	else 
	gui_flag = -c
	endif
else ifeq ($(SIM), vcs)
	BUILD_CMD = vcs
else ifeq ($(SIM), xcelium)
	BUILD_CMD = xrun
endif




build:
	$(BUILD_CMD) $(BUILD_OPTS) $(INCDIR) -f $(ENV_DIR)/sim/verif_flist.f

run:
	mkdir -p $(ENV_DIR)/sim/tests/$(test)
	cd $(ENV_DIR)/sim/tests/$(test) && \
	$(SIM_CMD) $(SIM_OPTS) +UVM_TESTNAME=$(test)

clean:
	rm -rf $(ENV_DIR)/sim/work $(ENV_DIR)/sim/tests $(ENV_DIR)/sim/*.log 

wave:
	gtkwave $(ENV_DIR)/sim/tests/$(test)/uvm_tb.vcd