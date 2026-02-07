# tech config
set design_config(${design},tech_gdsmap) ""
set design_config(${design},apr_tech) ""

# lef config
set design_config(${design},lef_std) ""
set design_config(${design},lef_mem) ""

# gds config
set design_config(${design},gds_list) ""

# ccs lib config
set design_config(WorstLT_cworst_CCworst_T,${design},lib_std) ""
set design_config(TTLT_typical,${design},lib_std) ""
set design_config(WorstLT_cworst_CCworst_T,${design},lib_mem) ""
set design_config(TTLT_typical,${design},lib_mem) ""

# CTS Setting
set vars(apr,cts_driver_buf)    ""
set vars(apr,cts_ckinv) ""
set vars(apr,cts_ckbuf) ""
set vars(apr,cts_icg)   ""
set vars(apr,cts_logic) ""

# TIE Setting
set vars(apr,tie_cell)          ""

# corner setting
set design_config(${design},activeSCN) "func_WorstLT_cworst_CCworst_T func_TTLT_typical"
set design_config(rc,${design},cworst_CCworst_T) ""
set design_config(rc,${design},typical) ""

set setup_scenario ""
set hold_scenario ""

set design_config(${design},lef) "$design_config(${design},lef_std)"
set design_config(WorstLT_cworst_CCworst_T,${design},lib) "$design_config(WorstLT_cworst_CCworst_T,${design},lib_std)"
set design_config(TTLT_typical,${design},lib) "$design_config(TTLT_typical,${design},lib_std)"
