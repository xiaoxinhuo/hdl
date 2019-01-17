
set dac_fifo_name axi_ad9172_fifo
set dac_fifo_address_width 13
set dac_data_width 128    ; # should be 32*L (number of TX lanes)
set dac_dma_data_width 128

source $ad_hdl_dir/projects/common/zcu102/zcu102_system_bd.tcl
source $ad_hdl_dir/projects/common/xilinx/dacfifo_bd.tcl
source ../common/ad9172_fmc_ebz_bd.tcl

ad_ip_parameter axi_ad9172_xcvr CONFIG.XCVR_TYPE 2

ad_ip_parameter util_ad9172_xcvr CONFIG.XCVR_TYPE 2
ad_ip_parameter util_ad9172_xcvr CONFIG.QPLL_REFCLK_DIV 1
ad_ip_parameter util_ad9172_xcvr CONFIG.QPLL_CFG2 0xFC0
ad_ip_parameter util_ad9172_xcvr CONFIG.QPLL_CFG3 0x120
ad_ip_parameter util_ad9172_xcvr CONFIG.QPLL_CFG0 0x333C
ad_ip_parameter util_ad9172_xcvr CONFIG.QPLL_FBDIV 40
ad_ip_parameter util_ad9172_xcvr CONFIG.QPLL_CFG4 0x45
ad_ip_parameter util_ad9172_xcvr CONFIG.QPLL_CFG1 0xD038
ad_ip_parameter util_ad9172_xcvr CONFIG.QPLL_CFG1_G3 0xD038
ad_ip_parameter util_ad9172_xcvr CONFIG.QPLL_CFG2_G3 0xFC0
ad_ip_parameter util_ad9172_xcvr CONFIG.TX_CLK25_DIV 15
ad_ip_parameter util_ad9172_xcvr CONFIG.TX_OUT_DIV 1
ad_ip_parameter util_ad9172_xcvr CONFIG.TXPI_CFG 0x0
ad_ip_parameter util_ad9172_xcvr CONFIG.A_TXDIFFCTRL 0xC
ad_ip_parameter util_ad9172_xcvr CONFIG.TX_PI_BIASSET 3
ad_ip_parameter util_ad9172_xcvr CONFIG.POR_CFG 0x0
ad_ip_parameter util_ad9172_xcvr CONFIG.PPF0_CFG 0xF00
ad_ip_parameter util_ad9172_xcvr CONFIG.QPLL_CP 0xFF
ad_ip_parameter util_ad9172_xcvr CONFIG.QPLL_CP_G3 0xF
ad_ip_parameter util_ad9172_xcvr CONFIG.QPLL_LPF 0x31D

ad_ip_parameter axi_ad9172_jesd/tx CONFIG.SYSREF_IOB false

