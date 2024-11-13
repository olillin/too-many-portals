from beet import PluginOptions
from typing import Literal, List, Dict

class PortalOptions(PluginOptions):
    dimension_a: str
    dimension_b: str
    activation: Literal["vanilla", "water", "lava"]
    floor_portal: bool = False
    block: str
    color: str|int|None
    texture: str|None

class DimensionOptions(PluginOptions):
    max_height: int
    min_height: int

class ConfigOptions(PluginOptions):
    portals: List[PortalOptions]
    dimensions: Dict[str, DimensionOptions] = {}
    custom_model_data_start: int = 516064
    uuid: int|None