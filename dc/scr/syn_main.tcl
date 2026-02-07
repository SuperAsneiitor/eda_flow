set start_time [clock seconds]
######################
#### init design #####
source ../scr/init_env.tcl
set release_dir "../release/${DESIGN_NAME}/${DESIGN_VERSION}"
set rpt_dir "../rpt/${DESIGN_NAME}/${DESIGN_VERSION}"
set work_dir "./"
sh mkdir -p $release_dir $rpt_dir

source -e ../scr/dc_variable.tcl
source ../scr/lib_setup.tcl
# source -e -v ../scr/change_name_rule.tcl

# read design
source ../scr/read_design.tcl


# clock gating 
current_design $DESIGN_NAME
link



# sdc
source -e -v  $DESIGN_SDC

# alib_analyze_libs
# DRV 
set_max_fanout 32 $DESIGN_NAME
set_max_transition 0.1 $DESIGN_NAME
set_load 0.1 [all_outputs]


# path group
source ../scr/group_path.tcl


# uniq
uniquify -force

# COMPILE
# set compile_cmd "compile_ultra -no_autoungroup -no_seq_output_inversion -scan -timing_high_effort_script"
# set compile_cmd "compile_ultra -no_autoungroup -no_seq_output_inversion  -timing_high_effort_script"

# eval $compile_cmd

compile_ultra -no_autoungroup -no_boundary_optimization

###########################
### data out
###########################
set verilog_no_tri true


change_name -hier -rule verilog

write -format ddc -hierarchy -output $release_dir/${DESIGN_NAME}.syn.ddc
write -format verilog -hierarchy -output $release_dir/${DESIGN_NAME}.syn.v
write_sdc -nosplit $release_dir/${DESIGN_NAME}.syn.sdc

###########################
### report
###########################


# qor
redirect $rpt_dir/${DESIGN_NAME}.qor.rpt {report_qor}
# timing report
redirect $rpt_dir/${DESIGN_NAME}.timing.rpt {report_timing -tran -cap -net -input  -max_path 100 -nworst 5 -nosplit -slack_lesser_than 0.0}

###########################
### exit
###########################
exit
