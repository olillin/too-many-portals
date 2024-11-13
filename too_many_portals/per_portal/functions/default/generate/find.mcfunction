scoreboard players set $created_portal too_many_portals 0
execute if score $x_portal too_many_portals matches 1 run function too_many_portals:portals/{{ too_many_portals.portal.dimension_a_id }}/{{ too_many_portals.portal.dimension_b_id }}/generate/find_x
execute if score $x_portal too_many_portals matches 0 run function too_many_portals:portals/{{ too_many_portals.portal.dimension_a_id }}/{{ too_many_portals.portal.dimension_b_id }}/generate/find_z
