# Remove trigger
execute at @e[type=marker,tag=customportals.trigger] run setblock ~ ~ ~ air
# Create portal
fill ~ ~ ~ ~1 ~ ~1 light[level=11]
execute if data entity @s {Dimension:"{{ customportals.portal.dimension_a }}"} run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/summon/da
execute if data entity @s {Dimension:"{{ customportals.portal.dimension_b }}"} run function customportals:portals/{{ customportals.portal.dimension_a_id }}/{{ customportals.portal.dimension_b_id }}/summon/db
scoreboard players set $created_portal customportals 1
