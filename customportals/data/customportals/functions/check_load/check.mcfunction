scoreboard players set $loaded customportals 0
function customportals:check_load/block
function customportals:check_load/entity
execute if score $loaded customportals matches 2 run scoreboard players add $chunks customportals 1
kill @e[type=marker,tag=customportals.loadchecker]