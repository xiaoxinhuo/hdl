
## FIFO depth is 4Mb - 250k samples
set adc_fifo_address_width 15

## FIFO depth is 4Mb - 250k samples
set dac_fifo_address_width 15


source $ad_hdl_dir/projects/common/vcu118/vcu118_system_bd.tcl
source $ad_hdl_dir/projects/common/xilinx/adcfifo_bd.tcl
source $ad_hdl_dir/projects/common/xilinx/dacfifo_bd.tcl
source ../common/daq3_bd.tcl

ad_ip_parameter axi_ad9152_xcvr CONFIG.XCVR_TYPE 4
ad_ip_parameter axi_ad9680_xcvr CONFIG.XCVR_TYPE 4

ad_ip_parameter util_daq3_xcvr CONFIG.XCVR_TYPE 4
ad_ip_parameter util_daq3_xcvr CONFIG.QPLL_FBDIV 20
ad_ip_parameter util_daq3_xcvr CONFIG.QPLL_REFCLK_DIV 1
ad_ip_parameter util_daq3_xcvr CONFIG.QPLL_CFG0 0x331C
ad_ip_parameter util_daq3_xcvr CONFIG.QPLL_CFG1 0xD038
ad_ip_parameter util_daq3_xcvr CONFIG.QPLL_CFG2 0xFC1
ad_ip_parameter util_daq3_xcvr CONFIG.QPLL_CFG3 0x120
ad_ip_parameter util_daq3_xcvr CONFIG.QPLL_CFG4 0x2
ad_ip_parameter util_daq3_xcvr CONFIG.QPLL_CFG1_G3 0xD038
ad_ip_parameter util_daq3_xcvr CONFIG.QPLL_CFG2_G3 0xFC1

ad_ip_parameter util_daq3_xcvr CONFIG.CPLL_CFG0 0x3fe
ad_ip_parameter util_daq3_xcvr CONFIG.CPLL_CFG1 0x29
ad_ip_parameter util_daq3_xcvr CONFIG.CPLL_CFG2 0x203
ad_ip_parameter util_daq3_xcvr CONFIG.RX_CLK25_DIV 25
ad_ip_parameter util_daq3_xcvr CONFIG.TX_CLK25_DIV 25

delete_bd_objs [get_bd_intf_nets axi_mem_interconnect_M00_AXI]
delete_bd_objs [get_bd_intf_nets S00_AXI_2]
delete_bd_objs [get_bd_intf_nets S01_AXI_1]
delete_bd_objs [get_bd_intf_nets S03_AXI_1]
delete_bd_objs [get_bd_intf_nets S02_AXI_1]
delete_bd_objs [get_bd_intf_nets S04_AXI_1]
delete_bd_objs [get_bd_intf_nets S05_AXI_1]
delete_bd_objs [get_bd_intf_nets S06_AXI_1]
delete_bd_objs [get_bd_cells axi_mem_interconnect]

create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0
set_property -dict [list CONFIG.NUM_CLKS {2}] [get_bd_cells smartconnect_0]
set_property -dict [list CONFIG.NUM_SI {8}] [get_bd_cells smartconnect_0]
connect_bd_net [get_bd_pins smartconnect_0/aclk] [get_bd_pins axi_ddr_cntrl/c0_ddr4_ui_clk]
connect_bd_net [get_bd_pins smartconnect_0/aclk1] [get_bd_pins axi_ddr_cntrl/addn_ui_clkout1]
connect_bd_net [get_bd_pins smartconnect_0/aresetn] [get_bd_pins axi_ddr_cntrl_rstgen/peripheral_aresetn]
connect_bd_intf_net [get_bd_intf_pins axi_ddr_cntrl/C0_DDR4_S_AXI] [get_bd_intf_pins smartconnect_0/M00_AXI]
connect_bd_intf_net [get_bd_intf_pins sys_mb/M_AXI_DC] [get_bd_intf_pins smartconnect_0/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins sys_mb/M_AXI_IC] [get_bd_intf_pins smartconnect_0/S01_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ethernet_dma/M_AXI_SG] [get_bd_intf_pins smartconnect_0/S02_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ethernet_dma/M_AXI_MM2S] [get_bd_intf_pins smartconnect_0/S03_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ethernet_dma/M_AXI_S2MM] [get_bd_intf_pins smartconnect_0/S04_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ad9680_dma/m_dest_axi] [get_bd_intf_pins smartconnect_0/S05_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ad9152_dma/m_src_axi] [get_bd_intf_pins smartconnect_0/S06_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_ad9680_xcvr/m_axi] [get_bd_intf_pins smartconnect_0/S07_AXI]
