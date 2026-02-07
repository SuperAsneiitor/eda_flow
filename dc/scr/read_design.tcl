analyze -format sverilog -work $work_dir -vcs " -f $FILE_LIST +libext+.v+.sv"
elaborate $DESIGN_NAME

current_design ${DESIGN_NAME}

set link_log $rpt_dir/link.rpt
set ck_design_log $rpt_dir/check_design.rpt

redirect -tee $link_log {link}
redirect -tee $ck_design_log {check_design}
