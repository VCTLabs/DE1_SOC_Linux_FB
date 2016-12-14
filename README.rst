==================
 DE1_SOC_Linux_FB
==================

Demo project for DE1-SoC board, updated for Quartus/Qsys 16.1.

If your qsys/quartus/soceds installs went correctly, you should be able
to run the env.sh script in your shell and start compiling::

$ ${HOME}/intelFPGA/16.1/embedded/embedded_command_shell.sh

If you want to know more, read on...

.. note:: If you run the script as above it will exec a new bash using
   your default environment (~/.bashrc) but if you source it instead
   (as below) you will keep your original shell.  The one thing it
   currently does not add is the path to the bsp tools.

(Manual) Environment setup
==========================

Add this to your ~/.bashrc file::

  export ALTERA_PATH=$HOME/intelFPGA/16.1
  export SOCEDS_DEST_ROOT=$ALTERA_PATH/embedded

  export ALTERA_LITE_PATH=$HOME/intelFPGA_lite/16.1

  export QUARTUS_ROOTDIR_OVERRIDE=$ALTERA_LITE_PATH/quartus
  export QUARTUS_ROOTDIR=$QUARTUS_ROOTDIR_OVERRIDE

  export QSYS_ROOTDIR=$QUARTUS_ROOTDIR/sopc_builder

  export SOPC_KIT_NIOS2_OVERRIDE=$ALTERA_LITE_PATH/nios2eds
  export SOPC_KIT_NIOS2=$SOPC_KIT_NIOS2_OVERRIDE
  . $SOCEDS_DEST_ROOT/env.sh

There is a slight difference in QUARTUS_ROOT_DIR in the lite addition:

  QUARTUS_ROOT_DIR=$ALTERA_LITE_PATH/quartus

And these additonal optional items:

  $ALTERA_LITE_PATH/nios2eds/bin/gnu/H-x86_64-pc-linux-gnu/bin
  $ALTERA_LITE_PATH/nios2eds/sdk2/bin
  $ALTERA_LITE_PATH/nios2eds/bin

Rather than:

  QUARTUS_ROOT_DIR=ALTERA_PATH/qprogrammer

In either case you may want to setup the path to the BSP editor:

  export BSP_EDITOR_BINDIR=$SOCEDS_DEST_ROOT/host_tools/altera/preloadergen

Project Update/Build Process
============================

Update Process
==============

Design files and directories:
	DE1_SOC_Linux_FB.qpp
	DE1_SOC_Linux_FB.sdc
	DE1_SOC_Linux_FB.v
	DE1_SOC_Linux_FB.qsf
	soc_system.qsys
	ip/
	vga_pll.*
	vga_pll/

Upgrade project IP cores:

$ qsys-generate soc_system.qsys --upgrade-ip-cores

Will update:

  soc_system.qsys

Regenerate the VERILOG using QSYS:

$ qsys-generate soc_system.qsys --synthesis=VERILOG

Will update several files and directories including:

  DE1_SOC_Linux_FB.qsf
  soc_system.qsys

Output files:
	
  hps_sdram_p0_summary.csv
  soc_system.sopcinfo
  soc_system/
  soc_system_generation.rpt
  soc_system.xml
  soc_system.html

These will actually build the system:

$ quartus_map  DE1_SOC_Linux_FB
$ quartus_fit  DE1_SOC_Linux_FB
$ quartus_asm  DE1_SOC_Linux_FB

Convert the .sof file to a firmware blob::

$ quartus_cpf -c DE1_SOC_Linux_FB.sof soc_system.rbf

.. note:: To use the project Makefile, run ``make clean`` and 
   then ``make sof``.  Do not run ``make scrub_clean`` since
   it will remove important bits required by the project.

A script is included that will the generated files:

  do_clean.sh

If you want to experiment with building the .dts files and headers.
Currently this does NOT work apprpriately for 16.x and current kernels:

These are useful guides:

  https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/ug/ug_soc_eds.pdf
  https://rocketboards.org/foswiki/view/Documentation/DeviceTreeGenerator
  https://rocketboards.org/foswiki/view/Documentation/GSRDV151DeviceTreeGenerator

To create the dts file you will need the sopc2dts utility. You can create it:

  git clone https://github.com/wgoossens/sopc2dts
  cd sopc2dts
  make
  cd -

You invoke it this way:

  java -jar sopc2dts/sopc2dts.jar -i soc_system.sopcinfo -o soc_system.dts

or for a gui interface:

  java -jar sopc2dts/sopc2dts.jar --gui -i soc_system.sopcinfo

At this point we have these essential generated files:
=====================================================

soc_system.rbf
soc_system.sopcinfo
soc_system/soc_system.html
soc_system/soc_system_generation.rpt
soc_system.rbf
soc_system.dts

These files are also generaated:

  DE1_SOC_Linux_FB.sld
  DE1_SOC_Linux_FB.fit.rpt
  DE1_SOC_Linux_FB.fit.summary
  DE1_SOC_Linux_FB.fit.smsg
  DE1_SOC_Linux_FB.pin
  DE1_SOC_Linux_FB.map.rpt
  DE1_SOC_Linux_FB.map.summary
  DE1_SOC_Linux_FB.map.smsg
  c5_pin_model_dump.txt

--------------------

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
$ ./arch/arm/mach-socfpga/qts-filter.sh cyclone5 ../DE1_SOC_Linux_FB/ ../DE1_SOC_Linux_FB/build/ board/terasic/de0-nano-soc/qts/

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

where sdX is your sdcard device and CC is your toolchain prefix.  Now try the qts script
and rebuild using all 3 make commands.

At this point, u-boot essentially doesn't care what it loads if it has the right name; this
goes for all of the files - soc_system.rbf, socfpga.dtb, boot.scr, and zImage.  The key is
matching the right .rbf with the right .dtb file, since there are multiple DT blobs in the
kernel build but only one (correct) .rbf for each matching .dtb file.  The Yocto kernel
recipes takes care of this with config options, so it's up to you if you build the kernel
by hand (or with the kernel builder).  There is no de1_soc device tree file in any upstream
kernel, so the following patches are added in the Yocto image and kernel builder:

* DE1_SOC_Linux_FB project (ie, this one) uses ``socfpga_cyclone5_de1_soc-fb.dts``
* DE1-SoC-Sound project uses ``socfpga_cyclone5_de1_soc-audio.dts``


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


