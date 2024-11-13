# Revoke advancement triggers
function too_many_portals:revoke_trigger
# Tag entities that can go through portals
tag @e[type=#too_many_portals:affectable,tag=too_many_portals.affectable] remove too_many_portals.affectable
tag @e[type=#too_many_portals:affectable,predicate=too_many_portals:affectable] add too_many_portals.affectable
# Update old portals
execute as @e[type=armor_stand,tag=too_many_portals.portal] unless score @s too_many_portals_version = $current too_many_portals_version at @s run function too_many_portals:update
# Unload forceloaded chunks
execute as @e[type=marker,tag=too_many_portals.chunkloader] run function too_many_portals:enter/forceload/update
# Decrease generation cooldown
execute if score $generation_cooldown too_many_portals_time matches 1.. run scoreboard players remove $generation_cooldown too_many_portals_time 10
execute if score $generation_cooldown too_many_portals_time matches ..0 run scoreboard players reset $generation_cooldown too_many_portals_time
# Loop
schedule function too_many_portals:slowtick 10t