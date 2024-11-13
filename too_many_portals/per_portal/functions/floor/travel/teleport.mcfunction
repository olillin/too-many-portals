execute store result score $tag_added too_many_portals run tag @s add too_many_portals.teleported
execute unless entity @s[type=player] run data modify entity @s PortalCooldown set value 300
effect give @s slow_falling 1 0 true
execute positioned ~.5 ~ ~-0.5 run function too_many_portals:raycast/teleport/loop
execute at @s run playsound block.portal.travel ambient @s ~ ~ ~ 0.25 1