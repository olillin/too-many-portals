import json
import os
from pathlib import Path
import shutil
os.chdir(Path(__file__).parent)

offsets = [(x, z) for z in range(-2, 2) for x in range(-2, 2)]

lines = []
predicates = []
for x_offset, z_offset in offsets:
    predicate = []
    for x in range(-1, 3):
        for z in range(-1, 3):
            predicate.append({
                "condition": "inverted",
                "term": {
                    "condition": "location_check",
                    "offsetX": x_offset + x,
                    "offsetY": -1,
                    "offsetZ": z_offset + z,
                    "predicate": {
                        "block": {
                            "tag": "too_many_portals:transparent"
                        }
                    }
                }
            })
            predicate.append({
                "condition": "location_check",
                "offsetX": x_offset + x,
                "offsetY": 0,
                "offsetZ": z_offset + z,
                "predicate": {
                    "block": {
                        "tag": "too_many_portals:transparent"
                    }
                }
            })

    with open(f"{x_offset}_{z_offset}.json", "w") as f:
        predicates.append({
            "condition": "reference",
            "name": f"too_many_portals:suitable/floor/{x_offset}_{z_offset}"
        })
        json.dump(predicate, f)
    lines.append(f"execute unless score $created_portal too_many_portals matches 1 if predicate too_many_portals:suitable/floor/{x_offset}_{z_offset} positioned ~{x_offset} ~ ~{z_offset} run function too_many_portals:portals/{{ too_many_portals.portal.dimension_a_id }}/{{ too_many_portals.portal.dimension_b_id }}/generate/create\n")
with open(f"any.json", "w") as f:
    json.dump({
        "condition": "alternative",
        "terms": predicates
    }, f)
with open(f"find.mcfunction", "w") as f:
    f.writelines(lines)