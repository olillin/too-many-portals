# Main scoreboard
scoreboard objectives add customportals dummy
# Entry timers for entities in portals
scoreboard objectives add customportals_enter dummy
# Timer for portal sounds
scoreboard objectives add customportals_ambience dummy
# Despawn time for chunkloaders and cooldown for entities
scoreboard objectives add customportals_time dummy
# Update old portals
scoreboard objectives add customportals_version dummy
scoreboard players set $current customportals_version {{ customportals.uuid }}

# Default config
execute unless score $allow_creation customportals matches 0..1 run scoreboard players set $allow_creation customportals 1