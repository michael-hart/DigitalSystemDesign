# TCL File Generated by Component Editor 13.1
# Fri Mar 04 13:55:02 GMT 2016
# DO NOT MODIFY


# 
# fp_mult "fp_mult" v1.0
#  2016.03.04.13:55:02
# 
# 

# 
# request TCL package from ACDS 13.1
# 
package require -exact qsys 13.1


# 
# module fp_mult
# 
set_module_property DESCRIPTION ""
set_module_property NAME fp_mult
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME fp_mult
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL fp_mult
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file fixed_float_types_c.vhdl VHDL PATH ip/fp_mult/fixed_float_types_c.vhdl
add_fileset_file fixed_pkg_c.vhdl VHDL PATH ip/fp_mult/fixed_pkg_c.vhdl
add_fileset_file float_pkg_c.vhdl VHDL PATH ip/fp_mult/float_pkg_c.vhdl
add_fileset_file fp_mult.vhd VHDL PATH ip/fp_mult/fp_mult.vhd TOP_LEVEL_FILE


# 
# parameters
# 


# 
# display items
# 


# 
# connection point fp_mult
# 
add_interface fp_mult nios_custom_instruction end
set_interface_property fp_mult clockCycle 0
set_interface_property fp_mult operands 2
set_interface_property fp_mult ENABLED true
set_interface_property fp_mult EXPORT_OF ""
set_interface_property fp_mult PORT_NAME_MAP ""
set_interface_property fp_mult CMSIS_SVD_VARIABLES ""
set_interface_property fp_mult SVD_ADDRESS_GROUP ""

add_interface_port fp_mult opcode n Input 2
add_interface_port fp_mult dataa dataa Input 32
add_interface_port fp_mult datab datab Input 32
add_interface_port fp_mult result result Output 32
add_interface_port fp_mult clk clk Input 1
add_interface_port fp_mult start start Input 1
add_interface_port fp_mult resetn reset Input 1
add_interface_port fp_mult done done Output 1

