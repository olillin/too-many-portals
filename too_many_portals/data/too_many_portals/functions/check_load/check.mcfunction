scoreboard players set $loaded too_many_portals 0
function too_many_portals:check_load/block
function too_many_portals:check_load/entity
execute if score $loaded too_many_portals matches 2 run scoreboard players add $chunks too_many_portals 1
kill @e[type=marker,tag=too_many_portals.loadchecker]