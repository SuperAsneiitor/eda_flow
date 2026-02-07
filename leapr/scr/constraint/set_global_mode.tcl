set_active_constraint_modes [get_all_constraint_modes -active]
set_analysis_scenario -setup $setup_scenario -hold $hold_scenario

source ../scr/constraint/set_uncertainty.tcl
