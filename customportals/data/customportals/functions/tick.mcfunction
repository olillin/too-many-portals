tag @e[tag=customportals.in_portal] remove customportals.in_portal
execute as @e[type=armor_stand,tag=customportals.portal,tag=customportals.x] at @s run function customportals:portal_x
execute as @e[type=armor_stand,tag=customportals.portal,tag=customportals.z] at @s run function customportals:portal_z
execute as @e[type=armor_stand,tag=customportals.portal,tag=customportals.floor] at @s run function customportals:portal_floor
execute as @e[type=#customportals:affectable,tag=!customportals.in_portal,scores={customportals_enter=1..}] run function customportals:exit_portal
execute as @a[gamemode=spectator,scores={customportals_enter=1..}] run function customportals:exit_portal