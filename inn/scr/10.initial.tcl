#############################
### Setting 1. >>> init env
##############################
set pre_step ""
set cur_step "initial"
source ../scr/init_env.tcl
source ../scr/setup.tcl
# source ../scr/utils/set_global_var.tcl

###############################
### Step 2. init input file
###############################
set init_top_cell ${design}
set init_verilog $design_config($design,netlist)
set init_mmmc_file ../scr/viewDefinition.tcl
set init_lef_file "$design_config(${design},apr_tech)  $design_config(${design},lef_std) "

set init_gnd_net "DVSS"
set init_pwr_net "DVDD"


init_design -setup $setup_scenario  -hold $hold_scenario

remove_assign -repport
remove_assign -buffering


saveDesign -tcon ../DB/${design}.${cur_step}.${version}.enc


exit
