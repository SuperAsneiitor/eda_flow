############################
### Setting 1. >>> init env
##############################
set pre_step "initial"
set cur_step "preplace"
source ../scr/init_env.tcl
source ../scr/setup.tcl
source ../scr/utils/set_global_var.tcl

source ../DB/${design}.${pre_step}.${version}.enc

##################################
### Action 1. >>> init floorplan
###################################
source -e -v ../scr/preplace/init_floorplan.tcl
source -e -v ../scr/preplace/init_core_row.tcl
source -e -v ../scr/preplace/init_track.tcl




###########################
### finished 
############################
saveDesign -tcon ../DB/${design}.${cur_step}.${version}.enc

exit


