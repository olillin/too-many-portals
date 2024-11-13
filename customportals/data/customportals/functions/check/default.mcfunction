execute positioned ~ ~-1 ~ facing ~ ~-1 ~ run function customportals:raycast/start
execute if data storage customportals {Activation:"vanilla"} at @e[type=marker,tag=customportals.ray] positioned ~ ~1 ~ run function customportals:check/default/vanilla
execute if data storage customportals {Activation:"water"} at @e[type=marker,tag=customportals.ray] positioned ~ ~1 ~ run function customportals:check/default/water
execute if data storage customportals {Activation:"lava"} at @e[type=marker,tag=customportals.ray] positioned ~ ~1 ~ run function customportals:check/default/lava