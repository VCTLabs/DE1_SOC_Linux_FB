# qsys scripting (.tcl) file for soc_system
package require -exact qsys 16.0

create_system {soc_system}

set_project_property DEVICE_FAMILY {Cyclone V}
set_project_property DEVICE {5CSEMA5F31C6}
set_project_property HIDE_FROM_IP_CATALOG {false}

# Instances and instance parameters
# (disabled instances are intentionally culled)
add_instance alt_vip_itc_0 alt_vip_itc 14.0
set_instance_parameter_value alt_vip_itc_0 {NUMBER_OF_COLOUR_PLANES} {4}
set_instance_parameter_value alt_vip_itc_0 {COLOUR_PLANES_ARE_IN_PARALLEL} {1}
set_instance_parameter_value alt_vip_itc_0 {BPS} {8}
set_instance_parameter_value alt_vip_itc_0 {INTERLACED} {0}
set_instance_parameter_value alt_vip_itc_0 {H_ACTIVE_PIXELS} {1024}
set_instance_parameter_value alt_vip_itc_0 {V_ACTIVE_LINES} {768}
set_instance_parameter_value alt_vip_itc_0 {ACCEPT_COLOURS_IN_SEQ} {0}
set_instance_parameter_value alt_vip_itc_0 {FIFO_DEPTH} {1920}
set_instance_parameter_value alt_vip_itc_0 {CLOCKS_ARE_SAME} {0}
set_instance_parameter_value alt_vip_itc_0 {USE_CONTROL} {0}
set_instance_parameter_value alt_vip_itc_0 {NO_OF_MODES} {1}
set_instance_parameter_value alt_vip_itc_0 {THRESHOLD} {1919}
set_instance_parameter_value alt_vip_itc_0 {STD_WIDTH} {1}
set_instance_parameter_value alt_vip_itc_0 {GENERATE_SYNC} {0}
set_instance_parameter_value alt_vip_itc_0 {USE_EMBEDDED_SYNCS} {0}
set_instance_parameter_value alt_vip_itc_0 {AP_LINE} {0}
set_instance_parameter_value alt_vip_itc_0 {V_BLANK} {0}
set_instance_parameter_value alt_vip_itc_0 {H_BLANK} {0}
set_instance_parameter_value alt_vip_itc_0 {H_SYNC_LENGTH} {136}
set_instance_parameter_value alt_vip_itc_0 {H_FRONT_PORCH} {24}
set_instance_parameter_value alt_vip_itc_0 {H_BACK_PORCH} {160}
set_instance_parameter_value alt_vip_itc_0 {V_SYNC_LENGTH} {6}
set_instance_parameter_value alt_vip_itc_0 {V_FRONT_PORCH} {3}
set_instance_parameter_value alt_vip_itc_0 {V_BACK_PORCH} {29}
set_instance_parameter_value alt_vip_itc_0 {F_RISING_EDGE} {0}
set_instance_parameter_value alt_vip_itc_0 {F_FALLING_EDGE} {0}
set_instance_parameter_value alt_vip_itc_0 {FIELD0_V_RISING_EDGE} {0}
set_instance_parameter_value alt_vip_itc_0 {FIELD0_V_BLANK} {0}
set_instance_parameter_value alt_vip_itc_0 {FIELD0_V_SYNC_LENGTH} {0}
set_instance_parameter_value alt_vip_itc_0 {FIELD0_V_FRONT_PORCH} {0}
set_instance_parameter_value alt_vip_itc_0 {FIELD0_V_BACK_PORCH} {0}
set_instance_parameter_value alt_vip_itc_0 {ANC_LINE} {0}
set_instance_parameter_value alt_vip_itc_0 {FIELD0_ANC_LINE} {0}

add_instance alt_vip_vfr_vga alt_vip_vfr 14.0
set_instance_parameter_value alt_vip_vfr_vga {BITS_PER_PIXEL_PER_COLOR_PLANE} {8}
set_instance_parameter_value alt_vip_vfr_vga {NUMBER_OF_CHANNELS_IN_PARALLEL} {4}
set_instance_parameter_value alt_vip_vfr_vga {NUMBER_OF_CHANNELS_IN_SEQUENCE} {1}
set_instance_parameter_value alt_vip_vfr_vga {MAX_IMAGE_WIDTH} {1024}
set_instance_parameter_value alt_vip_vfr_vga {MAX_IMAGE_HEIGHT} {768}
set_instance_parameter_value alt_vip_vfr_vga {MEM_PORT_WIDTH} {128}
set_instance_parameter_value alt_vip_vfr_vga {RMASTER_FIFO_DEPTH} {64}
set_instance_parameter_value alt_vip_vfr_vga {RMASTER_BURST_TARGET} {32}
set_instance_parameter_value alt_vip_vfr_vga {CLOCKS_ARE_SEPARATE} {1}

add_instance button_pio altera_avalon_pio 16.1
set_instance_parameter_value button_pio {bitClearingEdgeCapReg} {1}
set_instance_parameter_value button_pio {bitModifyingOutReg} {0}
set_instance_parameter_value button_pio {captureEdge} {1}
set_instance_parameter_value button_pio {direction} {Input}
set_instance_parameter_value button_pio {edgeType} {FALLING}
set_instance_parameter_value button_pio {generateIRQ} {1}
set_instance_parameter_value button_pio {irqType} {EDGE}
set_instance_parameter_value button_pio {resetValue} {0.0}
set_instance_parameter_value button_pio {simDoTestBenchWiring} {0}
set_instance_parameter_value button_pio {simDrivenValue} {0.0}
set_instance_parameter_value button_pio {width} {2}

add_instance clk_0 clock_source 16.1
set_instance_parameter_value clk_0 {clockFrequency} {50000000.0}
set_instance_parameter_value clk_0 {clockFrequencyKnown} {1}
set_instance_parameter_value clk_0 {resetSynchronousEdges} {NONE}

add_instance dipsw_pio altera_avalon_pio 16.1
set_instance_parameter_value dipsw_pio {bitClearingEdgeCapReg} {1}
set_instance_parameter_value dipsw_pio {bitModifyingOutReg} {0}
set_instance_parameter_value dipsw_pio {captureEdge} {1}
set_instance_parameter_value dipsw_pio {direction} {Input}
set_instance_parameter_value dipsw_pio {edgeType} {ANY}
set_instance_parameter_value dipsw_pio {generateIRQ} {1}
set_instance_parameter_value dipsw_pio {irqType} {EDGE}
set_instance_parameter_value dipsw_pio {resetValue} {0.0}
set_instance_parameter_value dipsw_pio {simDoTestBenchWiring} {0}
set_instance_parameter_value dipsw_pio {simDrivenValue} {0.0}
set_instance_parameter_value dipsw_pio {width} {10}

