############################
### Setting 1. >>> init env
##############################
set pre_step "initial"
set cur_step "preplace"
source ../scr/init_env.tcl
source ../scr/setup.tcl
source ../scr/utils/set_global_var.tcl

read_checkpoint ../DB/${design}.${pre_step}.db


# modify floorplan
create_floorplan -core_margins_by die -site 96s6t_CoreSite -core_size {90 90 1.08 1.08 1.08 1.08   }

# pin edit
set_cfg plan.pin_assignment_batch_mode true
edit_pin -spread_mode CENTER -edge 1 -layer M5 -pins *
set_cfg plan.pin_assignment_batch_mode false

# Halo
remove_halo -all_block
create_halo 1 1 1 1 -all_block

# Channel Blockages
set_cfg plan.channel_blkgs_target_objects {macro macro_halo core fence hard_blkg soft_blkg partial_blkg}
set_cfg plan.channel_blkgs_direction xy
set_cfg plan.channel_blkgs_overwrite false
create_channel_blockage -prefix FP_FILL_SOFT -create_place_blockage soft 20
create_channel_blockage -prefix FP_FILL_PAR -create_place_blockage partial 50 -density 60

set_cfg plan.channel_blkgs_target_objects {macro macro_halo core hard_blkg}
set_cfg plan.channel_blkgs_direction y
create_channel_blockage -prefix FP_FILL_HARD -create_place_blockage hard 5
set_cfg plan.channel_blkgs_direction x
create_channel_blockage -prefix FP_FILL_HARD -create_place_blockage hard 5

set_cell_placement_status -all_hard_macros -status fixed
fix_all_ios
snap_floorplan -all
verify_floorplan


# # physical cell insert
# remove_filler -cells ENDCAP*
# remove_filler -cells WELLTAP*
# set_cfg phy_cell.boundary.left_edge [get_obj_prop [udm_get_obj -type libcell -filter "name=DECAP*_ASAP7_75t_R"] name]
# set_cfg phy_cell.boundary.right_edge [get_obj_prop [udm_get_obj -type libcell -filter "name=DECAP*_ASAP7_75t_R"] name]
# create_boundary -prefix ENDCAP
# create_well_tap -cell [get_obj_prop [udm_get_obj -type libcell -filter "name=TAPCELL_ASAP7_75t_R"] name] -spacing 50 -offset 10.564 -prefix WELLTAP

# connect_global_net VDD -type pg -pin VDD -cell *
# connect_global_net VSS -type pg -pin VSS -cell *
##############################
###   powerplan
##############################
# # source ../scr/preplace/powerplan.tcl



write_checkpoint ../DB/${design}.${cur_step}.${version}.db

exit
