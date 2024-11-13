# Load other dimension
function too_many_portals:enter/forceload/create_grid
# Search for nearby portals
execute positioned ~-128 -2032 ~-128 as @e[type=armor_stand,tag=too_many_portals.portal,tag={{ too_many_portals.portal.dimension_a_id }},tag={{ too_many_portals.portal.dimension_b_id }},dx=256,dy=4063,dz=256] if score @s too_many_portals_version = @e[type=armor_stand,tag=too_many_portals.target_portal,limit=1] too_many_portals_version run tag @s add too_many_portals.nearby_portals
# Teleport to existing portal
execute if entity @e[type=armor_stand,tag=too_many_portals.nearby_portals] run function too_many_portals:portals/{{ too_many_portals.portal.dimension_a_id }}/{{ too_many_portals.portal.dimension_b_id }}/travel/portal_exists
# Generate
execute if entity @s[type=player] unless entity @e[type=armor_stand,tag=too_many_portals.nearby_portals] if score $chunks too_many_portals matches 289.. unless score $generation_cooldown too_many_portals_time matches 1.. run function too_many_portals:portals/{{ too_many_portals.portal.dimension_a_id }}/{{ too_many_portals.portal.dimension_b_id }}/generate/attempt
execute if score $created_portal too_many_portals matches 1 run scoreboard players set $generation_cooldown too_many_portals_time 40
# Cleanup
tag @e[type=armor_stand,tag=too_many_portals.portal] remove too_many_portals.nearby_portals
