mystical_agriculture.register_ore_crop("raw_bacon", "Raw Bacon", {
    resource = "bacon:raw",
    generate_textures_from_resource_texture = mystical_agriculture.get_inv_image("bacon:raw"),
    craft = { type = 2, amount = 8}
})
mystical_agriculture.register_ore_crop("cooked_bacon", "Cooked Bacon", {
    resource = "bacon:cooked",
    generate_textures_from_resource_texture = mystical_agriculture.get_inv_image("bacon:cooked"),
    craft = { type = 2, amount = 6}
})