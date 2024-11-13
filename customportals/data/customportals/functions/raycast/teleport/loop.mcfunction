# Default to 1 if outside of the world
scoreboard players set $teleport customportals 1
execute unless block ~ ~ ~ #customportals:empty run scoreboard players set $teleport customportals 0
# Set to 1 if transparent
execute if block ~ ~ ~ #customportals:transparent run scoreboard players set $teleport customportals 1

execute if score $teleport customportals matches 1 run tp @s ~ ~ ~
execute if score $teleport customportals matches 0 positioned ~ ~1 ~ run function customportals:raycast/teleport/loop