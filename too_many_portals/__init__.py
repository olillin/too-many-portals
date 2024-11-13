from .validation import validate_config
from .portals import create_portals
from .dimensions import load_dimensions
from .console import colored

from beet import Context, ErrorMessage
from beet.contrib.load import load
from beet.contrib.render import render
from random import randint

def beet_default(ctx: Context):
    print(colored.green("Initiating too_many_portals plugin"))
    if "too_many_portals" not in ctx.meta:
        raise ErrorMessage("Could not find 'too_many_portals' configuration")
    if not "uuid" in ctx.meta["too_many_portals"]:
        ctx.meta["too_many_portals"]["uuid"] = randint(-2147483648, 2147483647)
    ctx.require(
        load(
            data_pack="too_many_portals",
            resource_pack="too_many_portals"
        ),
        render(
            data_pack={
                "functions": "too_many_portals:*"
            }
        ),
        validate_config,
        load_dimensions,
        create_portals,
        load(
            data_pack="too_many_portals/iris"
        )
    )
    print(colored.green("Too Many Portals Complete"))