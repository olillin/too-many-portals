tag @s add too_many_portals.teleport
execute as @e[type=armor_stand,tag=too_many_portals.target_portal,sort=nearest,limit=1] run function too_many_portals:enter/identify
tag @s remove too_many_portals.teleport