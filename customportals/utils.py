import re

def namespaced(s: str):
    if not re.match("^([a-z0-9._-]+:)?[a-z0-9._-]+(/[a-z0-9._-]+)*$", s):
        raise ValueError(f'Invalid resource location "{s}"')
    
    if ":" not in s:
        return "minecraft:" + s
    else:
        return s
    
def dimension_id(dimension: str):
    if not re.match("^[a-z0-9._-]+:[a-z0-9._-]+(/[a-z0-9._-]+)*$", dimension):
        raise ValueError(f'Invalid dimension "{dimension}"')
    
    return dimension.replace(":", ".").replace("/", ".")