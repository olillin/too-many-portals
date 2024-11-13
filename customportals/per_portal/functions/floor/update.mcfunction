execute if entity @s[tag=customportals.a] run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/summon/da
execute if entity @s[tag=customportals.b] run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/summon/db
kill @s