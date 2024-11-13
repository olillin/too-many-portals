# Tag
tag @s add too_many_portals.in_portal
# Nausea
execute unless score @s too_many_portals_enter matches 1.. if data entity @s ActiveEffects[{Id:9}] run tag @s add too_many_portals.had_nausea
effect give @s[tag=!too_many_portals.had_nausea] nausea 30 0 true
# Sound
execute unless score @s too_many_portals_enter matches 1.. at @s run playsound block.portal.trigger ambient @s ~ ~ ~ 0.25 1
# Clock
scoreboard players add @s too_many_portals_enter 1
execute if entity @s[gamemode=creative,scores={too_many_portals_enter=..80}] run scoreboard players set @s too_many_portals_enter 80
execute if entity @s[type=!player,scores={too_many_portals_enter=..80}] run scoreboard players set @s too_many_portals_enter 80
# Enter
execute unless entity @s[tag=too_many_portals.teleported] if score @s too_many_portals_enter matches 80.. run function too_many_portals:enter/entity