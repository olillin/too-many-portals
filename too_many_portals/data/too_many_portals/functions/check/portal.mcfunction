kill @e[type=marker,tag=too_many_portals.trigger]
summon marker ~ ~ ~ {Tags:["too_many_portals","too_many_portals.trigger"]}
scoreboard players set $created_portal too_many_portals 0
function too_many_portals:check/default
execute unless score $created_portal too_many_portals matches 1 run function too_many_portals:check/floor