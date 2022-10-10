#!/bin/sh -f
xv_path="/opt/coe/Xilinx/Vivado/2015.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim full_adder_tb_behav -key {Behavioral:sim_1:Functional:full_adder_tb} -tclbatch full_adder_tb.tcl -log simulate.log