add_instance hps_0 altera_hps 16.1
set_instance_parameter_value hps_0 {MEM_VENDOR} {JEDEC}
set_instance_parameter_value hps_0 {MEM_FORMAT} {DISCRETE}
set_instance_parameter_value hps_0 {RDIMM_CONFIG} {0000000000000000}
set_instance_parameter_value hps_0 {LRDIMM_EXTENDED_CONFIG} {0x000000000000000000}
set_instance_parameter_value hps_0 {DISCRETE_FLY_BY} {1}
set_instance_parameter_value hps_0 {DEVICE_DEPTH} {1}
set_instance_parameter_value hps_0 {MEM_MIRROR_ADDRESSING} {0}
set_instance_parameter_value hps_0 {MEM_CLK_FREQ_MAX} {800.0}
set_instance_parameter_value hps_0 {MEM_ROW_ADDR_WIDTH} {15}
set_instance_parameter_value hps_0 {MEM_COL_ADDR_WIDTH} {10}
set_instance_parameter_value hps_0 {MEM_DQ_WIDTH} {32}
set_instance_parameter_value hps_0 {MEM_DQ_PER_DQS} {8}
set_instance_parameter_value hps_0 {MEM_BANKADDR_WIDTH} {3}
set_instance_parameter_value hps_0 {MEM_IF_DM_PINS_EN} {1}
set_instance_parameter_value hps_0 {MEM_IF_DQSN_EN} {1}
set_instance_parameter_value hps_0 {MEM_NUMBER_OF_DIMMS} {1}
set_instance_parameter_value hps_0 {MEM_NUMBER_OF_RANKS_PER_DIMM} {1}
set_instance_parameter_value hps_0 {MEM_NUMBER_OF_RANKS_PER_DEVICE} {1}
set_instance_parameter_value hps_0 {MEM_RANK_MULTIPLICATION_FACTOR} {1}
set_instance_parameter_value hps_0 {MEM_CK_WIDTH} {1}
set_instance_parameter_value hps_0 {MEM_CS_WIDTH} {1}
set_instance_parameter_value hps_0 {MEM_CLK_EN_WIDTH} {1}
set_instance_parameter_value hps_0 {ALTMEMPHY_COMPATIBLE_MODE} {0}
set_instance_parameter_value hps_0 {NEXTGEN} {1}
set_instance_parameter_value hps_0 {MEM_IF_BOARD_BASE_DELAY} {10}
set_instance_parameter_value hps_0 {MEM_IF_SIM_VALID_WINDOW} {0}
set_instance_parameter_value hps_0 {MEM_GUARANTEED_WRITE_INIT} {0}
set_instance_parameter_value hps_0 {MEM_VERBOSE} {1}
set_instance_parameter_value hps_0 {PINGPONGPHY_EN} {0}
set_instance_parameter_value hps_0 {DUPLICATE_AC} {0}
set_instance_parameter_value hps_0 {REFRESH_BURST_VALIDATION} {0}
set_instance_parameter_value hps_0 {AP_MODE_EN} {0}
set_instance_parameter_value hps_0 {AP_MODE} {0}
set_instance_parameter_value hps_0 {MEM_BL} {OTF}
set_instance_parameter_value hps_0 {MEM_BT} {Sequential}
set_instance_parameter_value hps_0 {MEM_ASR} {Manual}
set_instance_parameter_value hps_0 {MEM_SRT} {Normal}
set_instance_parameter_value hps_0 {MEM_PD} {DLL off}
set_instance_parameter_value hps_0 {MEM_DRV_STR} {RZQ/7}
set_instance_parameter_value hps_0 {MEM_DLL_EN} {1}
set_instance_parameter_value hps_0 {MEM_RTT_NOM} {RZQ/4}
set_instance_parameter_value hps_0 {MEM_RTT_WR} {RZQ/4}
set_instance_parameter_value hps_0 {MEM_WTCL} {8}
set_instance_parameter_value hps_0 {MEM_ATCL} {Disabled}
set_instance_parameter_value hps_0 {MEM_TCL} {11}
set_instance_parameter_value hps_0 {MEM_AUTO_LEVELING_MODE} {1}
set_instance_parameter_value hps_0 {MEM_USER_LEVELING_MODE} {Leveling}
set_instance_parameter_value hps_0 {MEM_INIT_EN} {0}
set_instance_parameter_value hps_0 {MEM_INIT_FILE} {}
set_instance_parameter_value hps_0 {DAT_DATA_WIDTH} {32}
set_instance_parameter_value hps_0 {TIMING_TIS} {180}
set_instance_parameter_value hps_0 {TIMING_TIH} {140}
set_instance_parameter_value hps_0 {TIMING_TDS} {30}
set_instance_parameter_value hps_0 {TIMING_TDH} {65}
set_instance_parameter_value hps_0 {TIMING_TDQSQ} {125}
set_instance_parameter_value hps_0 {TIMING_TQHS} {300}
set_instance_parameter_value hps_0 {TIMING_TQH} {0.38}
set_instance_parameter_value hps_0 {TIMING_TDQSCK} {255}
set_instance_parameter_value hps_0 {TIMING_TDQSCKDS} {450}
set_instance_parameter_value hps_0 {TIMING_TDQSCKDM} {900}
set_instance_parameter_value hps_0 {TIMING_TDQSCKDL} {1200}
set_instance_parameter_value hps_0 {TIMING_TDQSS} {0.25}
set_instance_parameter_value hps_0 {TIMING_TDQSH} {0.35}
set_instance_parameter_value hps_0 {TIMING_TQSH} {0.4}
set_instance_parameter_value hps_0 {TIMING_TDSH} {0.2}
set_instance_parameter_value hps_0 {TIMING_TDSS} {0.2}
set_instance_parameter_value hps_0 {MEM_TINIT_US} {500}
set_instance_parameter_value hps_0 {MEM_TMRD_CK} {4}
set_instance_parameter_value hps_0 {MEM_TRAS_NS} {35.0}
set_instance_parameter_value hps_0 {MEM_TRCD_NS} {13.75}
set_instance_parameter_value hps_0 {MEM_TRP_NS} {13.75}
set_instance_parameter_value hps_0 {MEM_TREFI_US} {7.8}
set_instance_parameter_value hps_0 {MEM_TRFC_NS} {260.0}
set_instance_parameter_value hps_0 {CFG_TCCD_NS} {2.5}
set_instance_parameter_value hps_0 {MEM_TWR_NS} {15.0}
set_instance_parameter_value hps_0 {MEM_TWTR} {4}
set_instance_parameter_value hps_0 {MEM_TFAW_NS} {30.0}
set_instance_parameter_value hps_0 {MEM_TRRD_NS} {7.5}
set_instance_parameter_value hps_0 {MEM_TRTP_NS} {7.5}
set_instance_parameter_value hps_0 {POWER_OF_TWO_BUS} {0}
set_instance_parameter_value hps_0 {SOPC_COMPAT_RESET} {0}
set_instance_parameter_value hps_0 {AVL_MAX_SIZE} {4}
set_instance_parameter_value hps_0 {BYTE_ENABLE} {1}
set_instance_parameter_value hps_0 {ENABLE_CTRL_AVALON_INTERFACE} {1}
set_instance_parameter_value hps_0 {CTL_DEEP_POWERDN_EN} {0}
set_instance_parameter_value hps_0 {CTL_SELF_REFRESH_EN} {0}
set_instance_parameter_value hps_0 {AUTO_POWERDN_EN} {0}
set_instance_parameter_value hps_0 {AUTO_PD_CYCLES} {0}
set_instance_parameter_value hps_0 {CTL_USR_REFRESH_EN} {0}
set_instance_parameter_value hps_0 {CTL_AUTOPCH_EN} {0}
set_instance_parameter_value hps_0 {CTL_ZQCAL_EN} {0}
set_instance_parameter_value hps_0 {ADDR_ORDER} {0}
set_instance_parameter_value hps_0 {CTL_LOOK_AHEAD_DEPTH} {4}
set_instance_parameter_value hps_0 {CONTROLLER_LATENCY} {5}
set_instance_parameter_value hps_0 {CFG_REORDER_DATA} {1}
set_instance_parameter_value hps_0 {STARVE_LIMIT} {10}
set_instance_parameter_value hps_0 {CTL_CSR_ENABLED} {0}
set_instance_parameter_value hps_0 {CTL_CSR_CONNECTION} {INTERNAL_JTAG}
set_instance_parameter_value hps_0 {CTL_ECC_ENABLED} {0}
set_instance_parameter_value hps_0 {CTL_HRB_ENABLED} {0}
set_instance_parameter_value hps_0 {CTL_ECC_AUTO_CORRECTION_ENABLED} {0}
set_instance_parameter_value hps_0 {MULTICAST_EN} {0}
set_instance_parameter_value hps_0 {CTL_DYNAMIC_BANK_ALLOCATION} {0}
set_instance_parameter_value hps_0 {CTL_DYNAMIC_BANK_NUM} {4}
set_instance_parameter_value hps_0 {DEBUG_MODE} {0}
set_instance_parameter_value hps_0 {ENABLE_BURST_MERGE} {0}
set_instance_parameter_value hps_0 {CTL_ENABLE_BURST_INTERRUPT} {1}
set_instance_parameter_value hps_0 {CTL_ENABLE_BURST_TERMINATE} {1}
set_instance_parameter_value hps_0 {LOCAL_ID_WIDTH} {8}
set_instance_parameter_value hps_0 {WRBUFFER_ADDR_WIDTH} {6}
set_instance_parameter_value hps_0 {MAX_PENDING_WR_CMD} {8}
set_instance_parameter_value hps_0 {MAX_PENDING_RD_CMD} {16}
set_instance_parameter_value hps_0 {USE_MM_ADAPTOR} {1}
set_instance_parameter_value hps_0 {USE_AXI_ADAPTOR} {0}
set_instance_parameter_value hps_0 {HCX_COMPAT_MODE} {0}
set_instance_parameter_value hps_0 {CTL_CMD_QUEUE_DEPTH} {8}
set_instance_parameter_value hps_0 {CTL_CSR_READ_ONLY} {1}
set_instance_parameter_value hps_0 {CFG_DATA_REORDERING_TYPE} {INTER_BANK}
set_instance_parameter_value hps_0 {NUM_OF_PORTS} {1}
set_instance_parameter_value hps_0 {ENABLE_BONDING} {0}
set_instance_parameter_value hps_0 {ENABLE_USER_ECC} {0}
set_instance_parameter_value hps_0 {AVL_DATA_WIDTH_PORT} {32 32 32 32 32 32}
set_instance_parameter_value hps_0 {PRIORITY_PORT} {1 1 1 1 1 1}
set_instance_parameter_value hps_0 {WEIGHT_PORT} {0 0 0 0 0 0}
set_instance_parameter_value hps_0 {CPORT_TYPE_PORT} {Bidirectional Bidirectional Bidirectional Bidirectional Bidirectional Bidirectional}
set_instance_parameter_value hps_0 {ENABLE_EMIT_BFM_MASTER} {0}
set_instance_parameter_value hps_0 {FORCE_SEQUENCER_TCL_DEBUG_MODE} {0}
set_instance_parameter_value hps_0 {ENABLE_SEQUENCER_MARGINING_ON_BY_DEFAULT} {0}
set_instance_parameter_value hps_0 {REF_CLK_FREQ} {25.0}
set_instance_parameter_value hps_0 {REF_CLK_FREQ_PARAM_VALID} {0}
set_instance_parameter_value hps_0 {REF_CLK_FREQ_MIN_PARAM} {0.0}
set_instance_parameter_value hps_0 {REF_CLK_FREQ_MAX_PARAM} {0.0}
set_instance_parameter_value hps_0 {PLL_DR_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps_0 {PLL_DR_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_DR_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_DR_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_DR_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_DR_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_MEM_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps_0 {PLL_MEM_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_MEM_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_MEM_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_MEM_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_MEM_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_AFI_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps_0 {PLL_AFI_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_AFI_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_AFI_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_AFI_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_AFI_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_WRITE_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps_0 {PLL_WRITE_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_WRITE_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_WRITE_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_WRITE_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_WRITE_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_ADDR_CMD_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps_0 {PLL_ADDR_CMD_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_ADDR_CMD_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_ADDR_CMD_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_ADDR_CMD_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_ADDR_CMD_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_AFI_HALF_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps_0 {PLL_AFI_HALF_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_AFI_HALF_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_AFI_HALF_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_AFI_HALF_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_AFI_HALF_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_NIOS_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps_0 {PLL_NIOS_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_NIOS_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_NIOS_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_NIOS_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_NIOS_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_CONFIG_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps_0 {PLL_CONFIG_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_CONFIG_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_CONFIG_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_CONFIG_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_CONFIG_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_P2C_READ_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps_0 {PLL_P2C_READ_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_P2C_READ_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_P2C_READ_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_P2C_READ_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_P2C_READ_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_C2P_WRITE_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps_0 {PLL_C2P_WRITE_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_C2P_WRITE_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_C2P_WRITE_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_C2P_WRITE_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_C2P_WRITE_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_HR_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps_0 {PLL_HR_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_HR_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_HR_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_HR_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_HR_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_AFI_PHY_CLK_FREQ_PARAM} {0.0}
set_instance_parameter_value hps_0 {PLL_AFI_PHY_CLK_FREQ_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_AFI_PHY_CLK_PHASE_PS_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_AFI_PHY_CLK_PHASE_PS_SIM_STR_PARAM} {}
set_instance_parameter_value hps_0 {PLL_AFI_PHY_CLK_MULT_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_AFI_PHY_CLK_DIV_PARAM} {0}
set_instance_parameter_value hps_0 {PLL_CLK_PARAM_VALID} {0}
set_instance_parameter_value hps_0 {ENABLE_EXTRA_REPORTING} {0}
set_instance_parameter_value hps_0 {NUM_EXTRA_REPORT_PATH} {10}
set_instance_parameter_value hps_0 {ENABLE_ISS_PROBES} {0}
set_instance_parameter_value hps_0 {CALIB_REG_WIDTH} {8}
set_instance_parameter_value hps_0 {USE_SEQUENCER_BFM} {0}
set_instance_parameter_value hps_0 {PLL_SHARING_MODE} {None}
set_instance_parameter_value hps_0 {NUM_PLL_SHARING_INTERFACES} {1}
set_instance_parameter_value hps_0 {EXPORT_AFI_HALF_CLK} {0}
set_instance_parameter_value hps_0 {ABSTRACT_REAL_COMPARE_TEST} {0}
set_instance_parameter_value hps_0 {INCLUDE_BOARD_DELAY_MODEL} {0}
set_instance_parameter_value hps_0 {INCLUDE_MULTIRANK_BOARD_DELAY_MODEL} {0}
set_instance_parameter_value hps_0 {USE_FAKE_PHY} {0}
set_instance_parameter_value hps_0 {FORCE_MAX_LATENCY_COUNT_WIDTH} {0}
set_instance_parameter_value hps_0 {ENABLE_NON_DESTRUCTIVE_CALIB} {0}
set_instance_parameter_value hps_0 {FIX_READ_LATENCY} {8}
set_instance_parameter_value hps_0 {ENABLE_DELAY_CHAIN_WRITE} {0}
set_instance_parameter_value hps_0 {TRACKING_ERROR_TEST} {0}
set_instance_parameter_value hps_0 {TRACKING_WATCH_TEST} {0}
set_instance_parameter_value hps_0 {MARGIN_VARIATION_TEST} {0}
set_instance_parameter_value hps_0 {AC_ROM_USER_ADD_0} {0_0000_0000_0000}
set_instance_parameter_value hps_0 {AC_ROM_USER_ADD_1} {0_0000_0000_1000}
set_instance_parameter_value hps_0 {TREFI} {35100}
set_instance_parameter_value hps_0 {REFRESH_INTERVAL} {15000}
set_instance_parameter_value hps_0 {ENABLE_NON_DES_CAL_TEST} {0}
set_instance_parameter_value hps_0 {TRFC} {350}
set_instance_parameter_value hps_0 {ENABLE_NON_DES_CAL} {0}
set_instance_parameter_value hps_0 {EXTRA_SETTINGS} {}
set_instance_parameter_value hps_0 {MEM_DEVICE} {MISSING_MODEL}
set_instance_parameter_value hps_0 {FORCE_SYNTHESIS_LANGUAGE} {}
set_instance_parameter_value hps_0 {FORCED_NUM_WRITE_FR_CYCLE_SHIFTS} {0}
set_instance_parameter_value hps_0 {SEQUENCER_TYPE} {NIOS}
set_instance_parameter_value hps_0 {ADVERTIZE_SEQUENCER_SW_BUILD_FILES} {0}
set_instance_parameter_value hps_0 {FORCED_NON_LDC_ADDR_CMD_MEM_CK_INVERT} {0}
set_instance_parameter_value hps_0 {PHY_ONLY} {0}
set_instance_parameter_value hps_0 {SEQ_MODE} {0}
set_instance_parameter_value hps_0 {ADVANCED_CK_PHASES} {0}
set_instance_parameter_value hps_0 {COMMAND_PHASE} {0.0}
set_instance_parameter_value hps_0 {MEM_CK_PHASE} {0.0}
set_instance_parameter_value hps_0 {P2C_READ_CLOCK_ADD_PHASE} {0.0}
set_instance_parameter_value hps_0 {C2P_WRITE_CLOCK_ADD_PHASE} {0.0}
set_instance_parameter_value hps_0 {ACV_PHY_CLK_ADD_FR_PHASE} {0.0}
set_instance_parameter_value hps_0 {MEM_VOLTAGE} {1.5V DDR3}
set_instance_parameter_value hps_0 {PLL_LOCATION} {Top_Bottom}
set_instance_parameter_value hps_0 {SKIP_MEM_INIT} {1}
set_instance_parameter_value hps_0 {READ_DQ_DQS_CLOCK_SOURCE} {INVERTED_DQS_BUS}
set_instance_parameter_value hps_0 {DQ_INPUT_REG_USE_CLKN} {0}
set_instance_parameter_value hps_0 {DQS_DQSN_MODE} {DIFFERENTIAL}
set_instance_parameter_value hps_0 {AFI_DEBUG_INFO_WIDTH} {32}
set_instance_parameter_value hps_0 {CALIBRATION_MODE} {Skip}
set_instance_parameter_value hps_0 {NIOS_ROM_DATA_WIDTH} {32}
set_instance_parameter_value hps_0 {READ_FIFO_SIZE} {8}
set_instance_parameter_value hps_0 {PHY_CSR_ENABLED} {0}
set_instance_parameter_value hps_0 {PHY_CSR_CONNECTION} {INTERNAL_JTAG}
set_instance_parameter_value hps_0 {USER_DEBUG_LEVEL} {1}
set_instance_parameter_value hps_0 {TIMING_BOARD_DERATE_METHOD} {AUTO}
set_instance_parameter_value hps_0 {TIMING_BOARD_CK_CKN_SLEW_RATE} {2.0}
set_instance_parameter_value hps_0 {TIMING_BOARD_AC_SLEW_RATE} {1.0}
set_instance_parameter_value hps_0 {TIMING_BOARD_DQS_DQSN_SLEW_RATE} {2.0}
set_instance_parameter_value hps_0 {TIMING_BOARD_DQ_SLEW_RATE} {1.0}
set_instance_parameter_value hps_0 {TIMING_BOARD_TIS} {0.0}
set_instance_parameter_value hps_0 {TIMING_BOARD_TIH} {0.0}
set_instance_parameter_value hps_0 {TIMING_BOARD_TDS} {0.0}
set_instance_parameter_value hps_0 {TIMING_BOARD_TDH} {0.0}
set_instance_parameter_value hps_0 {TIMING_BOARD_ISI_METHOD} {AUTO}
set_instance_parameter_value hps_0 {TIMING_BOARD_AC_EYE_REDUCTION_SU} {0.0}
set_instance_parameter_value hps_0 {TIMING_BOARD_AC_EYE_REDUCTION_H} {0.0}
set_instance_parameter_value hps_0 {TIMING_BOARD_DQ_EYE_REDUCTION} {0.0}
set_instance_parameter_value hps_0 {TIMING_BOARD_DELTA_DQS_ARRIVAL_TIME} {0.0}
set_instance_parameter_value hps_0 {TIMING_BOARD_READ_DQ_EYE_REDUCTION} {0.0}
set_instance_parameter_value hps_0 {TIMING_BOARD_DELTA_READ_DQS_ARRIVAL_TIME} {0.0}
set_instance_parameter_value hps_0 {PACKAGE_DESKEW} {0}
set_instance_parameter_value hps_0 {AC_PACKAGE_DESKEW} {0}
set_instance_parameter_value hps_0 {TIMING_BOARD_MAX_CK_DELAY} {0.03}
set_instance_parameter_value hps_0 {TIMING_BOARD_MAX_DQS_DELAY} {0.02}
set_instance_parameter_value hps_0 {TIMING_BOARD_SKEW_CKDQS_DIMM_MIN} {0.09}
set_instance_parameter_value hps_0 {TIMING_BOARD_SKEW_CKDQS_DIMM_MAX} {0.16}
set_instance_parameter_value hps_0 {TIMING_BOARD_SKEW_BETWEEN_DIMMS} {0.05}
set_instance_parameter_value hps_0 {TIMING_BOARD_SKEW_WITHIN_DQS} {0.01}
set_instance_parameter_value hps_0 {TIMING_BOARD_SKEW_BETWEEN_DQS} {0.08}
set_instance_parameter_value hps_0 {TIMING_BOARD_DQ_TO_DQS_SKEW} {0.0}
set_instance_parameter_value hps_0 {TIMING_BOARD_AC_SKEW} {0.03}
set_instance_parameter_value hps_0 {TIMING_BOARD_AC_TO_CK_SKEW} {0.0}
set_instance_parameter_value hps_0 {RATE} {Full}
set_instance_parameter_value hps_0 {MEM_CLK_FREQ} {400.0}
set_instance_parameter_value hps_0 {USE_MEM_CLK_FREQ} {0}
set_instance_parameter_value hps_0 {FORCE_DQS_TRACKING} {AUTO}
set_instance_parameter_value hps_0 {FORCE_SHADOW_REGS} {AUTO}
set_instance_parameter_value hps_0 {MRS_MIRROR_PING_PONG_ATSO} {0}
set_instance_parameter_value hps_0 {PARSE_FRIENDLY_DEVICE_FAMILY_PARAM_VALID} {0}
set_instance_parameter_value hps_0 {PARSE_FRIENDLY_DEVICE_FAMILY_PARAM} {}
set_instance_parameter_value hps_0 {DEVICE_FAMILY_PARAM} {}
set_instance_parameter_value hps_0 {SPEED_GRADE} {7}
set_instance_parameter_value hps_0 {IS_ES_DEVICE} {0}
set_instance_parameter_value hps_0 {DISABLE_CHILD_MESSAGING} {0}
set_instance_parameter_value hps_0 {HARD_EMIF} {1}
set_instance_parameter_value hps_0 {HHP_HPS} {1}
set_instance_parameter_value hps_0 {HHP_HPS_VERIFICATION} {0}
set_instance_parameter_value hps_0 {HHP_HPS_SIMULATION} {0}
set_instance_parameter_value hps_0 {HPS_PROTOCOL} {DDR3}
set_instance_parameter_value hps_0 {CUT_NEW_FAMILY_TIMING} {1}
set_instance_parameter_value hps_0 {ENABLE_EXPORT_SEQ_DEBUG_BRIDGE} {0}
set_instance_parameter_value hps_0 {CORE_DEBUG_CONNECTION} {EXPORT}
set_instance_parameter_value hps_0 {ADD_EXTERNAL_SEQ_DEBUG_NIOS} {0}
set_instance_parameter_value hps_0 {ED_EXPORT_SEQ_DEBUG} {0}
set_instance_parameter_value hps_0 {ADD_EFFICIENCY_MONITOR} {0}
set_instance_parameter_value hps_0 {ENABLE_ABS_RAM_MEM_INIT} {0}
set_instance_parameter_value hps_0 {ABS_RAM_MEM_INIT_FILENAME} {meminit}
set_instance_parameter_value hps_0 {DLL_SHARING_MODE} {None}
set_instance_parameter_value hps_0 {NUM_DLL_SHARING_INTERFACES} {1}
set_instance_parameter_value hps_0 {OCT_SHARING_MODE} {None}
set_instance_parameter_value hps_0 {NUM_OCT_SHARING_INTERFACES} {1}
set_instance_parameter_value hps_0 {show_advanced_parameters} {0}
set_instance_parameter_value hps_0 {configure_advanced_parameters} {0}
set_instance_parameter_value hps_0 {customize_device_pll_info} {0}
set_instance_parameter_value hps_0 {device_pll_info_manual} {{320000000 1600000000} {320000000 1000000000} {800000000 400000000 400000000}}
set_instance_parameter_value hps_0 {show_debug_info_as_warning_msg} {0}
set_instance_parameter_value hps_0 {show_warning_as_error_msg} {0}
set_instance_parameter_value hps_0 {eosc1_clk_mhz} {25.0}
set_instance_parameter_value hps_0 {eosc2_clk_mhz} {25.0}
set_instance_parameter_value hps_0 {F2SCLK_SDRAMCLK_Enable} {0}
set_instance_parameter_value hps_0 {F2SCLK_PERIPHCLK_Enable} {0}
set_instance_parameter_value hps_0 {periph_pll_source} {0}
set_instance_parameter_value hps_0 {sdmmc_clk_source} {2}
set_instance_parameter_value hps_0 {nand_clk_source} {2}
set_instance_parameter_value hps_0 {qspi_clk_source} {1}
set_instance_parameter_value hps_0 {l4_mp_clk_source} {1}
set_instance_parameter_value hps_0 {l4_sp_clk_source} {1}
set_instance_parameter_value hps_0 {use_default_mpu_clk} {1}
set_instance_parameter_value hps_0 {desired_mpu_clk_mhz} {800.0}
set_instance_parameter_value hps_0 {l3_mp_clk_div} {1}
set_instance_parameter_value hps_0 {l3_sp_clk_div} {1}
set_instance_parameter_value hps_0 {dbctrl_stayosc1} {1}
set_instance_parameter_value hps_0 {dbg_at_clk_div} {0}
set_instance_parameter_value hps_0 {dbg_clk_div} {1}
set_instance_parameter_value hps_0 {dbg_trace_clk_div} {0}
set_instance_parameter_value hps_0 {desired_l4_mp_clk_mhz} {100.0}
set_instance_parameter_value hps_0 {desired_l4_sp_clk_mhz} {100.0}
set_instance_parameter_value hps_0 {desired_cfg_clk_mhz} {100.0}
set_instance_parameter_value hps_0 {desired_sdmmc_clk_mhz} {200.0}
set_instance_parameter_value hps_0 {desired_nand_clk_mhz} {12.5}
set_instance_parameter_value hps_0 {desired_qspi_clk_mhz} {400.0}
set_instance_parameter_value hps_0 {desired_emac0_clk_mhz} {250.0}
set_instance_parameter_value hps_0 {desired_emac1_clk_mhz} {250.0}
set_instance_parameter_value hps_0 {desired_usb_mp_clk_mhz} {200.0}
set_instance_parameter_value hps_0 {desired_spi_m_clk_mhz} {200.0}
set_instance_parameter_value hps_0 {desired_can0_clk_mhz} {100.0}
set_instance_parameter_value hps_0 {desired_can1_clk_mhz} {100.0}
set_instance_parameter_value hps_0 {desired_gpio_db_clk_hz} {32000}
set_instance_parameter_value hps_0 {S2FCLK_USER0CLK_Enable} {0}
set_instance_parameter_value hps_0 {S2FCLK_USER1CLK_Enable} {0}
set_instance_parameter_value hps_0 {S2FCLK_USER2CLK_Enable} {0}
set_instance_parameter_value hps_0 {S2FCLK_USER1CLK_FREQ} {100.0}
set_instance_parameter_value hps_0 {S2FCLK_USER2CLK_FREQ} {100.0}
set_instance_parameter_value hps_0 {S2FCLK_USER2CLK} {1}
set_instance_parameter_value hps_0 {main_pll_m} {63}
set_instance_parameter_value hps_0 {main_pll_n} {0}
set_instance_parameter_value hps_0 {main_pll_c3} {3}
set_instance_parameter_value hps_0 {main_pll_c4} {3}
set_instance_parameter_value hps_0 {main_pll_c5} {15}
set_instance_parameter_value hps_0 {periph_pll_m} {79}
set_instance_parameter_value hps_0 {periph_pll_n} {1}
set_instance_parameter_value hps_0 {periph_pll_c0} {3}
set_instance_parameter_value hps_0 {periph_pll_c1} {3}
set_instance_parameter_value hps_0 {periph_pll_c2} {1}
set_instance_parameter_value hps_0 {periph_pll_c3} {19}
set_instance_parameter_value hps_0 {periph_pll_c4} {4}
set_instance_parameter_value hps_0 {periph_pll_c5} {9}
set_instance_parameter_value hps_0 {usb_mp_clk_div} {0}
set_instance_parameter_value hps_0 {spi_m_clk_div} {0}
set_instance_parameter_value hps_0 {can0_clk_div} {1}
set_instance_parameter_value hps_0 {can1_clk_div} {1}
set_instance_parameter_value hps_0 {gpio_db_clk_div} {6249}
set_instance_parameter_value hps_0 {l4_mp_clk_div} {1}
set_instance_parameter_value hps_0 {l4_sp_clk_div} {1}
set_instance_parameter_value hps_0 {MPU_EVENTS_Enable} {0}
set_instance_parameter_value hps_0 {GP_Enable} {0}
set_instance_parameter_value hps_0 {DEBUGAPB_Enable} {0}
set_instance_parameter_value hps_0 {STM_Enable} {0}
set_instance_parameter_value hps_0 {CTI_Enable} {0}
set_instance_parameter_value hps_0 {TPIUFPGA_Enable} {0}
set_instance_parameter_value hps_0 {TPIUFPGA_alt} {0}
set_instance_parameter_value hps_0 {BOOTFROMFPGA_Enable} {1}
set_instance_parameter_value hps_0 {TEST_Enable} {0}
set_instance_parameter_value hps_0 {HLGPI_Enable} {0}
set_instance_parameter_value hps_0 {BSEL_EN} {0}
set_instance_parameter_value hps_0 {BSEL} {1}
set_instance_parameter_value hps_0 {CSEL_EN} {0}
set_instance_parameter_value hps_0 {CSEL} {0}
set_instance_parameter_value hps_0 {F2S_Width} {3}
set_instance_parameter_value hps_0 {S2F_Width} {2}
set_instance_parameter_value hps_0 {LWH2F_Enable} {true}
set_instance_parameter_value hps_0 {F2SDRAM_Type} {}
set_instance_parameter_value hps_0 {F2SDRAM_Width} {}
set_instance_parameter_value hps_0 {BONDING_OUT_ENABLED} {0}
set_instance_parameter_value hps_0 {S2FCLK_COLDRST_Enable} {0}
set_instance_parameter_value hps_0 {S2FCLK_PENDINGRST_Enable} {0}
set_instance_parameter_value hps_0 {F2SCLK_DBGRST_Enable} {0}
set_instance_parameter_value hps_0 {F2SCLK_WARMRST_Enable} {0}
set_instance_parameter_value hps_0 {F2SCLK_COLDRST_Enable} {0}
set_instance_parameter_value hps_0 {DMA_Enable} {No No No No No No No No}
set_instance_parameter_value hps_0 {F2SINTERRUPT_Enable} {1}
set_instance_parameter_value hps_0 {S2FINTERRUPT_CAN_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_CLOCKPERIPHERAL_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_CTI_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_DMA_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_EMAC_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_FPGAMANAGER_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_GPIO_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_I2CEMAC_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_I2CPERIPHERAL_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_L4TIMER_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_NAND_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_OSCTIMER_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_QSPI_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_SDMMC_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_SPIMASTER_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_SPISLAVE_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_UART_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_USB_Enable} {0}
set_instance_parameter_value hps_0 {S2FINTERRUPT_WATCHDOG_Enable} {0}
set_instance_parameter_value hps_0 {EMAC0_PTP} {0}
set_instance_parameter_value hps_0 {EMAC1_PTP} {0}
set_instance_parameter_value hps_0 {EMAC0_PinMuxing} {Unused}
set_instance_parameter_value hps_0 {EMAC0_Mode} {N/A}
set_instance_parameter_value hps_0 {EMAC1_PinMuxing} {HPS I/O Set 0}
set_instance_parameter_value hps_0 {EMAC1_Mode} {RGMII}
set_instance_parameter_value hps_0 {NAND_PinMuxing} {Unused}
set_instance_parameter_value hps_0 {NAND_Mode} {N/A}
set_instance_parameter_value hps_0 {QSPI_PinMuxing} {HPS I/O Set 0}
set_instance_parameter_value hps_0 {QSPI_Mode} {1 SS}
set_instance_parameter_value hps_0 {SDIO_PinMuxing} {HPS I/O Set 0}
set_instance_parameter_value hps_0 {SDIO_Mode} {4-bit Data}
set_instance_parameter_value hps_0 {USB0_PinMuxing} {Unused}
set_instance_parameter_value hps_0 {USB0_Mode} {N/A}
set_instance_parameter_value hps_0 {USB1_PinMuxing} {HPS I/O Set 0}
set_instance_parameter_value hps_0 {USB1_Mode} {SDR}
set_instance_parameter_value hps_0 {SPIM0_PinMuxing} {Unused}
set_instance_parameter_value hps_0 {SPIM0_Mode} {N/A}
set_instance_parameter_value hps_0 {SPIM1_PinMuxing} {HPS I/O Set 0}
set_instance_parameter_value hps_0 {SPIM1_Mode} {Single Slave Select}
set_instance_parameter_value hps_0 {SPIS0_PinMuxing} {Unused}
set_instance_parameter_value hps_0 {SPIS0_Mode} {N/A}
set_instance_parameter_value hps_0 {SPIS1_PinMuxing} {Unused}
set_instance_parameter_value hps_0 {SPIS1_Mode} {N/A}
set_instance_parameter_value hps_0 {UART0_PinMuxing} {HPS I/O Set 0}
set_instance_parameter_value hps_0 {UART0_Mode} {No Flow Control}
set_instance_parameter_value hps_0 {UART1_PinMuxing} {Unused}
set_instance_parameter_value hps_0 {UART1_Mode} {N/A}
set_instance_parameter_value hps_0 {I2C0_PinMuxing} {HPS I/O Set 0}
set_instance_parameter_value hps_0 {I2C0_Mode} {I2C}
set_instance_parameter_value hps_0 {I2C1_PinMuxing} {HPS I/O Set 0}
set_instance_parameter_value hps_0 {I2C1_Mode} {I2C}
set_instance_parameter_value hps_0 {I2C2_PinMuxing} {Unused}
set_instance_parameter_value hps_0 {I2C2_Mode} {N/A}
set_instance_parameter_value hps_0 {I2C3_PinMuxing} {Unused}
set_instance_parameter_value hps_0 {I2C3_Mode} {N/A}
set_instance_parameter_value hps_0 {CAN0_PinMuxing} {Unused}
set_instance_parameter_value hps_0 {CAN0_Mode} {N/A}
set_instance_parameter_value hps_0 {CAN1_PinMuxing} {Unused}
set_instance_parameter_value hps_0 {CAN1_Mode} {N/A}
set_instance_parameter_value hps_0 {TRACE_PinMuxing} {Unused}
set_instance_parameter_value hps_0 {TRACE_Mode} {N/A}
set_instance_parameter_value hps_0 {GPIO_Enable} {No No No No No No No No No Yes No No No No No No No No No No No No No No No No No No No No No No No No No Yes No No No No Yes No No No No No No No Yes No No No No Yes Yes No No No No No No Yes No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No}
set_instance_parameter_value hps_0 {LOANIO_Enable} {No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No No}
set_instance_parameter_value hps_0 {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_EMAC0_MD_CLK} {100.0}
set_instance_parameter_value hps_0 {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_EMAC0_GTX_CLK} {100}
set_instance_parameter_value hps_0 {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_EMAC1_MD_CLK} {100.0}
set_instance_parameter_value hps_0 {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_EMAC1_GTX_CLK} {100}
set_instance_parameter_value hps_0 {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_QSPI_SCLK_OUT} {100}
set_instance_parameter_value hps_0 {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_SDIO_CCLK} {100}
set_instance_parameter_value hps_0 {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_SPIM0_SCLK_OUT} {100}
set_instance_parameter_value hps_0 {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_SPIM1_SCLK_OUT} {100}
set_instance_parameter_value hps_0 {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_I2C0_CLK} {100}
set_instance_parameter_value hps_0 {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_I2C1_CLK} {100}
set_instance_parameter_value hps_0 {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_I2C2_CLK} {100}
set_instance_parameter_value hps_0 {FPGA_PERIPHERAL_OUTPUT_CLOCK_FREQ_I2C3_CLK} {100}

add_instance intr_capturer_0 intr_capturer  
set_instance_parameter_value intr_capturer_0 {NUM_INTR} {32}

add_instance jtag_uart altera_avalon_jtag_uart 16.1
set_instance_parameter_value jtag_uart {allowMultipleConnections} {1}
set_instance_parameter_value jtag_uart {hubInstanceID} {0}
set_instance_parameter_value jtag_uart {readBufferDepth} {64}
set_instance_parameter_value jtag_uart {readIRQThreshold} {8}
set_instance_parameter_value jtag_uart {simInputCharacterStream} {}
set_instance_parameter_value jtag_uart {simInteractiveOptions} {INTERACTIVE_ASCII_OUTPUT}
set_instance_parameter_value jtag_uart {useRegistersForReadBuffer} {0}
set_instance_parameter_value jtag_uart {useRegistersForWriteBuffer} {0}
set_instance_parameter_value jtag_uart {useRelativePathForSimFile} {0}
set_instance_parameter_value jtag_uart {writeBufferDepth} {64}
set_instance_parameter_value jtag_uart {writeIRQThreshold} {8}

add_instance led_pio altera_avalon_pio 16.1
set_instance_parameter_value led_pio {bitClearingEdgeCapReg} {0}
set_instance_parameter_value led_pio {bitModifyingOutReg} {0}
set_instance_parameter_value led_pio {captureEdge} {0}
set_instance_parameter_value led_pio {direction} {Output}
set_instance_parameter_value led_pio {edgeType} {RISING}
set_instance_parameter_value led_pio {generateIRQ} {0}
set_instance_parameter_value led_pio {irqType} {LEVEL}
set_instance_parameter_value led_pio {resetValue} {0.0}
set_instance_parameter_value led_pio {simDoTestBenchWiring} {0}
set_instance_parameter_value led_pio {simDrivenValue} {0.0}
set_instance_parameter_value led_pio {width} {10}

add_instance master_non_sec altera_jtag_avalon_master 16.1
set_instance_parameter_value master_non_sec {USE_PLI} {0}
set_instance_parameter_value master_non_sec {PLI_PORT} {50000}
set_instance_parameter_value master_non_sec {FAST_VER} {0}
set_instance_parameter_value master_non_sec {FIFO_DEPTHS} {2}

add_instance master_secure altera_jtag_avalon_master 16.1
set_instance_parameter_value master_secure {USE_PLI} {0}
set_instance_parameter_value master_secure {PLI_PORT} {50000}
set_instance_parameter_value master_secure {FAST_VER} {0}
set_instance_parameter_value master_secure {FIFO_DEPTHS} {2}

add_instance pll_stream altera_pll 16.1
set_instance_parameter_value pll_stream {debug_print_output} {0}
set_instance_parameter_value pll_stream {debug_use_rbc_taf_method} {0}
set_instance_parameter_value pll_stream {gui_device_speed_grade} {2}
set_instance_parameter_value pll_stream {gui_pll_mode} {Fractional-N PLL}
set_instance_parameter_value pll_stream {gui_reference_clock_frequency} {50.0}
set_instance_parameter_value pll_stream {gui_channel_spacing} {0.0}
set_instance_parameter_value pll_stream {gui_operation_mode} {normal}
set_instance_parameter_value pll_stream {gui_feedback_clock} {Global Clock}
set_instance_parameter_value pll_stream {gui_fractional_cout} {32}
set_instance_parameter_value pll_stream {gui_dsm_out_sel} {1st_order}
set_instance_parameter_value pll_stream {gui_use_locked} {1}
set_instance_parameter_value pll_stream {gui_en_adv_params} {0}
set_instance_parameter_value pll_stream {gui_number_of_clocks} {1}
set_instance_parameter_value pll_stream {gui_multiply_factor} {1}
set_instance_parameter_value pll_stream {gui_frac_multiply_factor} {1.0}
set_instance_parameter_value pll_stream {gui_divide_factor_n} {1}
set_instance_parameter_value pll_stream {gui_cascade_counter0} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency0} {130.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c0} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency0} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units0} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift0} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg0} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift0} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle0} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter1} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency1} {130.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c1} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency1} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units1} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift1} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg1} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift1} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle1} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter2} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency2} {100.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c2} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency2} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units2} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift2} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg2} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift2} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle2} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter3} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency3} {100.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c3} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency3} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units3} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift3} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg3} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift3} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle3} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter4} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency4} {100.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c4} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency4} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units4} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift4} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg4} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift4} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle4} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter5} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency5} {100.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c5} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency5} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units5} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift5} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg5} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift5} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle5} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter6} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency6} {100.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c6} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency6} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units6} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift6} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg6} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift6} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle6} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter7} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency7} {100.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c7} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency7} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units7} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift7} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg7} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift7} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle7} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter8} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency8} {100.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c8} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency8} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units8} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift8} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg8} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift8} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle8} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter9} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency9} {100.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c9} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency9} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units9} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift9} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg9} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift9} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle9} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter10} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency10} {100.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c10} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency10} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units10} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift10} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg10} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift10} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle10} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter11} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency11} {100.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c11} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency11} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units11} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift11} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg11} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift11} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle11} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter12} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency12} {100.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c12} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency12} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units12} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift12} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg12} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift12} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle12} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter13} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency13} {100.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c13} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency13} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units13} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift13} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg13} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift13} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle13} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter14} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency14} {100.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c14} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency14} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units14} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift14} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg14} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift14} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle14} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter15} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency15} {100.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c15} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency15} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units15} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift15} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg15} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift15} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle15} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter16} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency16} {100.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c16} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency16} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units16} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift16} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg16} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift16} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle16} {50}
set_instance_parameter_value pll_stream {gui_cascade_counter17} {0}
set_instance_parameter_value pll_stream {gui_output_clock_frequency17} {100.0}
set_instance_parameter_value pll_stream {gui_divide_factor_c17} {1}
set_instance_parameter_value pll_stream {gui_actual_output_clock_frequency17} {0 MHz}
set_instance_parameter_value pll_stream {gui_ps_units17} {ps}
set_instance_parameter_value pll_stream {gui_phase_shift17} {0}
set_instance_parameter_value pll_stream {gui_phase_shift_deg17} {0.0}
set_instance_parameter_value pll_stream {gui_actual_phase_shift17} {0}
set_instance_parameter_value pll_stream {gui_duty_cycle17} {50}
set_instance_parameter_value pll_stream {gui_pll_auto_reset} {Off}
set_instance_parameter_value pll_stream {gui_pll_bandwidth_preset} {Auto}
set_instance_parameter_value pll_stream {gui_en_reconf} {0}
set_instance_parameter_value pll_stream {gui_en_dps_ports} {0}
set_instance_parameter_value pll_stream {gui_en_phout_ports} {0}
set_instance_parameter_value pll_stream {gui_phout_division} {1}
set_instance_parameter_value pll_stream {gui_mif_generate} {0}
set_instance_parameter_value pll_stream {gui_enable_mif_dps} {0}
set_instance_parameter_value pll_stream {gui_dps_cntr} {C0}
set_instance_parameter_value pll_stream {gui_dps_num} {1}
set_instance_parameter_value pll_stream {gui_dps_dir} {Positive}
set_instance_parameter_value pll_stream {gui_refclk_switch} {0}
set_instance_parameter_value pll_stream {gui_refclk1_frequency} {100.0}
set_instance_parameter_value pll_stream {gui_switchover_mode} {Automatic Switchover}
set_instance_parameter_value pll_stream {gui_switchover_delay} {0}
set_instance_parameter_value pll_stream {gui_active_clk} {0}
set_instance_parameter_value pll_stream {gui_clk_bad} {0}
set_instance_parameter_value pll_stream {gui_enable_cascade_out} {0}
set_instance_parameter_value pll_stream {gui_cascade_outclk_index} {0}
set_instance_parameter_value pll_stream {gui_enable_cascade_in} {0}
set_instance_parameter_value pll_stream {gui_pll_cascading_mode} {Create an adjpllin signal to connect with an upstream PLL}

