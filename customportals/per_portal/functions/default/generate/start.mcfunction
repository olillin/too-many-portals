# Create markers
function customportals:summon_markers
execute if entity @e[type=armor_stand,tag=customportals.target_portal,tag=customportals.a] run spreadplayers ~ ~ 0 16 under {{ customportals.portal.dimension_b_max_height-1 }} false @e[type=marker,tag=customportals.generate]
execute if entity @e[type=armor_stand,tag=customportals.target_portal,tag=customportals.b] run spreadplayers ~ ~ 0 16 under {{ customportals.portal.dimension_a_max_height-1 }} false @e[type=marker,tag=customportals.generate]
# Kill if unsuitable
execute if score $x_portal customportals matches 1 as @e[type=marker,tag=customportals.generate,x=0] at @s unless predicate customportals:suitable/x/any run kill @s
execute if score $x_portal customportals matches 0 as @e[type=marker,tag=customportals.generate,x=0] at @s unless predicate customportals:suitable/z/any run kill @s
# Generate at nearest marker
execute at @e[type=marker,tag=customportals.generate,x=0,limit=1,sort=nearest] run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/generate/find
# Force if no location found
execute unless entity @e[type=marker,tag=customportals.generate,x=0] run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/generate/force
# Kill all markers
kill @e[type=marker,tag=customportals.generate]