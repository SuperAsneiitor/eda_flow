create_library_set -name ssg_0p81v_0c  -timing $design_config(WorstLT_cworst_CCworst_T,${design},lib_std)
create_rc_corner -name c_worst_CCworst_0c \
    -preRoute_res 1.1 \
    -postRoute_res {1 1.1 1.06} \
    -preRoute_cap 1.2 \
    -postRoute_cap {1.1 1.1 1.06} \
    -postRoute_xcap {1 1 1.05} \
    -preRoute_clkres 1.1 \
    -preRoute_clkcap 1.2 \
    -postRoute_clkcap {1 1.1 1.06} \
    -postRoute_clkres {1.1 1.1 1.05} \
    -T 0 \
    -qx_tech_file $design_config(rc,${design},cworst_CCworst_T)

create_delay_corner -name cworst_0_lib  -library_set ssg_0p81v_0c -rc_corner c_worst_CCworst_0c
create_constraint_mode -name func -sdc_file $design_config($design,sdc)
create_analysis_view -name func_WorstLT_cworst_CCworst_T -constraint_mode func -delay_corner cworst_0_lib


create_library_set -name tt_0p9v_85c  -timing $design_config(TTLT_typical,${design},lib_std)
create_rc_corner -name c_tt_0p9v_85c \
    -preRoute_res 1.1\
    -postRoute_res {1 1.1 1.06}\
    -preRoute_cap 1.2\
    -postRoute_cap {1.1 1.1 1.06}\
    -postRoute_xcap {1 1 1.05}\
    -preRoute_clkres 1.1\
    -preRoute_clkcap 1.2\
    -postRoute_clkcap {1 1.1 1.06}\
    -postRoute_clkres {1.1 1.1 1.05}\
    -T 85 \
    -qx_tech_file $design_config(rc,${design},typical)

create_delay_corner -name tt_85c_lib -library_set tt_0p9v_85c -rc_corner c_tt_0p9v_85c
create_analysis_view -name func_TTLT_typical -constraint_mode func -delay_corner tt_85c_lib













