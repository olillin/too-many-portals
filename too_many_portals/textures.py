from .global_ import NAMESPACE
from .utils import namespaced

from beet import Context, Texture, ErrorMessage
from PIL import Image
import re

i = 0
def create_portal_texture(ctx: Context, texture: str|None = None, color: str|int|None = None, floor_portal: bool = False):
    global i
    i += 1

    # Input validation
    if color == None:
        color = "#FFF" if texture else "#0FF"
    else:
        color = convert_to_hex(color)
    if texture == None:
        texture = f"{NAMESPACE}:block/nether_portal"

    if namespaced(texture) not in ctx.assets.textures:
        raise ErrorMessage(f'Texture {texture} could not be found')
    img: Image.Image = ctx.assets.textures[namespaced(texture)].image
    if not img.mode == "RGBA":
        raise ErrorMessage(f'Texture {texture} is not an RGBA image')    

    # Generate texture
    overlay = Image.new("RGBA", img.size, color)
    size = (2,2) if floor_portal else (2,3)
    img = grid(overlay_images(img, overlay), size)

    # Save
    name = f"{NAMESPACE}:portal/{i}"
    ctx.assets.textures[name] = Texture(img)
    if namespaced(texture) in ctx.assets.textures_mcmeta:
        ctx.assets.textures_mcmeta[name] = ctx.assets.textures_mcmeta[namespaced(texture)]
    return name

def grid(texture: Image.Image, size: tuple[int,int]) -> Image.Image:
    if texture.height / texture.width % 1 != 0:
        raise ValueError("Invalid image size")
    portal_texture = Image.new(texture.mode, (texture.width*max(size), texture.height*max(size)))
    scale = texture.width
    texture = texture.copy()
    for x in range(portal_texture.width):
        if x > scale*size[0]:
            continue
        translated_x = x % scale
        for y in range(portal_texture.height):
            if y % (scale * max(size)) // scale >= size[1]:
                continue
            frame = y // (scale*max(size))
            translated_y = y % scale + frame * scale
            portal_texture.putpixel((x,y),
                texture.getpixel((translated_x,translated_y)))
    texture.close()
    return portal_texture

def overlay_images(image1: Image.Image, image2: Image.Image):
    out = Image.new("RGBA", image1.size)
    overlay_function = lambda a, b: int((2*(a/255)*(b/255) if (a/255) < 0.5 else 1-2*(1-(a/255))*(1-(b/255)))*255)
    
    for x in range(image1.width):
        for y in range(image1.height):
            out.putpixel((x,y), (
                overlay_function(image1.getpixel((x,y))[0], image2.getpixel((x,y))[0]),
                overlay_function(image1.getpixel((x,y))[1], image2.getpixel((x,y))[1]),
                overlay_function(image1.getpixel((x,y))[2], image2.getpixel((x,y))[2]),
                int((image1.getpixel((x,y))[3]/255)*(image2.getpixel((x,y))[3]/255)*255)
            ))
    return out

def convert_to_hex(color: str|int) -> str:
    out: str = str(color)
    if type(color) == int:
        if color >= 16**24 or color < 0:
            ValueError(f"Invalid color {color}")
        out = "#" + hex(color)[2:].zfill(6)
    if not re.match("^#[0-9a-fA-F]{3}([0-9a-fA-F]([0-9a-fA-F]{2}([0-9a-fA-F]{2})?)?)?$", out):
        ValueError(f"Invalid color '{color}'")
    return str(out)
