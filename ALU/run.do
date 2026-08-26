vlib work
vlog alu_top.sv +acc
vsim work.alu_top +UVM_VERBOSITY=UVM_MEDIUM -l run2.log
#vsim +UVM_TESTNAME=alu_test
run -all
