create_ndr -width_scale {M3:M4 2} -name NDR_2W1S_rule
create_ndr -spacing_scale {M5:M7 2} -width_scale {M5:M7 2} -name NDR_2W2S_rule

set_clock_route_rule -ndr NDR_2W1S_rule -name trunk_ndr_route -prefer_min_metal M3 -prefer_max_metal M4 -prefer_metal_effort high
set_clock_route_rule -ndr NDR_2W2S_rule -name top_ndr_route -prefer_min_metal M5 -prefer_max_metal M7 -prefer_metal_effort high
set_clock_route_type trunk_ndr_route -trunk
set_clock_route_type top_ndr_route -top


#Clock Cells
set_cts_spec -attribute buffers $vars(apr,cts_ckbuf)
set_cts_spec -attribute inverters $vars(apr,cts_ckinv)
set_cts_spec -attribute clock_gates $vars(apr,cts_icg)


set_cts_spec -attribute enable_use_inverter true
set_cts_spec -attribute max_fanout 24
set_cts_spec -attribute max_trans 150







