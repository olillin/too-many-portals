tag @e[tag=too_many_portals.in_portal] remove too_many_portals.in_portal
execute as @e[type=armor_stand,tag=too_many_portals.portal,tag=too_many_portals.x] at @s run function too_many_portals:portal_x
execute as @e[type=armor_stand,tag=too_many_portals.portal,tag=too_many_portals.z] at @s run function too_many_portals:portal_z
execute as @e[type=armor_stand,tag=too_many_portals.portal,tag=too_many_portals.floor] at @s run function too_many_portals:portal_floor
execute as @e[type=#too_many_portals:affectable,tag=!too_many_portals.in_portal,scores={too_many_portals_enter=1..}] run function too_many_portals:exit_portal
execute as @a[gamemode=spectator,scores={too_many_portals_enter=1..}] run function too_many_portals:exit_portal