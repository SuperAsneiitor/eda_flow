source ../my_scr/proc/utils.tcl


set partition_DB "../partition_DB"
set partition_define [list \
    [list partition_part_1  [list {1 1   20 20}  ] ]\
    [list partition_part_2  [list {30 30 50 50}  ] ]\
    [list partition_part_3  [list {50 50 70 70} {70 50 75 75} ] ]\
]


partition_design_by_multi_boxes $partition_define $partition_DB


