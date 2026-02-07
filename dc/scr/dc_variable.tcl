set_svf $release_dir/${design_name}.syn.svf
set sh_command_log_file ../log/${design_name}.${design_version}.log
set CACHE_PATH $work_dir
define_design_lib WORK -path "$work_dir"


set_host_options -max_cores 16

set_app_var alib_library_analysis_path $CACHE_PATH
set_app_var cache_write $CACHE_PATH
set_app_var cache_read $CACHE_PATH

set hdlin_vhdl93_concat false
set hdlin_vhdl_87 true
set hdlin_vrlg_std 2001
set hdlin_sverilog_std 2005
set link_portname_allow_period_to_match_underscore true
set upf_create_implicit_supply_sets false

set_app_var lib_cell_using_delay_from_ccs false
set_app_var lib_pin_using_cap_from_ccs false
set_app_var rc_driver_model_mode basic
set_app_var rc_receiver_model_mode basic

set_app_var company eda_study
set_app_var designer impl
set_app_var enable_page_mode true

set_app_var enable_recovery_removal_arcs false
set_app_var hdlin_shorten_long_module_name true
set_app_var hdlin_auto_save_templates true
set_app_var hdlin_check_no_latch true




set_app_var power_hdlc_do_not_split_cg_cells false
set_app_var power_do_not_size_icg_cells false
set_app_var verilogout_equation false
set_app_var verilogout_no_tri true
set mw_logicl1_net "VDD"
set mw_logice0_net "VSS"
set synlib_waitfor_design_license "Designware DC-Ultra-Opt Power-Optimization"
set_app_var compile_register_replication false
set_app_var compile_enable_constant_propagation_with_no_boundary_opt false
set_app_var compile_fix_multiple_port_nets true
set_app_var compile_automatic_clock_phase_inference relaxed
set_app_var hdlin_shorten_long_module_name true
set hdlin_modulename_limit 128
set_app_var verilogout_no_tri true
set bus_namingstyle {%s[%d]}
set_app_var bus_inference_style {%s[%d]}
set_app_var bus_range_separator_style :
set_app_var hdlout_internal_busses true
set_app_var verilogout_ignore_case false
set_app_var verilogout_higher_designs_first true
# set_app_var verilogout_no_negative_index true
set_app_var verilogout_show_unconnected_pins true
set_app_var verilogout_single_bit false
set_app_var verilogout_unconnected_prefix SYNOPSYS_UNCONNECTED_
set_app_var template_naming_style %s_%p
set_app_var template_parameter_style %d
set_app_var case_analysis_with_logic_constants true
set_app_var collection_result_display_limit 500
#use for register replication
set_app_var register_replication_naming_style %s_REP%d




set_app_var disable_multicore_resource_checks true
set_app_var write_sdc_output_lumped_net_capacitance false
set write_sdc_outputnet_resistance false
set_app_var write_name_nets_same_as_ports true

##------------
##compile var
###------------
set_app_var enable_recovery_removal_arcs false
set_app_var hdlin_preserve_sequential true
set_app_var compile_delete_unloaded_sequential_cells    false

set_app_var compile_seqmap_propagate_constants false
set_app_var compile_seqmap_propagate_high_effort false
set_app_var compile_seqmap_identify_shift_registers false

# get_app_var compile_preserve_subdesign_interfaces false
get_app_var compile_preserve_subdesign_interfaces

set_app_var compile_disable_hierarchical_inverter_opt true
set_app_var compile_no_new_cells_at_top_level false
set_app_var compile_preserve_subdesign_interfaces true

set_app_var timing_enable_multiple_clocks_per_reg true
set_app_var timing_non_unate_clock_compatibility true
set_app_var power_cg_gated_clock_net_naming_style "CLKGATING_%c_%g_%d"
set_app_var power_cg_module_naming_style "POWERMODULE_%e_%t_%d"
set_app_var power_cg_cell_naming_style "POWERGATING_%c_%n_%d"
set compile_ultra_ungroup_dw false
set compile_ultra_ungroup_small_hierarchies false

suppress_message {DDB-24 }
suppress_message {ELAB-311 ELAB-349 ELAB-389 ELAB-393 ELAB-909 ELAB-910}
suppress_message {VER-6l VER-129 VER-130 VER-173 VER-311 VER-3l4 VER-318 VER-936}
suppress_message {TRANS-11 }
suppress_message {OPT-207}
set_app_var timing_input_port_default_clock     true
set_app_var hdlin_vrlg_std 2005
echo "verilog std: $hdlin_vrlg_std"
set_app_var report_default_significant_digits 4
set_app_var compile_seqmap_honor_sync_set_reset true
set_app_var hdlin_ff_always_sync_set_reset true
set_app_var hdlin_infer_multibit default_all
set     compile_multibit_lib_analysis true
get_license {Test-Compiler \
    Power-Optimization \
    HDL-Compiler \
    Design-Compiler \
    DesignWare \
    DC-Ultra-Opt \
    DC-Expert \
    DC-Ultra-Features}
set_app_var auto_wire_load_selection true





































