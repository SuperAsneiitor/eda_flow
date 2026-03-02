set design  [getenv DESIGN_NAME]
set version [getenv DESIGN_VERSION]

# input setting
set design_config($design,netlist)  [getenv DESIGN_NETLIST]
set design_config($design,sdc)      [getenv DESIGN_SDC]
set design_config($design,def)      [getenv DESIGN_DEF]

set release_dir ../release/${design}/${version}
set rpt_dir ../rpt/${design}/${version}

mkdir -p $release_dir $rpt_dir