add_instance sysid_qsys altera_avalon_sysid_qsys 16.1
set_instance_parameter_value sysid_qsys {id} {-1395322110}

# exported interfaces
add_interface alt_vip_itc_0_clocked_video conduit end
set_interface_property alt_vip_itc_0_clocked_video EXPORT_OF alt_vip_itc_0.clocked_video
add_interface button_pio_external_connection conduit end
set_interface_property button_pio_external_connection EXPORT_OF button_pio.external_connection
add_interface clk clock sink
set_interface_property clk EXPORT_OF clk_0.clk_in
add_interface dipsw_pio_external_connection conduit end
set_interface_property dipsw_pio_external_connection EXPORT_OF dipsw_pio.external_connection
add_interface hps_0_h2f_reset reset source
set_interface_property hps_0_h2f_reset EXPORT_OF hps_0.h2f_reset
add_interface hps_0_hps_io conduit end
set_interface_property hps_0_hps_io EXPORT_OF hps_0.hps_io
add_interface led_pio_external_connection conduit end
set_interface_property led_pio_external_connection EXPORT_OF led_pio.external_connection
add_interface memory conduit end
set_interface_property memory EXPORT_OF hps_0.memory
add_interface reset reset sink
set_interface_property reset EXPORT_OF clk_0.clk_in_reset

