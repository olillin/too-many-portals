execute if entity @s[tag=customportals.x,tag=customportals.a] run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/summon/x_da
execute if entity @s[tag=customportals.x,tag=customportals.b] run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/summon/x_db
execute if entity @s[tag=customportals.z,tag=customportals.a] run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/summon/z_da
execute if entity @s[tag=customportals.z,tag=customportals.b] run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/summon/z_db
kill @s