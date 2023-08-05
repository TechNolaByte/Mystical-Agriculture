mystical_agriculture.register_ore_crop("lapis_stone", "Lapis", {
    resource = "lapis:lapis_stone",
    craft = { type = 2, amount = 4}
})
mystical_agriculture.register_ore_crop("pyrite_lump", "Pyrite", {
    resource = "lapis:pyrite_lump",
    generate_textures_from_resource_texture = mystical_agriculture.get_inv_image("lapis:pyrite_lump"),
    craft = { type = 2, amount = 4}
})