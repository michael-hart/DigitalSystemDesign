set_global_assignment -entity "first_nios2_system" -library "lib_first_nios2_system" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "first_nios2_system" -library "lib_first_nios2_system" -name IP_TOOL_VERSION "13.1"
set_global_assignment -entity "first_nios2_system" -library "lib_first_nios2_system" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_first_nios2_system" -name SPD_FILE [file join $::quartus(sip_path) "../../first_nios2_system.spd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "../../first_nios2_system.qsys"]

set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "first_nios2_system.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/mentor/altera_reset_controller.v"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/mentor/altera_reset_synchronizer.v"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/aldec/altera_reset_controller.v"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/aldec/altera_reset_synchronizer.v"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_irq_mapper.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_cpu_jtag_debug_module_translator.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_sdram_s1_translator.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_jtag_uart_avalon_jtag_slave_translator.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_sys_clk_timer_s1_translator.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_sysid_control_slave_translator.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_led_pio_s1_translator.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_sdram_s1_translator_avalon_universal_slave_0_agent.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_width_adapter.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_width_adapter_001.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_cpu_instruction_master_translator.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_cpu_data_master_translator.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/mentor/altera_merlin_width_adapter.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/mentor/altera_merlin_address_alignment.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/mentor/altera_merlin_burst_uncompressor.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/aldec/altera_merlin_width_adapter.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/aldec/altera_merlin_address_alignment.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/aldec/altera_merlin_burst_uncompressor.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_rsp_xbar_mux_001.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_rsp_xbar_mux.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_rsp_xbar_demux_002.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_rsp_xbar_demux.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_cmd_xbar_mux_002.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_cmd_xbar_mux.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_cmd_xbar_demux_001.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_cmd_xbar_demux.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/mentor/altera_merlin_burst_adapter.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/aldec/altera_merlin_burst_adapter.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/mentor/altera_merlin_traffic_limiter.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/mentor/altera_avalon_st_pipeline_base.v"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/aldec/altera_merlin_traffic_limiter.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/aldec/altera_avalon_st_pipeline_base.v"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_id_router_002.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_id_router_001.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_id_router.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_addr_router_001.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_addr_router.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_sdram_s1_translator_avalon_universal_slave_0_agent_rdata_fifo.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_sdram_s1_translator_avalon_universal_slave_0_agent_rsp_fifo.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_mm_interconnect_0_cpu_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/mentor/altera_merlin_slave_agent.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/aldec/altera_merlin_slave_agent.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/mentor/altera_merlin_master_agent.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/aldec/altera_merlin_master_agent.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/mentor/altera_merlin_slave_translator.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/aldec/altera_merlin_slave_translator.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/mentor/altera_merlin_master_translator.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/aldec/altera_merlin_master_translator.sv"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_custom_instruction_master_multi_slave_translator0.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_custom_instruction_master_multi_xconnect.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_custom_instruction_master_translator.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_sdram.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_led_pio.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_sysid.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_sys_clk_timer.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_jtag_uart.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu.ocp"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu.sdc"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu.vho"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_ic_tag_ram.dat"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_ic_tag_ram.hex"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_ic_tag_ram.mif"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_jtag_debug_module_sysclk.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_jtag_debug_module_tck.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_jtag_debug_module_wrapper.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_mult_cell.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_nios2_waves.do"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_ociram_default_contents.dat"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_ociram_default_contents.hex"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_ociram_default_contents.mif"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_oci_test_bench.vhd"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_rf_ram_a.dat"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_rf_ram_a.hex"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_rf_ram_a.mif"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_rf_ram_b.dat"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_rf_ram_b.hex"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_rf_ram_b.mif"]
set_global_assignment -library "lib_first_nios2_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/first_nios2_system_cpu_test_bench.vhd"]
