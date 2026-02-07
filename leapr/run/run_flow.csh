#!/bin/csh

setenv PROCESS  ""
setenv DESIGN_NAME ""
setenv DESIGN_VERSION ""

setenv INPUT_DIR ""


setenv DESIGN_NETLIST "${INPUT_DIR}/${DESIGN_NAME}.place.v"
setenv DESIGN_SDC     "${INPUT_DIR}/${DESIGN_NAME}.place.sdc"
setenv DESIGN_DEF     "${INPUT_DIR}/${DESIGN_NAME}.def"

setenv LOG_DIR "${DESIGN_NAME}.${DESIGN_VERSION}"

mkdir -p  ${LOG_DIR}

leapr -files ../scr/10.inital.tcl   -log ../log/${DESIGN_NAME}.${DESIGN_VERSION}/initial.log &
leapr -files ../scr/20.preplace.tcl -log ../log/${DESIGN_NAME}.${DESIGN_VERSION}/preplace.log &
leapr -files ../scr/30.place.tcl    -log ../log/${DESIGN_NAME}.${DESIGN_VERSION}/place.log &
leapr -files ../scr/40.cts.tcl      -log ../log/${DESIGN_NAME}.${DESIGN_VERSION}/cts.log &
leapr -files ../scr/50.route.tcl    -log ../log/${DESIGN_NAME}.${DESIGN_VERSION}/route.log &



