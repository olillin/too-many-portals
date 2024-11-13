execute store result score $forceloaded too_many_portals run forceload query ~ ~
execute if score $forceloaded too_many_portals matches 0 run function too_many_portals:enter/forceload/create_loader
execute if score $forceloaded too_many_portals matches 1 run scoreboard players reset @e[type=marker,tag=too_many_portals.chunkloader,distance=..16,limit=1,sort=nearest]
function too_many_portals:check_load/check
