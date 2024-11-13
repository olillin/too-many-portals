fill ~-1 ~-1 ~-1 ~2 ~-1 ~2 {{ customportals.portal.block }}
fill ~ ~-1 ~1 ~1 ~-1 ~ light[level=11]
execute if data entity @s {Dimension:"{{ customportals.portal.dimension_a }}"} align xyz positioned ~ ~-1 ~ run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/summon/db
execute if data entity @s {Dimension:"{{ customportals.portal.dimension_b }}"} align xyz positioned ~ ~-1 ~ run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/summon/da
scoreboard players set $created_portal customportals 1