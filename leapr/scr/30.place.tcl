############################
### Setting 1. >>> init env
##############################
set pre_step "preplace"
set cur_step "place"
source ../scr/init_env.tcl
source ../scr/setup.tcl
 
read_checkpoint ../DB/${design}.${pre_step}.db

source ../scr/constraint/set_global_mode.tcl
set_multi_threads -local_threads 32


remove_clock_trees *
remove_clock_tree_buffers




###########################
### Action 1. >>> Place
###########################
place_opt -file_prefix place -all_scenarios -report_dir $rpt_dir/place
write_checkpoint ../DB/${design}.${cur_step}.${version}.tmp.db

opt_design -file_prefix place_incr -pre_cts -incremental -expanded_scenario -output_file_dir $rpt_dir/place_incr
write_checkpoint ../DB/${design}.${cur_step}.${version}.db


###########################
### Action 2. >>> report
###########################
# report_utilization > $rpt_dir/place.util.rpt

exit
