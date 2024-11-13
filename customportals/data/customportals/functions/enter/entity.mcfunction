tag @s add customportals.teleport
execute as @e[type=armor_stand,tag=customportals.target_portal,sort=nearest,limit=1] run function customportals:enter/identify
tag @s remove customportals.teleport