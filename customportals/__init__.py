from .validation import validate_config
from .portals import create_portals
from .dimensions import load_dimensions
from .console import colored

from beet import Context, ErrorMessage
from beet.contrib.load import load
from beet.contrib.render import render
from random import randint

def beet_default(ctx: Context):
    print(colored.green("Initiating customportals plugin"))
    if "customportals" not in ctx.meta:
        raise ErrorMessage("Could not find 'customportals' configuration")
    if not "uuid" in ctx.meta["customportals"]:
        ctx.meta["customportals"]["uuid"] = randint(-2147483648, 2147483647)
    ctx.require(
        load(
            data_pack="customportals",
            resource_pack="customportals"
        ),
        render(
            data_pack={
                "functions": "customportals:*"
            }
        ),
        validate_config,
        load_dimensions,
        create_portals,
        load(
            data_pack="customportals/iris"
        )
    )
    print(colored.green("Customportals done"))