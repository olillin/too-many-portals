scoreboard players add $recursion_depth customportals 1
tp @s ~ ~ ~
execute if score $recursion_depth customportals matches 4.. run kill @s
execute if block ~ ~ ~ #iris:air unless score $recursion_depth customportals matches 4.. positioned ^ ^ ^1 run function customportals:raycast/loop