execute store success score $within_65536 iris if score $shift_x iris matches ..65535

execute if score $within_65536 iris matches 0 run scoreboard players remove $shift_x iris 65536
execute if score $within_65536 iris matches 0 positioned ~.065536 ~ ~ run function iris:set_coordinates/x/4
execute if score $within_65536 iris matches 1 run function iris:set_coordinates/x/4