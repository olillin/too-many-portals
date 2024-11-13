# Tag
tag @s add customportals.in_portal
# Nausea
execute unless score @s customportals_enter matches 1.. if data entity @s ActiveEffects[{Id:9}] run tag @s add customportals.had_nausea
effect give @s[tag=!customportals.had_nausea] nausea 30 0 true
# Sound
execute unless score @s customportals_enter matches 1.. at @s run playsound block.portal.trigger ambient @s ~ ~ ~ 0.25 1
# Clock
scoreboard players add @s customportals_enter 1
execute if entity @s[gamemode=creative,scores={customportals_enter=..80}] run scoreboard players set @s customportals_enter 80
execute if entity @s[type=!player,scores={customportals_enter=..80}] run scoreboard players set @s customportals_enter 80
# Enter
execute unless entity @s[tag=customportals.teleported] if score @s customportals_enter matches 80.. run function customportals:enter/entity