# Custom portals

**Custom portals** is a [Beet](https://github.com/mcbeet/beet) plugin that enables you to create easily configurable portals between dimensions.

## Usage

Add `customportals` to your beet pipeline

## Configuration

The plugin is configured in `customportals` inside `meta`

### Portals

<details>
<summary>Example</summary>
<pre><code>"portals": [
  {
    "block": "glowstone",
    "activation": "lava",
    "dimension_a": "minecraft:overworld",
    "dimension_b": "minecraft:the_nether",
    "color": "#EFBA30"
  }
]
</code></pre>
</details>

`block` – The block that the portal frame is built from. This can be any block but not a block tag such as `#logs`.

`activation` – The activation method for this portal. May be `vanilla` (flint and steel or fire charge), `water` or `lava`.

`dimension_a` / `dimension_b` – The dimensions to be linked with this portal. Which dimension is which has no effect outside of the folder structure of the data pack.

`floor_portal` – Whether or not this portal is a floor portal. A floor portal is built as a 2x2 hole in the ground lined with the portal frame block and activated in the same way as a standard portal.

`color` – By default the portal will have the appearance of a blue nether portal. You can specify your own color with this property. This may be any color hex color such as <code><span style="color:#FBBE55">#FBBE55</span></code> or <code><span style="color:#0BF5">#0BF5</span></code>. Decimal colors such as <code><span style="color:#D769BD">14117309</span></code> can also be used. If a texture has been provided it will be colored with this property.

`texture` – Alternatively you can specify a texture from your resource pack. For example `"texture": "foo:block/portal"` would point to `assets/foo/textures/block/portal.png`. Animated textures using `.mcmeta` files are also supported as well as multiple sizes of textures.

### Dimensions

<details>
<summary>Example</summary>
<pre><code>"dimensions": {
  "minecraft:the_nether": {
    "max_height": 128,
    "min_height": 70
  }
}
</code></pre>
</details>

`max_height` – The maximum height a portal may generate in this dimension.

`min_height` – When a portal cannot find a place to generate it will attempt to generate at the translated coordinates of the entrance portal. To avoid the portal generating outside of the world this property together with the maximum height is used to clamp the y-level a portal may generate in this dimension.

### Other settings

`custom_model_data_start` – The custom model data for the first portal, used to avoid conflicts with other resource packs.

`uuid` – The UUID is used to update old portals. It will be a random number by default but may be overriden here, although it is not advised unless you know what you are doing.
