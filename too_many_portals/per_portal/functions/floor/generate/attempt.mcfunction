# Start generation if loaded
# "unless block ~ ~ ~ #too_many_portals:empty" is used to check if the other dimension
# is loaded to avoid generating a new portal when one may already exist
execute if entity @e[type=armor_stand,tag=too_many_portals.target_portal,tag=too_many_portals.b] unless block ~128 {{ too_many_portals.portal.dimension_a_min_height }} ~128 #too_many_portals:empty run function too_many_portals:portals/{{ too_many_portals.portal.dimension_a_id }}/{{ too_many_portals.portal.dimension_b_id }}/generate/start
execute if entity @e[type=armor_stand,tag=too_many_portals.target_portal,tag=too_many_portals.a] unless block ~128 {{ too_many_portals.portal.dimension_b_min_height }} ~128 #too_many_portals:empty run function too_many_portals:portals/{{ too_many_portals.portal.dimension_a_id }}/{{ too_many_portals.portal.dimension_b_id }}/generate/start
