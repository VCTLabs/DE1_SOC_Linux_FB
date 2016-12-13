qsys-generate soc_system.qsys --synthesis=VERILOG
exit && $? 

quartus_map  DE1_SOC_Linux_FB
exit && $?

quartus_fit  DE1_SOC_Linux_FB
exit &&  $?

quartus_asm  DE1_SOC_Linux_FB
exit && $?

quartus_cpf -c DE1_SOC_Linux_FB.sof soc_system.rbf
exit && $?

java -jar sopc2dts/sopc2dts.jar -i soc_system.sopcinfo -o soc_system.dts
exit && $?

bsp-create-settings --type spl --bsp-dir build --preloader-settings-dir hps_isw_handoff/soc_system_hps_0/ --settings build/settings.bsp

exit $?
