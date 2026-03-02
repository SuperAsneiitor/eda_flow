#############################
### tool setting
#############################
export INNOVUS_HOME=/data/eda_tool/innovus/inn_21.10.000_lnx86
export PATH=$PATH:${INNOVUS_HOME}/tools.lnx86/dfII/bin
export LM_LICENSE_FILE=$LM_LICENSE_FILE:/data/eda_tool/innovus/inn_21.10.000_lnx86/license/license.dat


##############################
### input setting
##############################
export DESIGN_NAME=""
export DESIGN_VERSION=""
export INPUT_DIR=""

export DESIGN_NETLIST="${INPUT_DIR}//${DESIGN_NAME}.syn.v"
export DESIGN_SDC="${INPUT_DIR}/${DESIGN_NAME}.syn.sdc"
export DESIGN_DEF="${INPUT_DIR}/${DESIGN_NAME}.def"



/data/eda_tool/innovus/inn_21.10.000_lnx86/bin/innovus 
