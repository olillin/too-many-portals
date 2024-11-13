particle block minecraft:nether_portal ~.5 ~.5 ~.5 0 0 0 1 20
particle block minecraft:nether_portal ~.5 ~.5 ~1.5 0 0 0 1 20
particle block minecraft:nether_portal ~.5 ~1.5 ~.5 0 0 0 1 20
particle block minecraft:nether_portal ~.5 ~1.5 ~1.5 0 0 0 1 20
particle block minecraft:nether_portal ~.5 ~2.5 ~.5 0 0 0 1 20
particle block minecraft:nether_portal ~.5 ~2.5 ~1.5 0 0 0 1 20
playsound block.glass.break block @a ~.5 ~.5 ~.5
playsound block.glass.break block @a ~.5 ~.5 ~1.5
playsound block.glass.break block @a ~.5 ~1.5 ~.5
playsound block.glass.break block @a ~.5 ~1.5 ~1.5
playsound block.glass.break block @a ~.5 ~2.5 ~.5
playsound block.glass.break block @a ~.5 ~2.5 ~1.5
fill ~ ~ ~ ~ ~2 ~1 air replace light[waterlogged=false]
fill ~ ~ ~ ~ ~2 ~1 water replace light[waterlogged=true]

kill @s