# load proc
source ../my_scr/proc/partition_design.tcl

# partition setting
set partition_box_list {{ 1 1 20 20  } {20 1  40 40} }
set partition_name "debug_partition_lx"
set output_db_dir "../partition"

# partiton
create_partition_by_complex_shape $partition_name $partition_box_list $output_db_dir

