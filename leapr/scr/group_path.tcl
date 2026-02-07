#group path
reset_path_group -all
create_path_groups -include_io_path

group_path -name reg2mem -from [get_all_registers] -to [get_cells -hier -filter "is_memory_cell ==true"]
group_path -name mem2reg -from [get_cells -hier -filter "is_memory_cell ==true"] -to [get_all_registers]
group_path -name in2clkgate  -from [all_inputs]  -to [filter_collection [get_all_registers] "is_integrated_clock_gating_cell == true"]
group_path -name REG2REG -from [get_cells [add_to_collection [get_all_registers -flops] [get_all_registers -latches]]] -to [get_cells [add_to_collection [get_all_registers -flops] [get_all_registers -latches]]]
set_path_group_configs reg2cgate  -effort high   -weight 5   -adjust_slack 0
set_path_group_configs in2clkgate -effort low    -weight 5   -adjust_slack 0
set_path_group_configs reg2mem    -effort high   -weight 5   -adjust_slack 0
set_path_group_configs mem2reg    -effort high   -weight 5   -adjust_slack 0
set_path_group_configs reg2reg    -effort high   -weight 5   -adjust_slack 0
set_path_group_configs REG2REG    -effort high   -weight 10  -adjust_slack 0
set_path_group_configs in2reg     -effort low    -weight 1   -adjust_slack 0
set_path_group_configs reg2out    -effort low    -weight 1   -adjust_slack 0
set_path_group_configs in2out     -effort low    -weight 1   -adjust_slack 0
