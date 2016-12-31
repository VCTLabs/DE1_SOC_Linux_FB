#!/bin/sh

# deep clean
#
rm -rf db/*
rm -rf incremental_db/*
rm -rf stamp/*
rm -rf build/*
rm -rf .qsys_edit/*
#
rm *.h
rm *.dts
rm *.dtb
#
rm   soc_system.sopcinfo
rm   soc_system/*.rpt
rm   soc_system/*.html
rm   soc_system/*.debuginfo
rm   soc_system/*.bsf
rm   soc_system/synthesis/*
#
rm   soc_system/soc_system_inst.v
rm   soc_system/soc_system_inst.vhd

