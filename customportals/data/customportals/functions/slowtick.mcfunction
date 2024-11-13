# Revoke advancement triggers
function customportals:revoke_trigger
# Tag entities that can go through portals
tag @e[type=#customportals:affectable,tag=customportals.affectable] remove customportals.affectable
tag @e[type=#customportals:affectable,predicate=customportals:affectable] add customportals.affectable
# Update old portals
execute as @e[type=armor_stand,tag=customportals.portal] unless score @s customportals_version = $current customportals_version at @s run function customportals:update
# Unload forceloaded chunks
execute as @e[type=marker,tag=customportals.chunkloader] run function customportals:enter/forceload/update
# Decrease generation cooldown
execute if score $generation_cooldown customportals_time matches 1.. run scoreboard players remove $generation_cooldown customportals_time 10
execute if score $generation_cooldown customportals_time matches ..0 run scoreboard players reset $generation_cooldown customportals_time
# Loop
schedule function customportals:slowtick 10t