==================
 DE1_SOC_Linux_FB
==================

Demo project for DE1-SoC board, updated the Quartus/Qsys 16.1.

Update Process
==============

Upgrade project IP cores, re-generate the Verilog or VHDL code (using Qsys) then rebuild
with Quartus tools::

$ qsys-generate soc_system.qsys --upgrade-ip-cores
$ qsys-generate soc_system.qsys --synthesis=VERILOG
$ quartus_map  DE1_SOC_Linux_FB
$ quartus_fit  DE1_SOC_Linux_FB
$ quartus_asm  DE1_SOC_Linux_FB

Convert the .sof file to a firmware blob::

$ quartus_cpf -c DE1_SOC_Linux_FB.sof soc_system.rbf

.. note:: To use the project Makefile, run ``make clean`` and then ``make sof``.
          Do not run ''make scrub_clean`` since it will remove important bits
          required by the project.


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


Current deploy sequence
=======================

Yocto currently builds 2 main rootfs "packages" and the sdcard image (plus kernel,
.dtb, u-boot).  The tarball, rootfs ext3 image and sdcard image all contain the
proper kernel modules and boot files, however, u-boot is still plain vanilla (ie,
it has not yet been updated with the Quartus project headers).  The deployment
steps must incorporate the firmware blob and custom u-boot:

0) bitbake an image
1) burn the sdcard image to a test card
2) mount the /boot partition or the root partition, depending on whether the card
   was formatted with 2 or 3 partitions; note the raw partition will be either
   the first (of 2) partitions or the last (of 3)
3) copy the new .rbf file to the boot partition as ``soc_system.rbf``
4) update the u-boot build as above and burn the spl file to the raw partition
5) insert the card, open a serial console, and boot the board


U-Boot Notes
============

Mainline u-boot (for socfpga boards) is barebones without more vendor "luv",
as it only supports extlinux.conf (meaning no uEnv or even boot script support).
The VCT u-boot repo has patches, one adds basic boot.scr support to the closest
config: socfpga_de0_nano_soc_defconfig

If it finds a boot.scr in the /boot partition, it will execute it, so if you want
to disable it, rename or delete it.  Otherwise it only looks for the default kernel
and DT blob names (zImage and socfpga.dtb).  This seemed like the "best" (or least
bad) starting point since all the vendor examples/documentation uses a boot.scr to
load the fpga and enable the bridges.  Note the old vendor commands are not there
anymore (mainly ``bridge_enable_handoff``), so the current (only) u-boot method
of ``bridge enable`` isn't completely verified yet (it appears to work so far).

Build reqs: git, make, armv7 hardfloat toolchain, all the normal goodies.

Repo: https://github.com/VCTLabs/u-boot.git

Branch: v2016.03-yocto

::

$ git clone https://github.com/VCTLabs/u-boot.git
$ cd u-boot/
$ git checkout v2016.03-yocto
$ export CC=armv7a-hardfloat-linux-gnueabi-
$ make ARCH=arm CROSS_COMPILE=${CC} distclean
$ make ARCH=arm CROSS_COMPILE=${CC} socfpga_de0_nano_soc_defconfig
$ make ARCH=arm CROSS_COMPILE=${CC}
$ sudo dd if=./u-boot-with-spl.sfp of=/dev/sdX3

where sdX is your sdcard device.  Now try the qts script and rebuild
using all 3 make commands.


Kernel Notes
============

The kernel patches are also on branches in the VCT linux-socfpga repo.

Repo: https://github.com/VCTLabs/linux-socfpga.git

Branches: socfpga-3.18-audio  and  4.4-altera

Recipes for each with patches are in the Yocto meta-altera layer below.


Yocto Notes
===========

Custom kernel and u-boot patches (board-specific headers not updated)

Repo: https://github.com/VCTLabs/meta-altera

Branch: jethro_16.1_v2016.03

Repo: https://github.com/VCTLabs/vct-socfpga-bsp-platform

Branch: poky-jethro

The second repo above is the build manifest for a Yocto (Poky) build, which
includes the meta-altera BSP layer plus more.  See the conf/local sample
configs in meta-altera to get started building (just copy them to your fresh
build_dir/conf and change the path to downloads and state cache).  The comand::

$ bitbake core-image-minimal

will build a nice console image with all the custom content (using the local
config file examples) and one of the two kernel versions.  See the branch
README files in the platform repo for more setup information.

The Yocto build contains all of the Altera 16.1 branch demos, etc, plus
the kernel and u-boot patches for .dts and spl builds.  It makes an sdcard
image with VFAT /boot, etx3 / (root), and raw 3rd partition for u-boot.  It
will populate /boot with everything except the soc_system.rbf file, and the
third partition will be the "plain" u-boot, which needs to be replaced with
the spl build from `Update U-boot Headers`_ above.

Use the local.conf settings to switch kernels, currently linux-audio-3.18
and linux-altera-4.4.  Both have slightly different versions of the same
patches for DTS and wm8731 (note linux-altera-4.4 recipe has been updated
with separate .dts files for the FB and Audio projects with config set for
FB).  The Linux_Audio project modules are packaged for the Yocto build,
otherwise they need to be built separately (use the Makefile).






