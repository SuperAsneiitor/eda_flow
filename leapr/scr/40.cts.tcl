############################
### Setting 1. >>> init env
##############################
set pre_step "place"
set cur_step "cts"
source ../scr/init_env.tcl
source ../scr/setup.tcl
source ../scr/utils/set_global_var.tcl


read_checkpoint ../DB/${design}.${pre_step}.db

########################################
### Setting 1. >>> create clock spec
########################################
remove_clock_tree_spec
source ../scr/cts/set_clock_setting.tcl
create_clock_tree_spec

########################################
### Action 1. >>> Clock Tree synthesis
########################################
cts_opt -rpt_path $rpt_dir/cts

# report postCTS
# report_clock_tree_summary -delay_corners WorstLT_cworst_CCworst_T -file $rpt_dir/cts/clk_tree_info_func.rpt
# report_cts_status -delay_corners WorstLT_cworst_CCworst_T -late -histogram -max_path 10  -file $rpt_dir/cts/clk_skew_group_func.rpt

write_checkpoint ../DB/${design}.${cur_step}.${version}.tmp.db
#######################################
##### Action 2. >>> postCts opt
##########################################
set_clock_gating_check -setup 100
reset_clock_gating_check  [get_pins -hier */E -filter "is_hierarchical == false"]
reset_clock_gating_check  [get_pins -hier */TE -filter "is_hierarchical == false"]

opt_design -post_cts -incremental -file_prefix cts_incr -output_file_dir $rpt_dir/cts_incr

# rport postCTS opt
report_utilization  > $rpt_dir/cts.util.rpt
report_clock_tree_summary -delay_corners WorstLT_cworst_CCworst_T -file $rpt_dir/cts/clk_tree_info_func.rpt
report_cts_status -delay_corners WorstLT_cworst_CCworst_T -late -histogram -max_path 10  -file $rpt_dir/cts/clk_skew_group_func.rpt


write_checkpoint ../DB/${design}.${cur_step}.${version}.db

exit
