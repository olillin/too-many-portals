from .options import ConfigOptions
from .utils import namespaced

from beet import Context, ErrorMessage, configurable
import re

@configurable("customportals", validator=ConfigOptions)
def validate_config(ctx: Context, config: ConfigOptions):
    pairs: list[tuple[set[str], str, str, bool]] = []
    for i, portal in enumerate(config.portals):
        # Validate block
        if not re.match("^([a-z0-9._-]+:)?[a-z0-9._-]+(/[a-z0-9._-]+)*$", portal.block):
            raise ErrorMessage(f"Invalid block '{portal.block}' for portal #{i+1}")
        # Validate texture
        if portal.texture:
            if not re.match("^@?([a-z0-9._-]+:)?[a-z0-9._-]+(/[a-z0-9._-]+)*$", portal.texture):
                raise ErrorMessage(f"Invalid texture '{portal.texture}' for portal #{i+1}")
        # Validate color
        if portal.color:
            try:
                portal.color = int(portal.color)
            except ValueError:
                pass
            if type(portal.color) is int and (portal.color >= 2**24 or portal.color < 0):
                raise ErrorMessage(f"Invalid color {portal.color} for portal #{i+1}")
            elif type(portal.color) is str and not re.match(
                    "^#[0-9a-fA-F]{3}([0-9a-fA-F]([0-9a-fA-F]{2}([0-9a-fA-F]{2})?)?)?$", portal.color):
                raise ErrorMessage(f"Invalid color '{portal.color}' for portal #{i+1}")
        # Check for conflicts
        dimension_a = namespaced(portal.dimension_a)
        dimension_b = namespaced(portal.dimension_b)
        pair = (set((dimension_a, dimension_b)), portal.block, portal.activation, portal.floor_portal)
        for j in range(len(pairs)):
            # Between same dimensions
            if len(set.intersection(pair[0], pairs[j][0])) == 2:
                raise ErrorMessage(f"Conflict between portal #{j+1} and #{i+1}, portals are between the same pair of dimensions")
            if (len(set.intersection(pair[0], pairs[j][0])) < 4
                and pair[1] == pairs[j][1] # Blocks
                and pair[2] == pairs[j][2] # Activation
                and pair[3] == pairs[j][3] # Floor portal
                ):
                raise ErrorMessage(f"Conflict between portal #{j+1} and #{i+1}, same block, activation and type from same dimension")
        pairs.append(pair)
    # Validate dimension heights
    for name, height in config.dimensions.items():
        if height.max_height < height.min_height:
            raise ErrorMessage(f"Max height less than min height for dimension '{name}'")
        if height.max_height-10 < height.min_height:
            raise ErrorMessage(f"Max height too close to min height for dimension '{name}'")