# connections and connection parameters
add_connection alt_vip_vfr_vga.avalon_master hps_0.f2h_axi_slave
set_connection_parameter_value alt_vip_vfr_vga.avalon_master/hps_0.f2h_axi_slave arbitrationPriority {1}
set_connection_parameter_value alt_vip_vfr_vga.avalon_master/hps_0.f2h_axi_slave baseAddress {0x0000}
set_connection_parameter_value alt_vip_vfr_vga.avalon_master/hps_0.f2h_axi_slave defaultConnection {0}

add_connection hps_0.h2f_lw_axi_master jtag_uart.avalon_jtag_slave
set_connection_parameter_value hps_0.h2f_lw_axi_master/jtag_uart.avalon_jtag_slave arbitrationPriority {1}
set_connection_parameter_value hps_0.h2f_lw_axi_master/jtag_uart.avalon_jtag_slave baseAddress {0x00020000}
set_connection_parameter_value hps_0.h2f_lw_axi_master/jtag_uart.avalon_jtag_slave defaultConnection {0}

add_connection hps_0.h2f_lw_axi_master alt_vip_vfr_vga.avalon_slave
set_connection_parameter_value hps_0.h2f_lw_axi_master/alt_vip_vfr_vga.avalon_slave arbitrationPriority {1}
set_connection_parameter_value hps_0.h2f_lw_axi_master/alt_vip_vfr_vga.avalon_slave baseAddress {0x0100}
set_connection_parameter_value hps_0.h2f_lw_axi_master/alt_vip_vfr_vga.avalon_slave defaultConnection {0}

