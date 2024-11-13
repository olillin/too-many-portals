execute store result score $tag_added customportals run tag @s add customportals.teleported
execute unless entity @s[type=player] run data modify entity @s PortalCooldown set value 300
execute positioned ~.5 ~ ~.5 run tp @s ~ ~ ~
execute at @s run playsound block.portal.travel ambient @s ~ ~ ~ 0.25 1