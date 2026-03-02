############################
### Setting 1. >>> init env
##############################
set pre_step "cts"
set cur_step "route"
source ../scr/init_env.tcl
source ../scr/setup.tcl
source ../scr/utils/set_global_var.tcl

source ../DB/${design}.${pre_step}.${version}.enc
source ../scr/mode/set_global_mode.tcl
# source ../scr/constraint/set_global_constraint.tcl

# add tie cell
source ../scr/route/add_tie_cell.tcl

# route design
routeDesign

saveDesign -tcon ../DB/${design}.${cur_step}.${version}.enc

exit
