advancement revoke @s only customportals:place_lava
data modify storage customportals Activation set value "lava"
execute anchored eyes positioned ^ ^ ^ run function iris:get_target
execute if score $allow_creation customportals matches 1 at @e[type=marker,tag=iris.ray] run function customportals:check/portal