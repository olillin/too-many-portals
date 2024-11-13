# Load other dimension
function customportals:enter/forceload/create_grid
# Search for nearby portals
execute positioned ~-128 -2032 ~-128 as @e[type=armor_stand,tag=customportals.portal,tag={{ customportals.portal.dimension_a_id }},tag={{ customportals.portal.dimension_b_id }},dx=256,dy=4063,dz=256] if score @s customportals_version = @e[type=armor_stand,tag=customportals.target_portal,limit=1] customportals_version run tag @s add customportals.nearby_portals
# Teleport to existing portal
execute if entity @e[type=armor_stand,tag=customportals.nearby_portals] run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/travel/portal_exists
# Generate
execute if entity @s[type=player] unless entity @e[type=armor_stand,tag=customportals.nearby_portals] if score $chunks customportals matches 289.. unless score $generation_cooldown customportals_time matches 1.. run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/generate/attempt
execute if score $created_portal customportals matches 1 run scoreboard players set $generation_cooldown customportals_time 40
# Cleanup
tag @e[type=armor_stand,tag=customportals.portal] remove customportals.nearby_portals
