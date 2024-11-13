kill @e[type=marker,tag=too_many_portals.ray]
summon marker ~ ~ ~ {Tags:["too_many_portals","too_many_portals.ray"]}
execute as @e[type=marker,tag=too_many_portals.ray] run tp @s ~ ~ ~ ~ ~
scoreboard players set $recursion_depth too_many_portals 0
execute as @e[type=marker,tag=too_many_portals.ray] run function too_many_portals:raycast/loop
