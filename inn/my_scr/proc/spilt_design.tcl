###################################
### 1.  select timing path point 
###################################
proc select_path {args} {
    set cmd "report_timing -collection "
    append cmd $args
    set timingPaths [eval $cmd]

    foreach_in_collection tp $timingPaths {
        set isStart 0
        foreach_in_collection timing_poiont [get_property $tp timing_points] {
            set p [get_property $timing_poiont pin]
            set t [get_property $p  dbObject]
            if [get_property $p is_pin] {
                selectInst [dbget $t.inst.name]
            }
        }
    }
}

######################################
### 2.
#######################################
proc select_path_from_insts {insts} {
    foreach inst $insts {
        foreach inst2 $insts {
            if {$inst != $inst2} {
                select_path -from $inst -to $inst2
            }
        }
    }
}

####################################
### 3. union box
####################################
proc union_box {box1 box2} {
    if {$box1 eq ""} {
        return $box2
    }
    if {$box2 eq ""} {
        return $box1
    }

    lassign $box1 llx1 lly1 urx1 ury1
    lassign $box2 llx2 lly2 urx2 ury2


    set llx [expr {min($llx1, $llx2)}]
    set lly [expr {min($lly1, $lly2)}]
    set urx [expr {min($llx1, $llx2)}]
    set ury [expr {min($lly1, $lly2)}]

    return [list $llx $lly $urx $ury]
}


#######################################
### 4. box selected
#######################################
proc box_from_selected {{ratio 1}} {
    set bb [list 10000 10000 -10000 -10000]
    set total_area 0
    foreach inst [dbget selected] {
        set bb [union_box $bb [list [dbget $inst.box_llx] [dbget $inst.box_lly] [dbget $inst.box_urx] [dbget $inst.box_ury]]]
        set total_area [expr $total_area + [dbget $inst.area]]
    }

    set ll_x [lindex $bb 0]
    set ll_y [lindex $bb 1]
    set ur_x [lindex $bb 2]
    set ur_y [lindex $bb 3]

    if {$ratio != 0} {
        set cen_x [expr ($ll_x + $ur_x)/2]
        set cen_y [expr ($ll_y + $ur_y)/2]
        set area [expr ($ur_x - $ll_x) * ($ur_y - $ll_y)]
        set l [expr ($total_area/$ratio) ** 0.5]
        set ll_x [expr $cen_x - $l/2]
        set ll_y [expr $cen_y - $l/2]
        set ur_x [expr $cen_x + $l/2]
        set ur_y [expr $cen_y + $l/2]
        puts "$ll_x $ll_y $ur_x $ur_y"
    
    }

    return [list $ll_x $ll_y $ur_x $ur_y ]
}

##########################################
### 5. create fence from selected
##########################################
proc create_fence_from_selected {name ratio} {
    set box [box_from_selected $ratio]
    createInstGroup $name -fence [lindex $box 0] [lindex $box 1] [lindex $box 2] [lindex $box 3]
    foreach inst [dbget selected.name] {
        addInstToInstGroup $name $inst
    }
    return $box
}


###########################################
### 6. create_partition
###########################################

proc create_partition {name create_hinst create_fence ratio {select 1}} {
# judge selected instances
    if {! $select} {
        deselectAll
        selectInst $name/*
    } else {
        if {[llength [dbget selected]] < 2} {
            puts "No instances selected"
            return
        }
    }

# create hinst
    if {$create_hinst} {
        select_path_from_insts [dbget [dbget selected.cell.isSequential 1 -p2].name]
        set box [create_fence_from_selected $name $ratio]
        catch {createLogicHierarchy -cell ${name}_cell -newHinst $name -objects $name -commit}
    } else {
        set box [box_from_selected $ratio]
    }

# create fence
    if {$create_fence} {
        set ll_x [lindex $box 0]
        set ll_y [lindex $box 1]
        set ur_x [lindex $box 2]
        set ur_y [lindex $box 3]
        createFence ${name} $ll_x $ll_y $ur_x $ur_y
    }
# partition Module
    catch {definePartition -hinst $name}
    catch {deriveTimingBudget -timingCore -timingIlmCore}
    catch {partition -noInheritPhysical}

    savePartition -dir ../PDB

}

##########################################
### 7. create partition by box
##########################################
proc create_fence_selected_by_box { fence_name fence_box } {
    createInstGroup $fence_name -fence [lindex $fence_box 0] [lindex $fence_box 1] [lindex $fence_box 2] [lindex $fence_box 3]
    foreach inst [dbget selected.name] {
        addInstToInstGroup $fence_name $inst
    }
}

proc create_complex_fence_selected_by_box {fence_name fence_boxList} {
    set core_llx [dbget top.fplan.coreBox_llx]
    set core_lly [dbget top.fplan.coreBox_lly]

    # create empty fence
    createInstGroup $fence_name -fence "$core_llx $core_lly [expr $core_llx + 1]  [expr $core_lly + 1] "
    
    # modify fence shape
    setObjFPlanBoxList Group $fence_name $fence_boxList
    
    # add instance to fence
    foreach inst [dbget selected.name] {
        addInstToInstGroup $fence_name $inst
    }
}




proc create_partition_by_box {partition_name partition_box  create_hinst create_fence} {
    setLayerPreference node_layer -isVisible 0
    setLayerPreference term -isVisible 0
    # gui_select -rect $partition_box
    set partition_box_llx [lindex $partition_box 0]
    set partition_box_lly [lindex $partition_box 1]
    set partition_box_urx [lindex $partition_box 2]
    set partition_box_ury [lindex $partition_box 3]
    
    deselectAll
    select_obj [dbget top.insts {.pt_x>=${partition_box_llx} && .pt_x<=${partition_box_urx} \
                              && .pt_y>=${partition_box_lly} && .pt_y<=${partition_box_ury}}]
    
    

    defOut -selected ../data/${partition_name}.def


    if {[llength [dbget selected]] < 2} {
        puts "\[Error\]: No instances selected, Please Check your partition_box !!!"
        return
    }
    
    if {$create_hinst} {
        select_path_from_insts [dbget [dbget selected.cell.isSequential 1 -p2].name]
        create_fence_selected_by_box $partition_name $partition_box
        catch {createLogicHierarchy -cell ${partition_name}_cell -newHinst $partition_name -objects $partition_name -commit}
    }
    
    if {$create_fence} {
        set ll_x [lindex $partition_box 0]
        set ll_y [lindex $partition_box 1]
        set ur_x [lindex $partition_box 2]
        set ur_y [lindex $partition_box 3]
        createFence ${partition_name} $ll_x $ll_y $ur_x $ur_y
    }

    catch {definePartition -hinst $partition_name}
    catch {deriveTimingBudget -timingCore -timingIlmCore}
    catch {partition -noInheritPhysical}

    savePartition -dir ../PDB
}


proc create_partition_by_complex_shape {partition_name partition_box_list pdb_dir} {
    #
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


    # 4.2 create Fence & Module
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
}

