summon marker ~ ~ ~ {Tags:["too_many_portals","too_many_portals.loadchecker"]}
execute positioned ~-.5 ~-.5 ~-.5 if entity @e[type=marker,tag=too_many_portals.loadchecker,dx=0,dy=0,dz=0] run scoreboard players add $loaded too_many_portals 1
