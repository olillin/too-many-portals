kill @e[type=marker,tag=customportals.ray]
summon marker ~ ~ ~ {Tags:["customportals","customportals.ray"]}
execute as @e[type=marker,tag=customportals.ray] run tp @s ~ ~ ~ ~ ~
scoreboard players set $recursion_depth customportals 0
execute as @e[type=marker,tag=customportals.ray] run function customportals:raycast/loop
