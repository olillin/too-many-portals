execute store success score $within_4096 iris if score $shift_z iris matches ..4095

execute if score $within_4096 iris matches 0 run scoreboard players remove $shift_z iris 4096
execute if score $within_4096 iris matches 0 positioned ~ ~ ~.004096 run function iris:set_coordinates/z/8
execute if score $within_4096 iris matches 1 run function iris:set_coordinates/z/8