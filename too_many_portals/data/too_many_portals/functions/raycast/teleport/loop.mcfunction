# Default to 1 if outside of the world
scoreboard players set $teleport too_many_portals 1
execute unless block ~ ~ ~ #too_many_portals:empty run scoreboard players set $teleport too_many_portals 0
# Set to 1 if transparent
execute if block ~ ~ ~ #too_many_portals:transparent run scoreboard players set $teleport too_many_portals 1

execute if score $teleport too_many_portals matches 1 run tp @s ~ ~ ~
execute if score $teleport too_many_portals matches 0 positioned ~ ~1 ~ run function too_many_portals:raycast/teleport/loop