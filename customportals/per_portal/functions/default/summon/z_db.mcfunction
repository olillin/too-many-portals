summon armor_stand ~ ~ ~ {Tags:["customportals","customportals.new","customportals.portal","customportals.z","{{ customportals.portal.dimension_a_id }}","{{ customportals.portal.dimension_b_id }}","customportals.b","customportals.new"],Invisible:1b,Marker:1b,ArmorItems:[{},{},{},{id:"minecraft:purple_stained_glass",Count:1b,tag:{CustomModelData:{{ customportals.portal.custom_model_data_z }}}}]}
scoreboard players operation @e[type=armor_stand,tag=customportals.new,distance=..0.1,limit=1] customportals_version = $current customportals_version
tag @e[type=armor_stand,tag=customportals.new] remove customportals.new