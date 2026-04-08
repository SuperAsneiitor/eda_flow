set pdb_dir             "../test_PDB"
set partition_name      "debug_partition_lx"
set partition_box_list  {{ 1 1 20 20  } {20 1  40 40} }


setLayerPreference node_layer -isVisible 0
setLayerPreference term -isVisible 0
set timing_defer_mmmc_object_updates true


# Action 1. >>> select all instances in the box_list
deselectAll
foreach sub_partition_box $partition_box_list {
    set partition_box_llx [lindex $sub_partition_box 0]
    set partition_box_lly [lindex $sub_partition_box 1]
    set partition_box_urx [lindex $sub_partition_box 2]
    set partition_box_ury [lindex $sub_partition_box 3]

    select_obj [dbget top.insts {.pt_x>=${partition_box_llx} && .pt_x<=${partition_box_urx} \
                              && .pt_y>=${partition_box_lly} && .pt_y<=${partition_box_ury}}]
}

# Action 2. >>> dump place def of seleccted instances
defOut -selected ../data/${partition_name}.def

# Action 3. >>> judge selected instance number
if {[llength [dbget selected]] < 2} {
    puts "\[Error\]: No instances selected, Please Check your partition_box_list !!!"
    return
}

# Action 4. >>> create instance group & fence
select_path_from_insts [dbget [dbget selected.cell.isSequential 1 -p2].name]
create_complex_fence_selected_by_box $partition_name $partition_box_list
catch {createLogicHierarchy -cell ${partition_name}_cell -newHinst $partition_name -objects $partition_name -commit}


# create Fence
set core_llx [dbget top.fplan.coreBox_llx]
set core_lly [dbget top.fplan.coreBox_lly]
createFence ${partition_name}   $core_llx $core_lly [expr $core_llx + 1]  [expr $core_lly + 1]
setObjFPlanBoxList Module  $partition_name  $partition_box_list






set_analysis_view -update_timing

# Action 5. >>> split design & save PDB
catch {definePartition -hinst $partition_name}
catch {deriveTimingBudget -timingCore -timingIlmCore}
catch {partition -noInheritPhysical}

savePartition -dir $pdb_dir
