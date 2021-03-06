# TCL File Generated by Component Editor 13.1
# Sun Mar 06 18:19:19 GMT 2016
# DO NOT MODIFY


# 
# fp_mult_mem "fp_mult_mem" v1.0
#  2016.03.06.18:19:19
# 
# 

# 
# request TCL package from ACDS 13.1
# 
package require -exact qsys 13.1


# 
# module fp_mult_mem
# 
set_module_property DESCRIPTION ""
set_module_property NAME fp_mult_mem
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME fp_mult_mem
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL fp_mult_mem
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file addsub_synthesis.vhd VHDL PATH ip/fp_mult/addsub_synthesis.vhd
add_fileset_file atan32_Arch1.vhd VHDL PATH ip/fp_mult/atan32_Arch1.vhd
add_fileset_file cordic_pkg_pkg.vhd VHDL PATH ip/fp_mult/cordic_pkg_pkg.vhd
add_fileset_file cordic_synthesis.vhd VHDL PATH ip/fp_mult/cordic_synthesis.vhd
add_fileset_file fixed_float_types_c.vhdl VHDL PATH ip/fp_mult/fixed_float_types_c.vhdl
add_fileset_file fixed_pkg_c.vhdl VHDL PATH ip/fp_mult/fixed_pkg_c.vhdl
add_fileset_file float_pkg_c.vhdl VHDL PATH ip/fp_mult/float_pkg_c.vhdl
add_fileset_file fp_mult.vhd VHDL PATH ip/fp_mult/fp_mult.vhd
add_fileset_file fp_mult_mem.vhd VHDL PATH ip/fp_mult/fp_mult_mem.vhd TOP_LEVEL_FILE
add_fileset_file fsm_synthesis.vhd VHDL PATH ip/fp_mult/fsm_synthesis.vhd
add_fileset_file shiftn_synthesis.vhd VHDL PATH ip/fp_mult/shiftn_synthesis.vhd


# 
# parameters
# 


# 
# display items
# 


# 
# connection point fp_mult_mem
# 
add_interface fp_mult_mem nios_custom_instruction end
set_interface_property fp_mult_mem clockCycle 0
set_interface_property fp_mult_mem operands 2
set_interface_property fp_mult_mem ENABLED true
set_interface_property fp_mult_mem EXPORT_OF ""
set_interface_property fp_mult_mem PORT_NAME_MAP ""
set_interface_property fp_mult_mem CMSIS_SVD_VARIABLES ""
set_interface_property fp_mult_mem SVD_ADDRESS_GROUP ""

add_interface_port fp_mult_mem start_addr dataa Input 32
add_interface_port fp_mult_mem vector_length datab Input 32
add_interface_port fp_mult_mem start start Input 1
add_interface_port fp_mult_mem reset reset Input 1
add_interface_port fp_mult_mem clk clk Input 1
add_interface_port fp_mult_mem result result Output 32
add_interface_port fp_mult_mem done done Output 1


# 
# connection point fp_mem
# 
add_interface fp_mem avalon start
set_interface_property fp_mem addressUnits WORDS
set_interface_property fp_mem associatedClock clock_sink
set_interface_property fp_mem associatedReset reset_source
set_interface_property fp_mem bitsPerSymbol 8
set_interface_property fp_mem burstOnBurstBoundariesOnly false
set_interface_property fp_mem burstcountUnits WORDS
set_interface_property fp_mem doStreamReads false
set_interface_property fp_mem doStreamWrites false
set_interface_property fp_mem holdTime 0
set_interface_property fp_mem linewrapBursts false
set_interface_property fp_mem maximumPendingReadTransactions 0
set_interface_property fp_mem readLatency 0
set_interface_property fp_mem readWaitTime 1
set_interface_property fp_mem setupTime 0
set_interface_property fp_mem timingUnits Cycles
set_interface_property fp_mem writeWaitTime 0
set_interface_property fp_mem ENABLED true
set_interface_property fp_mem EXPORT_OF ""
set_interface_property fp_mem PORT_NAME_MAP ""
set_interface_property fp_mem CMSIS_SVD_VARIABLES ""
set_interface_property fp_mem SVD_ADDRESS_GROUP ""

add_interface_port fp_mem read_mem read Output 1
add_interface_port fp_mem response response Input 2
add_interface_port fp_mem readdatavalid readdatavalid Input 1
add_interface_port fp_mem waitrequest waitrequest Input 1
add_interface_port fp_mem readdata readdata Input 16
add_interface_port fp_mem read_addr address Output 32
add_interface_port fp_mem burstcount burstcount Output 11


# 
# connection point clock_sink
# 
add_interface clock_sink clock end
set_interface_property clock_sink clockRate 0
set_interface_property clock_sink ENABLED true
set_interface_property clock_sink EXPORT_OF ""
set_interface_property clock_sink PORT_NAME_MAP ""
set_interface_property clock_sink CMSIS_SVD_VARIABLES ""
set_interface_property clock_sink SVD_ADDRESS_GROUP ""


# 
# connection point reset_source
# 
add_interface reset_source reset start
set_interface_property reset_source associatedClock clock_sink
set_interface_property reset_source associatedDirectReset ""
set_interface_property reset_source associatedResetSinks ""
set_interface_property reset_source synchronousEdges DEASSERT
set_interface_property reset_source ENABLED true
set_interface_property reset_source EXPORT_OF ""
set_interface_property reset_source PORT_NAME_MAP ""
set_interface_property reset_source CMSIS_SVD_VARIABLES ""
set_interface_property reset_source SVD_ADDRESS_GROUP ""

