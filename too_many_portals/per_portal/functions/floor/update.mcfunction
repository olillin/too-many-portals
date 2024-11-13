execute if entity @s[tag=too_many_portals.a] run function too_many_portals:portals/{{ too_many_portals.portal.dimension_a_id }}/{{ too_many_portals.portal.dimension_b_id }}/summon/da
execute if entity @s[tag=too_many_portals.b] run function too_many_portals:portals/{{ too_many_portals.portal.dimension_a_id }}/{{ too_many_portals.portal.dimension_b_id }}/summon/db
kill @s