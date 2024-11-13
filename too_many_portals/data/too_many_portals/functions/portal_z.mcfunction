# Particles
particle portal ~.5 ~1.5 ~1 0 0.375 0.25 1 1
# Sound
scoreboard players add @s too_many_portals_ambience 1
execute if score @s too_many_portals_ambience matches 110.. run playsound minecraft:block.portal.ambient block @a ~.5 ~1.5 ~1 0.25 1
execute if score @s too_many_portals_ambience matches 110.. run scoreboard players reset @s too_many_portals_ambience
# Portal magic
tag @s add too_many_portals.target_portal
execute as @e[type=#too_many_portals:affectable,tag=too_many_portals.affectable,dx=0,dy=2,dz=1] if data entity @s {PortalCooldown:0} run function too_many_portals:in_portal
tag @s remove too_many_portals.target_portal
# Check if broken
function too_many_portals:break/check_z