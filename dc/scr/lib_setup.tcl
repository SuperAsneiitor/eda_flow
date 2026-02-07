set synthetic_library "dw_foundation.sldb standard.sldb"

set search_path [concat "." $synopsys_root/libraries/syn ]
set target_library     [ ]
set dc_extra_link_libraries     [join ""]
set link_library       [join " * $target_library $dc_extra_link_libraries $synthetic_library "]









