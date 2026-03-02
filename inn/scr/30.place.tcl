############################
### Setting 1. >>> init env
##############################
set pre_step "preplace"
set cur_step "place"
source ../scr/init_env.tcl
source ../scr/setup.tcl
source ../scr/utils/set_global_var.tcl

source ../DB/${design}.${pre_step}.${version}.enc
source ../scr/mode/set_global_mode.tcl
# source ../scr/constraint/set_global_constraint.tcl

# path group
source ../scr/constraint/set_group_path.tcl



# skip scan reorder
setPlaceMode -place_global_ignore_scan true -place_global_reorder_scan false
setScanReorderMode -compLogic true
set_message -id IMPSP-9099 -severity warn
set spgFatalError9099 0

# place_opt_design
place_opt_design


###########################
#### finished
#############################
saveDesign -tcon ../DB/${design}.${cur_step}.${version}.enc

exit
