# add tie cell
globalNetConnect DVSS -type tielo -instanceBasename * -verbose -override
globalNetConnect DVDD -type tiehi -instanceBasename * -verbose -override

setTieHiLoMode -maxFanout 1 -cell { PULL0_96S6T16L PULL1_96S6T16L } -maxDistance 20
addTieHiLo


