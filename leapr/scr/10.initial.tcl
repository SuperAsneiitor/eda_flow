############################
### Setting 1. >>> init env
##############################
set cur_step "initial"
source ../scr/init_env.tcl
source ../scr/setup.tcl
source ../scr/utils/set_global_var.tcl

set_cfg udm.need_uniquify 1
set_rc_config -flow leda_rctbl

#########################################
### Action 1. >>> init design
#########################################
read_tech $design_config($design,apr_tech)
read_lef  $design_config($design,lef)
read_mcmm ../scr/mmmc.tcl
read_verilog $design_config($design,netlist)
set_cfg udm.groud_net VSS
set_cfg udm.power_net VDD

bind_design
source ../scr/mode/set_mode.tcl
source ../scr/group_path.tcl

write_checkpoint ../DB/${design}.${cur_step}.${version}.db
