reset_path_group -all

set icgCells ""
set nonMemList ""
set memList ""


set inputPorts    [remove_from_collection [all_inputs] [filter_collection [get_property [get_clocks] sources] "object_class==port"]]
set outputPorts   [remove_from_collection [all_outputs] [filter_collection [get_property [get_clocks] sources] "object_class==port"]]
set icgCells      [get_cells -hierarchical -filter "is_hierarchical==false && is_integrated_clock_gating_cell==true"]

# all regs
if {[dbget top.insts.cell.baseClass block -p2]!="0x0" } {
    set allRegs [remove_from_collection [all_registers] [get_cells [dbget [dbget top.insts.cell.baseClass block -p2].name]]]
} else {
    set allRegs [all_registers]
}
set allRegs [remove_from_collection $allRegs $icgCells]

# mem list
if {[dbget top.insts.cell.baseClass block -p2]!="0x0"} {
    foreach tt [dbget top.insts.cell.baseClass block -p2] {
        set refName [dbGet ${tt}.cell.name]
        if {[regexp {^(SPS)} $refName]} {
            lappend memList [dbget ${tt}.name]
        } else {
            lappend nonMemList [dbget ${tt}.name]
        }
    }


}


group_path -name reg2reg    -from $allRegs -to $allRegs
group_path -name reg2cgare  -from $allRegs -to $icgCells
group_path -name reg2out    -from $allRegs -to $outputPorts
group_path -name in2reg     -from $inputPorts -to $allRegs
group_path -name in2out     -from $inputPorts -to $outputPorts

setPathGroupOptions -weight 20 -effortLevel high reg2reg
setPathGroupOptions -weight 20 -effortLevel high reg2cgare


if {$memList != ""} {
    group_path -name mem2reg -from $memList  -to $allRegs
    group_path -name reg2mem -from $$allRegs -to $memList

    setPathGroupOptions -weight 20 -effortLevel high mem2reg
    setPathGroupOptions -weight 20 -effortLevel high reg2mem
}

createBasicPathGroups -expanded


