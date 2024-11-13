scoreboard players add $recursion_depth too_many_portals 1
tp @s ~ ~ ~
execute if score $recursion_depth too_many_portals matches 4.. run kill @s
execute if block ~ ~ ~ #iris:air unless score $recursion_depth too_many_portals matches 4.. positioned ^ ^ ^1 run function too_many_portals:raycast/loop