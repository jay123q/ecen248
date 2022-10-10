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
echo "xvlog -m64 --relax -prj full_adder_tb_vlog.prj"
ExecStep $xv_path/bin/xvlog -m64 --relax -prj full_adder_tb_vlog.prj 2>&1 | tee compile.log