add_connection hps_0.h2f_lw_axi_master sysid_qsys.control_slave
set_connection_parameter_value hps_0.h2f_lw_axi_master/sysid_qsys.control_slave arbitrationPriority {1}
set_connection_parameter_value hps_0.h2f_lw_axi_master/sysid_qsys.control_slave baseAddress {0x00010000}
set_connection_parameter_value hps_0.h2f_lw_axi_master/sysid_qsys.control_slave defaultConnection {0}

add_connection hps_0.h2f_lw_axi_master led_pio.s1
set_connection_parameter_value hps_0.h2f_lw_axi_master/led_pio.s1 arbitrationPriority {1}
set_connection_parameter_value hps_0.h2f_lw_axi_master/led_pio.s1 baseAddress {0x00010040}
set_connection_parameter_value hps_0.h2f_lw_axi_master/led_pio.s1 defaultConnection {0}

add_connection hps_0.h2f_lw_axi_master dipsw_pio.s1
set_connection_parameter_value hps_0.h2f_lw_axi_master/dipsw_pio.s1 arbitrationPriority {1}
set_connection_parameter_value hps_0.h2f_lw_axi_master/dipsw_pio.s1 baseAddress {0x00010080}
set_connection_parameter_value hps_0.h2f_lw_axi_master/dipsw_pio.s1 defaultConnection {0}

