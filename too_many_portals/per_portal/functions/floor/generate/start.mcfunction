# Summon markers
function too_many_portals:summon_markers
execute if entity @e[type=armor_stand,tag=too_many_portals.target_portal,tag=too_many_portals.a] run spreadplayers ~ ~ 0 16 under {{ too_many_portals.portal.dimension_b_max_height-1 }} false @e[type=marker,tag=too_many_portals.generate]
execute if entity @e[type=armor_stand,tag=too_many_portals.target_portal,tag=too_many_portals.b] run spreadplayers ~ ~ 0 16 under {{ too_many_portals.portal.dimension_a_max_height-1 }} false @e[type=marker,tag=too_many_portals.generate]
# Kill if unsuitable
execute as @e[type=marker,tag=too_many_portals.generate,x=0] at @s unless predicate too_many_portals:suitable/floor/any run kill @s
# Generate at nearest marker
execute at @e[type=marker,tag=too_many_portals.generate,x=0,limit=1,sort=nearest] run function too_many_portals:portals/{{ too_many_portals.portal.dimension_a_id }}/{{ too_many_portals.portal.dimension_b_id }}/generate/find
# Force if no location found
execute unless entity @e[type=marker,tag=too_many_portals.generate,x=0] run function too_many_portals:portals/{{ too_many_portals.portal.dimension_a_id }}/{{ too_many_portals.portal.dimension_b_id }}/generate/force
# Kill all markers
kill @e[type=marker,tag=too_many_portals.generate]