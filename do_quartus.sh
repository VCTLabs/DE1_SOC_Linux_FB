#!/bin/sh

./do_clean.sh

qsys-generate soc_system.qsys --synthesis=VERILOG

quartus_map  DE1_SOC_Linux_FB
quartus_fit  DE1_SOC_Linux_FB
quartus_asm  DE1_SOC_Linux_FB

quartus_cpf -c DE1_SOC_Linux_FB.sof soc_system.rbf

# only generates one file type at a time

java -jar ../sopc2dts/sopc2dts.jar -i soc_system.sopcinfo -o soc_system.dts -t dts -b soc_system_board_info.xml -c --bridge-removal all -v
java -jar ../sopc2dts/sopc2dts.jar -i soc_system.sopcinfo -o soc_system.dtb -t dtb -b soc_system_board_info.xml -c --bridge-removal all -v
java -jar ../sopc2dts/sopc2dts.jar -i soc_system.sopcinfo                          -b soc_system_board_info.xml -c --bridge-removal all -v -m

#

bsp-create-settings --type spl --bsp-dir build --preloader-settings-dir hps_isw_handoff/soc_system_hps_0/ --settings build/settings.bsp

