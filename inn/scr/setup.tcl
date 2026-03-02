# tech config
set design_config(${design},tech_gdsmap) "/data/tech/library/a01/INNOVUS_12SFE_6T12T_v1p0c/TF/encStreamout.map"
set design_config(${design},apr_tech) "/data/tech/library/a01/INNOVUS_12SFE_6T12T_v1p0c/TF/1P9M_DV_3DM_Q1_2Q2_B_TMa_UTM_ALPA2_P52.lef"

# lef config
set design_config(${design},lef_std) "
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_ECO_LVT_V1P1C/LEF/MACRO/scc12nsfe_96sdb_6tc16p52_enhance_eco_lvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_ECO_RVT_V1P1C/LEF/MACRO/scc12nsfe_96sdb_6tc16p52_enhance_eco_rvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_ECO_ULVT_V1P1C/LEF/MACRO/scc12nsfe_96sdb_6tc16p52_enhance_eco_ulvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_LVT_V1P1C/LEF/MACRO/scc12nsfe_96sdb_6tc16p52_enhance_lvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PEK_LVT_V1P1C/LEF/MACRO/scc12nsfe_96sdb_6tc16p52_enhance_pek_lvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PEK_RVT_V1P1C/LEF/MACRO/scc12nsfe_96sdb_6tc16p52_enhance_pek_rvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PEK_ULVT_V1P1C/LEF/MACRO/scc12nsfe_96sdb_6tc16p52_enhance_pek_ulvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PMK_LVT_V1P1A/LEF/MACRO/ICC2/scc12nsfe_96sdb_6tc16p52_enhance_pmk_lvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PMK_LVT_V1P1A/LEF/MACRO/INNOVUS/scc12nsfe_96sdb_6tc16p52_enhance_pmk_lvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PMK_RVT_V1P1A/LEF/MACRO/ICC2/scc12nsfe_96sdb_6tc16p52_enhance_pmk_rvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PMK_RVT_V1P1A/LEF/MACRO/INNOVUS/scc12nsfe_96sdb_6tc16p52_enhance_pmk_rvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PMK_ULVT_V1P1A/LEF/MACRO/ICC2/scc12nsfe_96sdb_6tc16p52_enhance_pmk_ulvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PMK_ULVT_V1P1A/LEF/MACRO/INNOVUS/scc12nsfe_96sdb_6tc16p52_enhance_pmk_ulvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PPK_LVT_V1P0/LEF/MACRO/scc12nsfe_96sdb_6tc16p52_enhance_ppk_lvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PPK_RVT_V1P0/LEF/MACRO/scc12nsfe_96sdb_6tc16p52_enhance_ppk_rvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PPK_ULVT_V1P0/LEF/MACRO/scc12nsfe_96sdb_6tc16p52_enhance_ppk_ulvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_RVT_V1P1C/LEF/MACRO/scc12nsfe_96sdb_6tc16p52_enhance_rvt_ant.lef
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_ULVT_V1P1C/LEF/MACRO/scc12nsfe_96sdb_6tc16p52_enhance_ulvt_ant.lef
"
set design_config(${design},lef_mem) ""

# gds config
set design_config(${design},gds_list) ""

# ccs lib config
set design_config(WorstLT_cworst_CCworst_T,${design},lib_std) "
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_ECO_LVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_eco_lvt_ssg_v0p81_0c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_ECO_RVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_eco_rvt_ssg_v0p81_0c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_ECO_ULVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_eco_ulvt_ssg_v0p81_0c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_LVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_lvt_ssg_v0p81_0c_ccs.lib
 /data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PEK_LVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_pek_lvt_ssg_v0p81_0c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PEK_RVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_pek_rvt_ssg_v0p81_0c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PEK_ULVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_pek_ulvt_ssg_v0p81_0c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PMK_LVT_V1P1A/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_pmk_lvt_ssg_v0p81_0c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PMK_RVT_V1P1A/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_pmk_rvt_ssg_v0p81_0c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PMK_ULVT_V1P1A/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_pmk_ulvt_ssg_v0p81_0c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_RVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_rvt_ssg_v0p81_0c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_ULVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_ulvt_ssg_v0p81_0c_ccs.lib
"

set design_config(TTLT_typical,${design},lib_std) "
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_ECO_LVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_eco_lvt_tt_v0p9_85c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_ECO_RVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_eco_rvt_tt_v0p9_85c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_ECO_ULVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_eco_ulvt_tt_v0p9_85c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_LVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_lvt_tt_v0p9_85c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PEK_LVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_pek_lvt_tt_v0p9_85c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PEK_RVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_pek_rvt_tt_v0p9_85c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PEK_ULVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_pek_ulvt_tt_v0p9_85c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PMK_LVT_V1P1A/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_pmk_lvt_tt_v0p9_85c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PMK_RVT_V1P1A/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_pmk_rvt_tt_v0p9_85c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_PMK_ULVT_V1P1A/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_pmk_ulvt_tt_v0p9_85c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_RVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_rvt_tt_v0p9_85c_ccs.lib
/data/tech/library/a01/stdcell/original/STDCELL_12NSFE/SCC12NSFE_96SDB_6TC16P52_ENHANCE_ULVT_V1P1C/Liberty/0.9v/scc12nsfe_96sdb_6tc16p52_enhance_ulvt_tt_v0p9_85c_ccs.lib
"
set design_config(WorstLT_cworst_CCworst_T,${design},lib_mem) ""
set design_config(TTLT_typical,${design},lib_mem) ""

# CTS Setting
set vars(apr,cts_driver_buf)    "CLKINV16_96S6T16L"
set vars(apr,cts_ckinv) "CLKINV6_96S6T16L CLKINV8_96S6T16L"
set vars(apr,cts_ckbuf) "CLKBUFV6_96S6T16L CLKBUFV8_96S6T16L CLKINV10_96S6T16L CLKINV12_96S6T16L"
set vars(apr,cts_icg)   "CLKLANQV4_96S6T16L CLKLANQV5_96S6T16L"
set vars(apr,cts_logic) ""

# # TIE Setting
set vars(apr,tie_cell)          "PULL0_96S6T16L PULL1_96S6T16L"

# corner setting
set design_config(${design},activeSCN) "func_WorstLT_cworst_CCworst_T func_TTLT_typical"
set design_config(rc,${design},cworst_CCworst_T) "/data/user/qiaoqihang/project/incoming/process/qrc/SMIC_CCIQRC_12SFE_0818_1P9M_DV_3DM_Q1_3Q2_2TMa_ALPA2_14SHK_V1.10_REV0_0/rulefiles/CMAX_ccworst/qrcTechFile"
set design_config(rc,${design},typical) "/data/user/qiaoqihang/project/incoming/process/qrc/SMIC_CCIQRC_12SFE_0818_1P9M_DV_3DM_Q1_3Q2_2TMa_ALPA2_14SHK_V1.10_REV0_0/rulefiles/TYPICAL/qrcTechFile"

set setup_scenario "func_WorstLT_cworst_CCworst_T func_TTLT_typical"
set hold_scenario "func_WorstLT_cworst_CCworst_T func_TTLT_typical"

set design_config(${design},lef) "$design_config(${design},lef_std)"
set design_config(WorstLT_cworst_CCworst_T,${design},lib) "$design_config(WorstLT_cworst_CCworst_T,${design},lib_std)"
set design_config(TTLT_typical,${design},lib) "$design_config(TTLT_typical,${design},lib_std)"
