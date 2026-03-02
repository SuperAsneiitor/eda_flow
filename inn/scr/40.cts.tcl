############################
### Setting 1. >>> init env
##############################
set pre_step "place"
set cur_step "cts"
source ../scr/init_env.tcl
source ../scr/setup.tcl
source ../scr/utils/set_global_var.tcl

source ../DB/${design}.${pre_step}.${version}.enc
source ../scr/mode/set_global_mode.tcl
# source ../scr/constraint/set_global_constraint.tcl

# 
delete_ccopt_clock_trees *
delete_ccopt_clock_trees_spec
# cleanup route type
set route_type_list [dbget head.routeTypes.name]
if {$route_type_list != "0x0"} {
    set_ccopt_property -net_type leaf  route_type default
    set_ccopt_property -net_type trunk route_type default
    set_ccopt_property -net_type top   route_type default
    foreach route_type_name $route_type_list {
        delete_route_type -name $route_type_name
    }
}

# load spec
source ../data/user_ccopt.${version}.spec
source ../scr/cts/cts_setting.tcl


ccopt_design -cts



#####################################
### Step 2.
set_interactive_constraint_modes  [all_constraint_modes -active]
set vars(edi,dont_use) "CLK*"
foreach item $vars(edi,dont_use) {
    set libcell [get_lib_cells -quiet */$items]
    puts "#$item $libcell"
    if {$libcell eq ""} {continue}
    set_dont_use $libcell; puts "set_dont_use $libcell true;#item $item"
}

foreach item $vars(edi,dont_use) {
    set libcellNameList [dbget [dbget head.libCells.baseClass core -p].name $item -e]
    puts "#$item $libcell"
    if {$libcellNameList != ""} {
        foreach cell $libcellNameList {
            setDontUse $cell true;puts "setDontUse $cell true"
        }
    }
}


set_propagated_clock [all_clocks]
set_interactive_constraint_modes {}

###############################################
# END 1. Save CTS tmp Design
###############################################
saveDesign -tcon ../DB/${design}.${cur_step}.${version}.tmp.enc
mkdir -p ../rpt/${version}

report_ccopt_clock_trees -file ../rpt/${version}/${design}.ClockTree.rpt
report_ccopt_skew_groups -file ../rpt/${version}/${design}.ClockSkewGroup.rpt


###############################################
## END 2. CTS opt
################################################
setPathGroupOptions in2reg -slackAdjustment 0
setPathGroupOptions reg2out -slackAdjustment 0

# postCts opt setup only
optDesign -postCTS -outDir ../rpt/${version}/${design}_cts_Opt_setup


saveDesign -tcon ../DB/${design}.${cur_step}.${version}.enc
exit
