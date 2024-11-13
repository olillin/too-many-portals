# Clamp y-coordinate
summon marker ~ ~ ~ {Tags:["too_many_portals","too_many_portals.force"]}
execute store result score $y too_many_portals run data get entity @e[type=marker,tag=too_many_portals.force,x=0,limit=1,sort=nearest] Pos[1]
execute if entity @e[type=armor_stand,tag=too_many_portals.target_portal,tag=too_many_portals.a] if score $y too_many_portals matches ..{{ too_many_portals.portal.dimension_b_min_height }} run scoreboard players set $y too_many_portals {{ too_many_portals.portal.dimension_b_min_height }}
execute if entity @e[type=armor_stand,tag=too_many_portals.target_portal,tag=too_many_portals.a] if score $y too_many_portals matches {{ too_many_portals.portal.dimension_b_max_height-10 }}.. run scoreboard players set $y too_many_portals {{ too_many_portals.portal.dimension_b_max_height-10 }}
execute if entity @e[type=armor_stand,tag=too_many_portals.target_portal,tag=too_many_portals.b] if score $y too_many_portals matches ..{{ too_many_portals.portal.dimension_a_min_height }} run scoreboard players set $y too_many_portals {{ too_many_portals.portal.dimension_a_min_height }}
execute if entity @e[type=armor_stand,tag=too_many_portals.target_portal,tag=too_many_portals.b] if score $y too_many_portals matches {{ too_many_portals.portal.dimension_a_max_height-10 }}.. run scoreboard players set $y too_many_portals {{ too_many_portals.portal.dimension_a_max_height-10 }}
execute store result entity @e[type=marker,tag=too_many_portals.force,x=0,limit=1,sort=nearest] Pos[1] double 1 run scoreboard players get $y too_many_portals
# Create portal
execute at @e[type=marker,tag=too_many_portals.force,x=0,limit=1,sort=nearest] run function too_many_portals:portals/{{ too_many_portals.portal.dimension_a_id }}/{{ too_many_portals.portal.dimension_b_id }}/generate/create_force
# Kill marker
kill @e[type=marker,tag=too_many_portals.force]