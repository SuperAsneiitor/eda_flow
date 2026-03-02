#!/bin/csh

setenv INPUT_DIR    ""

setenv DESIGN_NAME          ""
setenv DESIGN_SDC           "${INPUT_DIR}/${DESIGN_NAME}/${DESIGN_NAME}.sdc.tcl"   
setenv DESIGN_FILE_LIST     "${INPUT_DIR}/${DESIGN_NAME}/${DESIGN_NAME}.f"   
setenv DESIGN_VERSION       ""

dc_shell -f ../scr/syn_main.tcl | tee ../log/${DESIGN_NAME}.${DESIGN_VERSION}.log
