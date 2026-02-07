############################
### Setting 1. >>> init env
##############################
set pre_step "cts"
set cur_step "route"
source ../scr/init_env.tcl
source ../scr/setup.tcl
source ../scr/utils/set_global_var.tcl


read_checkpoint ../DB/${design}.${pre_step}.db

##
source ../scr/constraint/set_global_mode.tcl
source ../scr/mode/set_route_mode.tcl


####################################
### Action 1. >>> route
####################################
route_opt -file_prefix route_opt -output_dir $rpt_dir/route_opt
write_checkpoint ../DB/${design}.${cur_step}.${version}.db


####################################
#### Action 2. >>> postRoute opt
####################################
set cur_step postRoute_opt

opt_design -post_route -incremental -rpt_file_prefix postroute_opt -expanded_scenario -output_file_dir $rpt_dir/postroute_opt
write_checkpoint ../DB/${design}.${cur_step}.${version}.db


###########################
### Action 2. >>> report
###########################
report_utilization > $rpt_dir/route.util.rpt

exit
