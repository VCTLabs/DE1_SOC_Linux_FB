==================
 DE1_SOC_Linux_FB
==================

Demo project for DE1-SoC board, updated the Quartus/Qsys 16.1.

Update Process
==============

Upgrade project IP cores, re-generate the VHDL code (using Qsys) then rebuild
with Quartus tools::

$ qsys-generate soc_system.qsys --upgrade-ip-cores
$ qsys-generate soc_system.qsys --synthesis=VHDL
$ quartus_map  DE1_SOC_Linux_FB
$ quartus_fit  DE1_SOC_Linux_FB
$ quartus_asm  DE1_SOC_Linux_FB

Convert the .sof file to a firmware blob::

$ quartus_cpf -c DE1_SOC_Linux_FB.sof soc_system.rbf

Generate BSP dir
================

You can run the bsp editor GUI, but the easy way for u-boot is to run the
following command from the project directory::

$ bsp-create-settings --type spl --bsp-dir build --preloader-settings-dir hps_isw_handoff/soc_system_hps_0/ --settings build/settings.bsp

Now you can use the "build" dir above (ie, where the settings.bsp file is) in
the following u-boot command to update the board headers.  Once these headers
are updated for a given project build, u-boot should be configured for the
de0-nano-sockit and then build the normal spl build.

Update U-boot Headers
=====================

With a suitable device tree file, we can skip right to u-boot, where we're using
the mainline version from the meta-altera jethro branch u-boot (v2016.03-yocto).
The script args are essentially <device_family> , <path/to/project/dir> ,
<path/to/bsp/dir> , and <path/to/u-boot/qts/dir>

Example command assuming u-boot and project source dirs are parallel::

$ cd path/to/u-boot
$ ./arch/arm/mach-socfpga/qts-filter.sh cyclone5 ../de1-soc-audio/DE1_SOC_Linux_Audio ../de1-soc-audio/DE1_SOC_Linux_Audio/build/ board/terasic/de0-nano-soc/qts/


