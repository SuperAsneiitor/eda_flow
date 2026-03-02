

############################################################
### usefuiSKew
############################################################
setOptMode -usefulSkew true
setOptMode -usefulSkewCCOpt standard
setUsefulSkewMode -maxAllowedDelay 0.05

############################################################
### DRV constraint
############################################################
set_ccopt_property target_skew $skew_value
set_ccopt_property target_insertion_delay $delay_value
set_ccopt_property max_fanout 32
set_ccopt_property target_max_capacitance 0.150
set_ccopt_property target_max_trans 0.150


############################################################
### CK cell Setting
############################################################
# ck buf
set_ccopt_property buffer_cells [list CLKBUFV10_96S6T16UL CLKBUFV12_96S6T16UL CLKBUFV12_96S6X2T16UL CLKBUFV14_96S6T16UL CLKBUFV16_96S6T16UL CLKBUFV1_96S6T16UL CLKBUFV20_96S6T16UL CLKBUFV24_96S6T16UL CLKBUFV24_96S6X2T16UL CLKBUFV2_96S6T16UL CLKBUFV3_96S6T16UL CLKBUFV3_96S6X2T16UL CLKBUFV4_96S6T16UL CLKBUFV5_96S6T16UL CLKBUFV6_96S6T16UL CLKBUFV6_96S6X2T16UL CLKBUFV8_96S6T16UL]
# ck inv 
set_ccopt_property inverter_cells [list CLKINV10_96S6T16UL CLKINV12_96S6T16UL CLKINV12_96S6X2T16UL CLKINV14_96S6T16UL CLKINV16_96S6T16UL CLKINV1_96S6T16UL CLKINV20_96S6T16UL CLKINV24_96S6T16UL CLKINV24_96S6X2T16UL CLKINV2_96S6T16UL CLKINV3_96S6T16UL CLKINV4_96S6T16UL CLKINV5_96S6T16UL CLKINV6_96S6T16UL CLKINV6_96S6X2T16UL CLKINV8_96S6T16UL]
# ck cgate
set_ccopt_property clock_gating_cells [list CLKLANQV10_96S6T16UL CLKLANQV12_96S6T16UL CLKLANQV14_96S6T16UL CLKLANQV16_96S6T16UL CLKLANQV1_96S6T16UL CLKLANQV20_96S6T16UL CLKLANQV24_96S6T16UL CLKLANQV2_96S6T16UL CLKLANQV3_96S6T16UL CLKLANQV4_96S6T16UL CLKLANQV5_96S6T16UL CLKLANQV6_96S6T16UL CLKLANQV8_96S6T16UL]

# ck logic
set_ccopt_property logic_cells [list CLKMUX2V1_96S6T16UL CLKMUX2V2_96S6T16UL CLKMUX2V4_96S6T16UL]

# use inv Switch
set_ccopt_property use_inverters true

# 
set_ccopt_property clustering_mix_inverters_and_buffers false


############################################################
### Sink point Setting
############################################################
set_ccopt_property routing_top_min_fanout 2000



### 1.inter-clock balance
# create_ccopt_skew_group –name clk1 –source clk1 –auto_sinks
# create_ccopt_skew_group –name clk2 –source clk2 –auto_sinks
# create_ccopt_skew_group –name clk3 –balance_skew_groups {clk1 clk2} –target_skew 10


### 2.sink type
# set_ccopt_property sink_type exclude–pin $pin_name
# set_ccopt_property sink_type ignore–pin $pin_name 
# set_ccopt_property sink_type through–pin $pin_name 
# set_ccopt_property sink_type stop–pin $pin_name 

### 3.设置floating pin
# set_ccopt_property insertion_delay –pin $pin2_name 0.03(时钟树变短)
# set_ccopt_property insertion_delay –pin $pin3_name -0.03(时钟树变长)



