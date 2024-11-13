execute store result score $forceloaded customportals run forceload query ~ ~
execute if score $forceloaded customportals matches 0 run function customportals:enter/forceload/create_loader
execute if score $forceloaded customportals matches 1 run scoreboard players reset @e[type=marker,tag=customportals.chunkloader,distance=..16,limit=1,sort=nearest]
function customportals:check_load/check
