particle block minecraft:nether_portal ~.5 ~.5 ~.5 0 0 0 1 20
particle block minecraft:nether_portal ~1.5 ~.5 ~.5 0 0 0 1 20
particle block minecraft:nether_portal ~.5 ~1.5 ~.5 0 0 0 1 20
particle block minecraft:nether_portal ~1.5 ~1.5 ~.5 0 0 0 1 20
particle block minecraft:nether_portal ~.5 ~2.5 ~.5 0 0 0 1 20
particle block minecraft:nether_portal ~1.5 ~2.5 ~.5 0 0 0 1 20
playsound block.glass.break block @a ~.5 ~.5 ~.5
playsound block.glass.break block @a ~1.5 ~.5 ~.5
playsound block.glass.break block @a ~.5 ~1.5 ~.5
playsound block.glass.break block @a ~1.5 ~1.5 ~.5
playsound block.glass.break block @a ~.5 ~2.5 ~.5
playsound block.glass.break block @a ~1.5 ~2.5 ~.5
fill ~ ~ ~ ~1 ~2 ~ air replace light[waterlogged=false]
fill ~ ~ ~ ~1 ~2 ~ water replace light[waterlogged=true]

kill @s