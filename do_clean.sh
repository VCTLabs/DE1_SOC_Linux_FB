#!/bin/sh

rm -rf db/* 2> /dev/null
rm -rf incremental_db/* 2> /dev/null
rm -rf stamp/* 2> /dev/null
rm -rf build/* 2> /dev/null
rm -rf .qsys_edit/* 2> /dev/null
#
rm *.h 2> /dev/null
rm *.dts 2> /dev/null
rm *.dtb 2> /dev/null
#
rm   soc_system.sopcinfo 2> /dev/null
rm   soc_system/*.rpt 2> /dev/null
rm   soc_system/*.html 2> /dev/null
rm   soc_system/*.debuginfo 2> /dev/null
rm   soc_system/*.bsf 2> /dev/null
rm   soc_system/synthesis/* 2> /dev/null
#
rm   soc_system/soc_system_inst.v 2> /dev/null
rm   soc_system/soc_system_inst.vhd 2> /dev/null

