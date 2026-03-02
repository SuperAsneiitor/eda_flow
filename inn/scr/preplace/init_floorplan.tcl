setFPlanMode -snapDieGrid userDefine
setFPlanMode -snapCoreGrid userDefine


set die_size_width    80
set die_size_height   80
set core_2_die_hor    1
set core_2_dir_ver    1


set create_fp_cmd "floorPlan -noSnapToGrid \
                    -coreMarginsBy die \
                    -fplanOrigin llcorner \
                    -flip s \
                    -d {${die_size_width} ${die_size_height} ${core_2_die_hor} ${core_2_dir_ver} ${core_2_die_hor} ${core_2_dir_ver} }"
eval $create_fp_cmd