add_connection hps_0.h2f_lw_axi_master button_pio.s1
set_connection_parameter_value hps_0.h2f_lw_axi_master/button_pio.s1 arbitrationPriority {1}
set_connection_parameter_value hps_0.h2f_lw_axi_master/button_pio.s1 baseAddress {0x000100c0}
set_connection_parameter_value hps_0.h2f_lw_axi_master/button_pio.s1 defaultConnection {0}

add_connection master_non_sec.master jtag_uart.avalon_jtag_slave
set_connection_parameter_value master_non_sec.master/jtag_uart.avalon_jtag_slave arbitrationPriority {1}
set_connection_parameter_value master_non_sec.master/jtag_uart.avalon_jtag_slave baseAddress {0x00020000}
set_connection_parameter_value master_non_sec.master/jtag_uart.avalon_jtag_slave defaultConnection {0}

add_connection master_non_sec.master alt_vip_vfr_vga.avalon_slave
set_connection_parameter_value master_non_sec.master/alt_vip_vfr_vga.avalon_slave arbitrationPriority {1}
set_connection_parameter_value master_non_sec.master/alt_vip_vfr_vga.avalon_slave baseAddress {0x0100}
set_connection_parameter_value master_non_sec.master/alt_vip_vfr_vga.avalon_slave defaultConnection {0}

