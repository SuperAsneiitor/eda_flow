###################################################
# proc 1: create_complex_fence_selected_by_box
# describe: create complex fence by specify shape
####################################################
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

####################################################
# proc 2: select_inst_by_specify_box
# # describe: 
# ####################################################
proc select_inst_by_specify_box {partition_box_list} {
    deselectAll
    foreach sub_partition_box $partition_box_list {
    set partition_box_llx [lindex $sub_partition_box 0]
    set partition_box_lly [lindex $sub_partition_box 1]
    set partition_box_urx [lindex $sub_partition_box 2]
    set partition_box_ury [lindex $sub_partition_box 3]

    select_obj [dbget top.insts {.pt_x>=${partition_box_llx} && .pt_x<=${partition_box_urx} \
                              && .pt_y>=${partition_box_lly} && .pt_y<=${partition_box_ury}}]
    }
}


proc select_path_from_insts {insts} {
    foreach inst $insts {
        foreach inst2 $insts {
            if {$inst != $inst2} {
                select_path -from $inst -to $inst2
            }
        }
    }
}

########################################################
## proc 3: create_logic_hier
## describe: partition design by user selected instance
########################################################
proc create_logic_hier_module { partition_define } {
  foreach partition_part_info $partition_define {
      set partition_name [lindex $partition_part_info 0]
      set partition_box_list [lindex $partition_part_info 1]
   
      # Action 1. >>> select all instances in the box_list
      select_inst_by_specify_box $partition_box_list 
   
      # Action 2. >>> judge selected instance number
      if {[llength [dbget selected]] < 2} {
	  puts "\[Error\]: No instances selected, Please Check your partition_box_list !!!"
	  return
      }
      
      # Action 3. >>> create instance group & fence
      # select_path_from_insts [dbget [dbget selected.cell.isSequential 1 -p2].name]
      create_complex_fence_selected_by_box $partition_name $partition_box_list
      catch {createLogicHierarchy -cell ${partition_name}_cell -newHinst $partition_name -objects $partition_name -commit}
  }
}



######################################################
## proc 4: create_partition
## describe: partition design by user specify shape
######################################################

proc create_partition_block { partition_define} {
  foreach partition_part_info $partition_define {
      set partition_name [lindex $partition_part_info 0]
      set partition_box_list [lindex $partition_part_info 1]


      set core_llx [dbget top.fplan.coreBox_llx]
      set core_lly [dbget top.fplan.coreBox_lly]
      createFence ${partition_name}   $core_llx $core_lly [expr $core_llx + 1]  [expr $core_lly + 1]
      setObjFPlanBoxList Module  $partition_name  $partition_box_list

      definePartition -hinst $partition_name
  }
}

######################################################
## proc 5: partition_design
## describe: partition design by user specify shape
######################################################
proc exec_partition {} {
  earlyGlobalRoute
  assignPtnPin

  set_analysis_view -update_timing
  deriveTimingBudget -timingCore -timingIlmCore
  catch {partition -noInheritPhysical}
}


######################################################
## proc 6: partition_design_by_multi_boxes
## describe: partition design by user specify shape
######################################################
proc partition_design_by_multi_boxes {user_partition_define partition_dir} {
  setLayerPreference node_layer -isVisible 0
  setLayerPreference term -isVisible 0
  set timing_defer_mmmc_object_updates true
  
  mkdir -p $partition_dir
  
  # Action 1. >>> create new logic hier module
  create_logic_hier_module $user_partition_define
  
  # Action 2. >>> create partiotion block
  create_partition_block $user_partition_define
  
  # Action 3. >>> partition design
  exec_partition
  
  # save partition result
  savePartition -dir $partition_dir

}













