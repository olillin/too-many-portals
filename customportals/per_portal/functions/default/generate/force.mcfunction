# Clamp y-coordinate
summon marker ~ ~ ~ {Tags:["customportals","customportals.force"]}
execute store result score $y customportals run data get entity @e[type=marker,tag=customportals.force,limit=1,sort=nearest] Pos[1]
execute if entity @e[type=armor_stand,tag=customportals.target_portal,tag=customportals.a] if score $y customportals matches ..{{ customportals.portal.dimension_b_min_height }} run scoreboard players set $y customportals {{ customportals.portal.dimension_b_min_height }}
execute if entity @e[type=armor_stand,tag=customportals.target_portal,tag=customportals.a] if score $y customportals matches {{ customportals.portal.dimension_b_max_height-10 }}.. run scoreboard players set $y customportals {{ customportals.portal.dimension_b_max_height-10 }}
execute if entity @e[type=armor_stand,tag=customportals.target_portal,tag=customportals.b] if score $y customportals matches ..{{ customportals.portal.dimension_a_min_height }} run scoreboard players set $y customportals {{ customportals.portal.dimension_a_min_height }}
execute if entity @e[type=armor_stand,tag=customportals.target_portal,tag=customportals.b] if score $y customportals matches {{ customportals.portal.dimension_a_max_height-10 }}.. run scoreboard players set $y customportals {{ customportals.portal.dimension_a_max_height-10 }}
execute store result entity @e[type=marker,tag=customportals.force,limit=1,sort=nearest] Pos[1] double 1 run scoreboard players get $y customportals
# Create portal
execute if score $x_portal customportals matches 1 at @e[type=marker,tag=customportals.force,limit=1,sort=nearest] run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/generate/force_x
execute if score $x_portal customportals matches 0 at @e[type=marker,tag=customportals.force,limit=1,sort=nearest] run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/generate/force_z
# Kill marker
kill @e[type=marker,tag=customportals.force]