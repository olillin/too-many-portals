scoreboard players set $created_portal customportals 0
execute if score $x_portal customportals matches 1 run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/generate/find_x
execute if score $x_portal customportals matches 0 run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/generate/find_z
