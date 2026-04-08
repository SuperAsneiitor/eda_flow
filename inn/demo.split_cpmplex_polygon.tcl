#####################
### init proc
#####################
source ../my_scr/proc/spilt_design.tcl

######################
### split die
######################

set partition_box_list {{ 1 1 20 20  } {20 1  40 40} }
set partition_name "debug_partition_lx"
set output_db_dir "../test_PDB"


create_partition_by_complex_shape $partition_name $partition_box_list $output_db_dir





