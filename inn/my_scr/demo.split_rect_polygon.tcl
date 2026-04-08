#####################
### init proc
#####################
source ../my_scr/proc/spilt_design.tcl

######################
### split die
######################
set fp_core_box [dbget top.fplan.corebox]
set fp_core_box_llx [dbget top.fplan.corebox_llx]
set fp_core_box_lly [dbget top.fplan.corebox_lly]
set fp_core_box_urx [dbget top.fplan.corebox_urx]
set fp_core_box_ury [dbget top.fplan.corebox_ury]


set center_x [expr [dbget top.fplan.coreBox_sizex] / 2]
set center_y [expr [dbget top.fplan.coreBox_sizey] / 2]


# split 1/4 partition
set fp_core_ul_box [list $fp_core_box_llx $center_y         $center_x           $fp_core_box_ury  ]
set fp_core_ur_box [list $center_x        $center_y         $fp_core_box_urx    $fp_core_box_ury  ]
set fp_core_ll_box [list $fp_core_box_llx $fp_core_box_lly  $center_x           $center_y  ]
set fp_core_lr_box [list $center_x        $fp_core_box_lly  $fp_core_box_urx    $center_y  ]


# create_partition_by_box {partition_name partition_box  create_hinst create_fence}

# 1/4 ll core box
create_partition_by_box partition_ll $fp_core_ll_box 1 1 
# set ll_shift_cmd "shiftOrigin -delta ${fp_core_box_llx} ${fp_core_box_lly}"


# 1/4 ur core box
create_partition_by_box partition_ur $fp_core_ur_box 1 1 
# set ur_shift_cmd "shiftOrigin -delta ${center_x} ${center_y}"

# 1/4 lr core box
create_partition_by_box partition_lr $fp_core_lr_box 1 1 
# set lr_shift_cmd "shiftOrigin -delta ${center_x} ${fp_core_box_lly}"

# 1/4 ul core box
create_partition_by_box partition_ul $fp_core_ul_box 1 1 
# set ul_shift_cmd "shiftOrigin -delta ${fp_core_box_llx} ${center_y}"

