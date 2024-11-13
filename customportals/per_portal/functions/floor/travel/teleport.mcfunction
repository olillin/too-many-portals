execute store result score $tag_added customportals run tag @s add customportals.teleported
execute unless entity @s[type=player] run data modify entity @s PortalCooldown set value 300
effect give @s slow_falling 1 0 true
execute positioned ~.5 ~ ~-0.5 run function customportals:raycast/teleport/loop
execute at @s run playsound block.portal.travel ambient @s ~ ~ ~ 0.25 1