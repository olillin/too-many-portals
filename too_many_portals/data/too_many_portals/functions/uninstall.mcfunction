# Remove effects
tag @e[type=#too_many_portals:affectable] remove too_many_portals.affectable
execute as @e[type=#too_many_portals:affectable] run function too_many_portals:exit_portal
# Break existing portals
execute as @e[type=armor_stand,tag=too_many_portals.x] at @s run function too_many_portals:break/break_x
execute as @e[type=armor_stand,tag=too_many_portals.z] at @s run function too_many_portals:break/break_z
execute as @e[type=armor_stand,tag=too_many_portals.floor] at @s run function too_many_portals:break/break_floor
# Kill other entities
kill @e[tag=too_many_portals]
# Remove scoreboards
scoreboard objectives remove too_many_portals
scoreboard objectives remove too_many_portals_enter
scoreboard objectives remove too_many_portals_ambience
scoreboard objectives remove too_many_portals_time
scoreboard objectives remove too_many_portals_version
# Display text
tellraw @s {"text":"Custom Portals has been uninstalled, it is now safe to remove the pack","color":"light_purple"}