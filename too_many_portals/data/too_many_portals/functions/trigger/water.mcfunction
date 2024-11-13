advancement revoke @s only too_many_portals:place_water
data modify storage too_many_portals Activation set value "water"
execute anchored eyes positioned ^ ^ ^ run function iris:get_target
execute if score $allow_creation too_many_portals matches 1 at @e[type=marker,tag=iris.ray] run function too_many_portals:check/portal