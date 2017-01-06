#!/bin/sh

do_step()
{
	echo ${1} start
	${2} > ${1}.log
	let rc=$?
	echo ${1} ended with $rc
	[ $rc != 0 ] && exit $rc
}

d=DE1_SOC_Linux_FB

echo $0 start $d

./do_clean.sh

do_step qsys "qsys-generate soc_system.qsys --synthesis=VERILOG"
do_step map  "quartus_map  $d"
do_step fit  "quartus_fit  $d"
do_step asm  "quartus_asm  $d"
do_step cpf  "quartus_cpf -c $d.sof soc_system.rbf"
do_step dts  "java -jar ../sopc2dts/sopc2dts.jar -i soc_system.sopcinfo -o soc_system.dts -t dts -b soc_system_board_info.xml -c --bridge-removal all -v"
do_step dtc  "java -jar ../sopc2dts/sopc2dts.jar -i soc_system.sopcinfo -o soc_system.dtb -t dtb -b soc_system_board_info.xml -c --bridge-removal all -v"
do_step h    "java -jar ../sopc2dts/sopc2dts.jar -i soc_system.sopcinfo                          -b soc_system_board_info.xml -c --bridge-removal all -v -m"
do_step create-settings "bsp-create-settings --type spl --bsp-dir build --preloader-settings-dir hps_isw_handoff/soc_system_hps_0/ --settings build/settings.bsp"

echo "$0 done"

