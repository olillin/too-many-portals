execute store result score $get_coordinates.within_2048 iris if entity @s[distance=..0.002048]

execute if score $get_coordinates.within_2048 iris matches 0 run scoreboard players add ${z} iris 2048
execute if score $get_coordinates.within_2048 iris matches 0 positioned ~ ~ ~.002048 run function iris:get_coordinates/z/9
execute if score $get_coordinates.within_2048 iris matches 1 run function iris:get_coordinates/z/9