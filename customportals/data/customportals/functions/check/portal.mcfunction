kill @e[type=marker,tag=customportals.trigger]
summon marker ~ ~ ~ {Tags:["customportals","customportals.trigger"]}
scoreboard players set $created_portal customportals 0
function customportals:check/default
execute unless score $created_portal customportals matches 1 run function customportals:check/floor