#clock uncertainty
foreach_in_col clk [get_all_clocks] {
    set period [get_attr $clk period]
    # set_clock_uncertainty -setup [expr $period*0.05] $clk
    set_clock_uncertainty -setup 0.080 $clk
}
set_clock_uncertainty -hold 0.030 [get_all_clocks]
# set_clock_gating_check -setup 0.200 [get_pins -hier */E -filter "is_hierarchical == false"]
# set_clock_gating_check -setup 0.200 [get_pins -hier */TE -filter "is_hierarchical == false"]
