from .utils import namespaced
from .console import warning 
from .global_ import DEFAULT_HEIGHTS

from beet import Context
from beet.core.utils import JsonDict
from beet.contrib.worldgen import Dimension, DimensionType

def load_default_dimensions(ctx: Context):
    DEFAULTS = {
        "minecraft:overworld": {
            "max_height": 320,
            "min_height": 70
        },
        "minecraft:the_nether": {
            "max_height": 128,
            "min_height": 70
        },
        "minecraft:the_end": {
            "max_height": 256,
            "min_height": 70
        },
    }
    for name, value in DEFAULTS.items():
        if name in ctx.meta["too_many_portals"]["dimensions"]:
            continue
        else:
            ctx.meta["too_many_portals"]["dimensions"][name] = value

def load_dimensions(ctx: Context):
    if not "dimensions" in ctx.meta["too_many_portals"]:
        ctx.meta["too_many_portals"]["dimensions"] = {}

    ctx.require(load_default_dimensions)

    for name, dimension in ctx.data.list_files():
        if type(dimension) is not Dimension:
            continue
        
        if namespaced(name) in ctx.meta["too_many_portals"]["dimensions"]:
            continue

        dimension_type: str = dimension.data["type"]
        namespace = namespaced(dimension_type).split(":")[0]
        dimension_type = dimension_type.split(":")[1]
        dimension_type = [v for i, v in ctx.data[namespace].content if type(v) is DimensionType and i == dimension_type][0]

        logical_height = dimension_type.data["logical_height"]
        min_y = dimension_type.data["min_y"]

        ctx.meta["too_many_portals"]["dimensions"][name] = {
            "min_height": min_y,
            "max_height": min_y + logical_height
        }

def get_heights(ctx: Context, dimension: str) -> JsonDict:
    if dimension in ctx.meta["too_many_portals"]["dimensions"]:
        return ctx.meta["too_many_portals"]["dimensions"][dimension]

    warning(f'Heights not defined for dimension "{dimension}", using defaults')
    return DEFAULT_HEIGHTS