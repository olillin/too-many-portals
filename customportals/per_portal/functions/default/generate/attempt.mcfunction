# Start generation if loaded
# "unless block ~ ~ ~ #customportals:empty" is used to check if the other dimension
# is loaded to avoid generating a new portal when one may already exist
execute if entity @e[type=armor_stand,tag=customportals.target_portal,tag=customportals.b] unless block ~128 {{ customportals.portal.dimension_a_min_height }} ~128 #customportals:empty run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/generate/start
execute if entity @e[type=armor_stand,tag=customportals.target_portal,tag=customportals.a] unless block ~128 {{ customportals.portal.dimension_b_min_height }} ~128 #customportals:empty run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/generate/start
