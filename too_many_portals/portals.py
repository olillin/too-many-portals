from .global_ import NAMESPACE
from .textures import create_portal_texture
from .options import ConfigOptions
from .utils import *
from .dimensions import get_heights
from .console import colored

from beet import Context, configurable, Predicate, Model
from beet.core.utils import JsonDict
from beet.contrib.load import load
from beet.contrib.render import render
from typing import Literal, List
import json

@configurable("too_many_portals", validator=ConfigOptions)
def create_portals(ctx: Context, config: ConfigOptions):
    if "minecraft:item/purple_stained_glass" not in ctx.assets.models:
        ctx.assets.models["minecraft:item/purple_stained_glass"] = Model({
            "parent": "minecraft:block/purple_stained_glass",
            "overrides": []
        })
    elif "overrides" not in ctx.assets.models["minecraft:item/purple_stained_glass"].data:
        ctx.assets.models["minecraft:item/purple_stained_glass"].data["overrides"] = []
    custom_model_data = config.custom_model_data_start

    for i, portal in enumerate(config.portals):


        dimension_a = namespaced(portal.dimension_a)
        dimension_a_id = dimension_id(dimension_a)
        dimension_a_heights = get_heights(ctx, dimension_a)
        dimension_b = namespaced(portal.dimension_b)
        dimension_b_id = dimension_id(dimension_b)
        dimension_b_heights = get_heights(ctx, dimension_b)

        print(colored.cyan(f"Creating portal between {dimension_a} and {dimension_b}"))

        block = namespaced(portal.block)
        activation_block = namespaced(portal.activation.replace("vanilla", "fire"))

        custom_model_data_x = custom_model_data
        custom_model_data_z = custom_model_data+1

        # Define placeholders
        ctx.meta["too_many_portals"]["portal"] = {}
        for name, value in {
            "dimension_a":            dimension_a,
            "dimension_a_id":         dimension_a_id,
            "dimension_a_max_height": dimension_a_heights["max_height"],
            "dimension_a_min_height": dimension_a_heights["min_height"],
            "dimension_b":            dimension_b,
            "dimension_b_id":         dimension_b_id,
            "dimension_b_max_height": dimension_b_heights["max_height"],
            "dimension_b_min_height": dimension_b_heights["min_height"],
            "block":                  block,
            "activation_block":       activation_block,
            "custom_model_data":      custom_model_data,
            "custom_model_data_x":    custom_model_data_x,
            "custom_model_data_z":    custom_model_data_z,
        }.items():
            ctx.meta["too_many_portals"]["portal"][name] = value

        # Render functions
        path = f"portals/{dimension_a_id}/{dimension_b_id}"
        ctx.require(
            load(data_pack={
                f"data/too_many_portals/functions/{path}": f'too_many_portals/per_portal/functions/{"floor" if portal.floor_portal else "default"}'
            }),
            render(data_pack={
                "functions": ["too_many_portals:" + path]
            })
        )

        # Create predicates
        if portal.floor_portal:
            ctx.data.predicates[f"{NAMESPACE}:{path}/valid_frame"] = predicate("floor", block, ["air", "cave_air", "void_air", activation_block])
            ctx.data.predicates[f"{NAMESPACE}:{path}/created_frame"] = predicate("floor", block, ["light"], portal_states={"waterlogged": False})
        else:
            ctx.data.predicates[f"{NAMESPACE}:{path}/valid_frame_x"] = predicate("x", block, ["air", "cave_air", "void_air", activation_block])
            ctx.data.predicates[f"{NAMESPACE}:{path}/valid_frame_z"] = predicate("z", block, ["air", "cave_air", "void_air", activation_block])
            ctx.data.predicates[f"{NAMESPACE}:{path}/created_frame_x"] = predicate("x", block, ["light"], portal_states={"waterlogged": False})
            ctx.data.predicates[f"{NAMESPACE}:{path}/created_frame_z"] = predicate("z", block, ["light"], portal_states={"waterlogged": False})

        # Register portal
        if portal.floor_portal:
            ctx.data.functions[f"{NAMESPACE}:check/floor/{portal.activation}"].lines.append(
                f'execute if block ~-1 ~ ~ {block} run function too_many_portals:portals/{dimension_a_id}/{dimension_b_id}/build/check_frame'
            )
            ctx.data.functions[f"{NAMESPACE}:break/check_floor"].lines.append(
                f'execute if entity @s[tag={dimension_a_id},tag={dimension_b_id}] unless predicate too_many_portals:portals/{dimension_a_id}/{dimension_b_id}/created_frame run function too_many_portals:break/break_floor'
            )
        else:
            ctx.data.functions[f"{NAMESPACE}:check/default/{portal.activation}"].lines.append(
                f'execute if block ~ ~-1 ~ {block} run function too_many_portals:portals/{dimension_a_id}/{dimension_b_id}/build/check_frame'
            )
            ctx.data.functions[f"{NAMESPACE}:break/check_x"].lines.append(
                f'execute if entity @s[tag={dimension_a_id},tag={dimension_b_id}] unless predicate too_many_portals:portals/{dimension_a_id}/{dimension_b_id}/created_frame_x run function too_many_portals:break/break_x'
            )
            ctx.data.functions[f"{NAMESPACE}:break/check_z"].lines.append(
                f'execute if entity @s[tag={dimension_a_id},tag={dimension_b_id}] unless predicate too_many_portals:portals/{dimension_a_id}/{dimension_b_id}/created_frame_z run function too_many_portals:break/break_z'
            )
        ctx.data.functions[f"{NAMESPACE}:enter/identify"].lines.append(
            f'execute if entity @s[tag={dimension_a_id},tag={dimension_b_id}] as @e[type=#too_many_portals:affectable,tag=too_many_portals.affectable,tag=too_many_portals.teleport,sort=nearest,limit=1] run function too_many_portals:portals/{dimension_a_id}/{dimension_b_id}/travel/enter'
        )
        ctx.data.functions[f"{NAMESPACE}:update"].lines.insert(0,
            f'execute if entity @s[tag={dimension_a_id},tag={dimension_b_id}] run function too_many_portals:portals/{dimension_a_id}/{dimension_b_id}/update'
        )

        # Textures
        if portal.color != None:
            try:
                portal.color = int(portal.color)
            except ValueError:
                pass
        texture = create_portal_texture(ctx, portal.texture, portal.color, portal.floor_portal) 
        # Models
        if portal.floor_portal:
            ctx.assets.models[f"{NAMESPACE}:portal/{i+1}"] = Model({
                "parent": "too_many_portals:portal/portal_floor",
                "textures": {
                    "portal": texture
                }
            })
            ctx.assets.models["minecraft:item/purple_stained_glass"].data["overrides"].append({
                "predicate": {"custom_model_data": custom_model_data},
                "model": f"{NAMESPACE}:portal/{i+1}"
            })
        else:
            ctx.assets.models[f"{NAMESPACE}:portal/{i+1}_x"] = Model({
                "parent": "too_many_portals:portal/portal_x",
                "textures": {
                    "portal": texture
                }
            })
            ctx.assets.models[f"{NAMESPACE}:portal/{i+1}_z"] = Model({
                "parent": "too_many_portals:portal/portal_z",
                "textures": {
                    "portal": texture
                }
            })
            ctx.assets.models["minecraft:item/purple_stained_glass"].data["overrides"].extend([{
                "predicate": {"custom_model_data": custom_model_data_x},
                "model": f"{NAMESPACE}:portal/{i+1}_x"
            },
            {
                "predicate": {"custom_model_data": custom_model_data_z},
                "model": f"{NAMESPACE}:portal/{i+1}_z"
            }])
        
        # Increment custom model data
        if portal.floor_portal:
            custom_model_data += 1
        else:
            custom_model_data += 2


