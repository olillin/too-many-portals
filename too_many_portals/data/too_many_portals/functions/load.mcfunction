# Main scoreboard
scoreboard objectives add too_many_portals dummy
# Entry timers for entities in portals
scoreboard objectives add too_many_portals_enter dummy
# Timer for portal sounds
scoreboard objectives add too_many_portals_ambience dummy
# Despawn time for chunkloaders and cooldown for entities
scoreboard objectives add too_many_portals_time dummy
# Update old portals
scoreboard objectives add too_many_portals_version dummy
scoreboard players set $current too_many_portals_version {{ too_many_portals.uuid }}

# Default config
execute unless score $allow_creation too_many_portals matches 0..1 run scoreboard players set $allow_creation too_many_portals 1