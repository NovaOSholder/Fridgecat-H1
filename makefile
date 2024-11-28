# Makefile örneği
SIM = vvp
VERILOG_FILES = alu.v register_file.v cpu_top.v testbench.v
TOP_LEVEL = testbench

all: sim

sim:
	iverilog -o simv $(VERILOG_FILES)
	$(SIM) simv
