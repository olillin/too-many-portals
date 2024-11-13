# Particles
particle portal ~1 ~1.5 ~.5 0.25 0.375 0 1 1
# Sound
scoreboard players add @s customportals_ambience 1
execute if score @s customportals_ambience matches 110.. run playsound minecraft:block.portal.ambient block @a ~1 ~1.5 ~.5 0.25 1
execute if score @s customportals_ambience matches 110.. run scoreboard players reset @s customportals_ambience
# Portal magic
tag @s add customportals.target_portal
execute as @e[type=#customportals:affectable,tag=customportals.affectable,dx=1,dy=2,dz=0] if data entity @s {PortalCooldown:0} run function customportals:in_portal
tag @s remove customportals.target_portal
# Check if broken
function customportals:break/check_x