add_connection master_non_sec.master intr_capturer_0.avalon_slave_0
set_connection_parameter_value master_non_sec.master/intr_capturer_0.avalon_slave_0 arbitrationPriority {1}
set_connection_parameter_value master_non_sec.master/intr_capturer_0.avalon_slave_0 baseAddress {0x00030000}
set_connection_parameter_value master_non_sec.master/intr_capturer_0.avalon_slave_0 defaultConnection {0}

add_connection master_non_sec.master sysid_qsys.control_slave
set_connection_parameter_value master_non_sec.master/sysid_qsys.control_slave arbitrationPriority {1}
set_connection_parameter_value master_non_sec.master/sysid_qsys.control_slave baseAddress {0x00010000}
set_connection_parameter_value master_non_sec.master/sysid_qsys.control_slave defaultConnection {0}

add_connection master_secure.master hps_0.f2h_axi_slave
set_connection_parameter_value master_secure.master/hps_0.f2h_axi_slave arbitrationPriority {1}
set_connection_parameter_value master_secure.master/hps_0.f2h_axi_slave baseAddress {0x0000}
set_connection_parameter_value master_secure.master/hps_0.f2h_axi_slave defaultConnection {0}

add_connection master_non_sec.master led_pio.s1
set_connection_parameter_value master_non_sec.master/led_pio.s1 arbitrationPriority {1}
set_connection_parameter_value master_non_sec.master/led_pio.s1 baseAddress {0x00010040}
set_connection_parameter_value master_non_sec.master/led_pio.s1 defaultConnection {0}

