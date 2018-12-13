minetest.register_node("mystical_agriculture:growth_crystal", {
	description = "Growth crystal\nPlace underneath the soil block resource\nseeds are on to boost growth",
		tiles = {{image = "growth_accelerator.png^[colorize:blue:80",animation = {type = "vertical_frames",aspect_w = 8,aspect_h = 8,length = 5}},
		},
		groups = {cracky=1,soil = 2},
		sounds = default.node_sound_glass_defaults(),
		light_source = 6,
})
minetest.register_craft({
	output = "mystical_agriculture:growth_crystal",
	recipe = {
		{"","mystical_agriculture:fertilized_essence",""},
		{"mystical_agriculture:fertilized_essence","group:soil","mystical_agriculture:fertilized_essence"},
		{"","mystical_agriculture:fertilized_essence",""},
	}
})
minetest.register_node("mystical_agriculture:harvest_crystal", {
	description = "Harvest crystal\nResource crops growing on this will be\nharvested automaticly",
		tiles = {{image = "growth_accelerator.png",animation = {type = "vertical_frames",aspect_w = 8,aspect_h = 8,length = 5}},},
		groups = {cracky=1,soil = 2},
		sounds = default.node_sound_glass_defaults(),
		light_source = 6,
})
minetest.register_craft({
	output = "mystical_agriculture:harvest_crystal",
	recipe = {
		{"","mystical_agriculture:prudentium_essence",""},
		{"mystical_agriculture:prosperity_essence","mystical_agriculture:growth_crystal","mystical_agriculture:prosperity_essence"},
		{"","mystical_agriculture:prudentium_essence",""},
	}
})