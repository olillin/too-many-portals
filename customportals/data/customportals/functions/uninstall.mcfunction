# Remove effects
tag @e[type=#customportals:affectable] remove customportals.affectable
execute as @e[type=#customportals:affectable] run function customportals:exit_portal
# Break existing portals
execute as @e[type=armor_stand,tag=customportals.x] at @s run function customportals:break/break_x
execute as @e[type=armor_stand,tag=customportals.z] at @s run function customportals:break/break_z
execute as @e[type=armor_stand,tag=customportals.floor] at @s run function customportals:break/break_floor
# Kill other entities
kill @e[tag=customportals]
# Remove scoreboards
scoreboard objectives remove customportals
scoreboard objectives remove customportals_enter
scoreboard objectives remove customportals_ambience
scoreboard objectives remove customportals_time
scoreboard objectives remove customportals_version
# Display text
tellraw @s {"text":"Custom Portals has been uninstalled, it is now safe to remove the pack","color":"light_purple"}