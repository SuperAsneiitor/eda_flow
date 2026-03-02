set ALL_ICG [get_cells -hier -filter "ref_name =~ *CKLN*" -quiet]
set ALL_ICG_noLatch [get_cells -hier -filter "ref_name =! *CKLN* && full_name !~ *latch*" -quiet]
set ALL_Macros [get_cells [all_registers] -filter "is_hard_macro == true" -quiet]
set ALL_Regs [remove_from_collection [all_registers] [get_cells "$ALL_Macros $ALL_ICG"]]

#############################
group_path -name IN2ICG -from [all_inputs]  -to $ALL_ICG -critical_range 6 -weight 15
group_path -name IN2REG -from [all_inputs]  -to $ALL_Regs -critical_range 6 -weight 15
group_path -name IN2OUT -from [all_inputs]  -to [all_outputs] -critical_range 6 -weight 0.9
group_path -name IN2MEM -from [all_inputs]  -to $ALL_Macros -critical_range 6 -weight 15

group_path -name REG2OUT -from $ALL_Regs -to [all_outputs]
group_path -name REG2REG -from $ALL_Regs -to $ALL_Regs
group_path -name REG2ICG -from $ALL_Regs -to $ALL_ICG
group_path -name REG2ICG_NOLatch -from $ALL_Regs -to $ALL_ICG_noLatch
group_path -name REG2MEM -from $ALL_Regs -to $ALL_Macros
