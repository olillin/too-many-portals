summon marker ~ ~ ~ {Tags:["customportals","customportals.loadchecker"]}
execute positioned ~-.5 ~-.5 ~-.5 if entity @e[type=marker,tag=customportals.loadchecker,dx=0,dy=0,dz=0] run scoreboard players add $loaded customportals 1
