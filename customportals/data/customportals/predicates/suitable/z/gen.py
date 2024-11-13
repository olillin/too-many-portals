from typing import Any
import json
from pathlib import Path
import os
os.chdir(Path(__file__).parent.absolute())

offsets: list[tuple[int,int,int]] = []
for x in range(-1,2):
    for z in range(-1,2):
        for y in range(0,2):
            offsets.append((x,y,z))
references: list[dict[str,Any]] = []
for offset in offsets:
    terms = []
    for x in range(-1,2):
        for z in range(-1, 3):
            for y in range(0,5):
                terms.append({
                    "condition": "location_check",
                    "offsetX": x + offset[0],
                    "offsetY": y + offset[1],
                    "offsetZ": z + offset[2],
                    "predicate": {
                        "block": {
                            "blocks": ["air","cave_air","void_air"]
                        }
                    }
                })

    name = "_".join([str(i) for i in offset])
    with open(name + ".json", "w") as f:
        json.dump(terms, f)

    references.append({
        "condition": "reference",
        "name": f"customportals:suitable/z/{name}"
    })

with open("any.json", "w") as f:
    json.dump({
        "condition": "alternative",
        "terms": references
    }, f)