def predicate(type: Literal["x", "z", "floor"], frame_block: str, portal_blocks: List[str], frame_states: JsonDict = {}, portal_states: JsonDict = {}) -> Predicate:
    if type == "x":
        frame_offsets = (0, -1, 0), (1, -1, 0), (2, 0, 0), (2, 1, 0), (2, 2, 0), (1, 3, 0), (0, 3, 0), (-1, 2, 0), (-1, 1, 0), (-1, 0, 0)
        portal_offsets = (0, 0, 0), (1, 0, 0), (0, 1, 0), (1, 1, 0), (0, 2, 0), (1, 2, 0)
    elif type == "z":
        frame_offsets = (0, -1, 0), (0, -1, 1), (0, 0, 2), (0, 1, 2), (0, 2, 2), (0, 3, 1), (0, 3, 0), (0, 2, -1), (0, 1, -1), (0, 0, -1)
        portal_offsets = (0, 0, 0), (0, 0, 1), (0, 1, 0), (0, 1, 1), (0, 2, 0), (0, 2, 1)
    elif type == "floor":
        frame_offsets = (-1, 0, 0), (-1, 0, 1), (2, 0, 0), (2, 0, 1), (0, 0, -1), (1, 0, -1), (0, 0, 2), (1, 0, 2)
        portal_offsets = (0, 0, 0), (1, 0, 0), (0, 0, 1), (1, 0, 1)

    return Predicate(json.dumps(
        [{
            "condition": "location_check",
            "offsetX": offset[0],
            "offsetY": offset[1],
            "offsetZ": offset[2],
            "predicate": {
                "block": {
                    "blocks": [frame_block],
                   "state": frame_states
                }
            }
        } for offset in frame_offsets] +
        [{
            "condition": "location_check",
            "offsetX": offset[0],
            "offsetY": offset[1],
            "offsetZ": offset[2],
            "predicate": {
                "block": {
                    "blocks": portal_blocks,
                    "state": portal_states
                }
            }
        } for offset in portal_offsets]
    ))