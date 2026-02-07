set_cfg -reset phy_cell.tie_cell
set_cfg phy_cell.tie_cell.name "$vars(apr,tie_cell)"
set_cfg phy_cell.tie_cell.max_distance 50
set_cfg phy_cell.tie_cell.max_fanout 3
set_cfg phy_cell.tie_cell.prefix add_TieCell
create_tie_cell

