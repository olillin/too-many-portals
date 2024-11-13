fill ~-1 ~-1 ~-1 ~2 ~-1 ~2 {{ too_many_portals.portal.block }}
fill ~ ~-1 ~1 ~1 ~-1 ~ light[level=11]
execute if data entity @s {Dimension:"{{ too_many_portals.portal.dimension_a }}"} align xyz positioned ~ ~-1 ~ run function too_many_portals:portals/{{ too_many_portals.portal.dimension_a_id }}/{{ too_many_portals.portal.dimension_b_id }}/summon/db
execute if data entity @s {Dimension:"{{ too_many_portals.portal.dimension_b }}"} align xyz positioned ~ ~-1 ~ run function too_many_portals:portals/{{ too_many_portals.portal.dimension_a_id }}/{{ too_many_portals.portal.dimension_b_id }}/summon/da
scoreboard players set $created_portal too_many_portals 1