add_connection master_non_sec.master dipsw_pio.s1
set_connection_parameter_value master_non_sec.master/dipsw_pio.s1 arbitrationPriority {1}
set_connection_parameter_value master_non_sec.master/dipsw_pio.s1 baseAddress {0x00010080}
set_connection_parameter_value master_non_sec.master/dipsw_pio.s1 defaultConnection {0}

add_connection master_non_sec.master button_pio.s1
set_connection_parameter_value master_non_sec.master/button_pio.s1 arbitrationPriority {1}
set_connection_parameter_value master_non_sec.master/button_pio.s1 baseAddress {0x000100c0}
set_connection_parameter_value master_non_sec.master/button_pio.s1 defaultConnection {0}

add_connection alt_vip_vfr_vga.avalon_streaming_source alt_vip_itc_0.din

add_connection clk_0.clk master_secure.clk

add_connection clk_0.clk sysid_qsys.clk

add_connection clk_0.clk led_pio.clk

add_connection clk_0.clk master_non_sec.clk

add_connection clk_0.clk dipsw_pio.clk

add_connection clk_0.clk button_pio.clk

add_connection clk_0.clk jtag_uart.clk

add_connection clk_0.clk intr_capturer_0.clock

add_connection clk_0.clk alt_vip_vfr_vga.clock_master

add_connection clk_0.clk hps_0.f2h_axi_clock

add_connection clk_0.clk hps_0.h2f_axi_clock

add_connection clk_0.clk hps_0.h2f_lw_axi_clock

add_connection clk_0.clk pll_stream.refclk

add_connection pll_stream.outclk0 alt_vip_vfr_vga.clock_reset

add_connection pll_stream.outclk0 alt_vip_itc_0.is_clk_rst

add_connection hps_0.f2h_irq0 jtag_uart.irq
set_connection_parameter_value hps_0.f2h_irq0/jtag_uart.irq irqNumber {0}

add_connection hps_0.f2h_irq0 button_pio.irq
set_connection_parameter_value hps_0.f2h_irq0/button_pio.irq irqNumber {1}

add_connection hps_0.f2h_irq0 dipsw_pio.irq
set_connection_parameter_value hps_0.f2h_irq0/dipsw_pio.irq irqNumber {2}

add_connection intr_capturer_0.interrupt_receiver jtag_uart.irq
set_connection_parameter_value intr_capturer_0.interrupt_receiver/jtag_uart.irq irqNumber {0}

add_connection intr_capturer_0.interrupt_receiver button_pio.irq
set_connection_parameter_value intr_capturer_0.interrupt_receiver/button_pio.irq irqNumber {1}

add_connection intr_capturer_0.interrupt_receiver dipsw_pio.irq
set_connection_parameter_value intr_capturer_0.interrupt_receiver/dipsw_pio.irq irqNumber {2}

add_connection clk_0.clk_reset master_secure.clk_reset

add_connection clk_0.clk_reset master_non_sec.clk_reset

add_connection clk_0.clk_reset alt_vip_vfr_vga.clock_master_reset

add_connection clk_0.clk_reset alt_vip_vfr_vga.clock_reset_reset

add_connection clk_0.clk_reset alt_vip_itc_0.is_clk_rst_reset

add_connection clk_0.clk_reset sysid_qsys.reset

add_connection clk_0.clk_reset led_pio.reset

add_connection clk_0.clk_reset dipsw_pio.reset

add_connection clk_0.clk_reset button_pio.reset

add_connection clk_0.clk_reset jtag_uart.reset

add_connection clk_0.clk_reset pll_stream.reset

add_connection clk_0.clk_reset intr_capturer_0.reset_sink

# interconnect requirements
set_interconnect_requirement {$system} {qsys_mm.clockCrossingAdapter} {HANDSHAKE}
set_interconnect_requirement {$system} {qsys_mm.maxAdditionalLatency} {1}

save_system {soc_system.qsys}
