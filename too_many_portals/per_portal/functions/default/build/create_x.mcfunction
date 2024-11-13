# Remove trigger
execute at @e[type=marker,tag=too_many_portals.trigger] run setblock ~ ~ ~ air
# Create portal
fill ~ ~ ~ ~1 ~2 ~ light[level=11]
execute if data entity @s {Dimension:"{{ too_many_portals.portal.dimension_a }}"} run function too_many_portals:portals/{{ too_many_portals.portal.dimension_a_id }}/{{ too_many_portals.portal.dimension_b_id }}/summon/x_da
execute if data entity @s {Dimension:"{{ too_many_portals.portal.dimension_b }}"} run function too_many_portals:portals/{{ too_many_portals.portal.dimension_a_id }}/{{ too_many_portals.portal.dimension_b_id }}/summon/x_db
scoreboard players set $created_portal too_many_portals 1
