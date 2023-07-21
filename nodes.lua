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

minetest.register_node("mystical_agriculture:prosperity_essence_ore", {
	description = "Prosperity Essence Ore",
	tiles = {"default_stone.png^prosperity_essence_ore.png"},
	groups = {cracky = 2},
	light_source = 3,
	paramtype = "light",
	drop = "mystical_agriculture:prosperity_essence 2",
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mystical_agriculture:prosperity_essence_ore",
	wherein        = "default:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 3,
	clust_size     = 3,
	y_min          = -1000,
	y_max          = 250,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mystical_agriculture:prosperity_essence_ore",
	wherein        = "default:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 3,
	clust_size     = 3,
	y_min          = 3000,
	y_max          = 6000,
})

if(minetest.get_modpath("nether")~=nil) then  
	minetest.register_node("mystical_agriculture:nether_prosperity_essence_ore", {
		description = "Nether Prosperity Ore",
		tiles = {"nether_rack.png^prosperity_essence_ore.png"},
		groups = {cracky = 2},
		light_source = 5,
		paramtype = "light",
		drop = "mystical_agriculture:chaos_essence 4",
		sounds = default.node_sound_stone_defaults(),
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mystical_agriculture:nether_prosperity_essence_ore",
		wherein        = "nether:rack",
		clust_scarcity = 10 * 10 * 10,
		clust_num_ores = 3,
		clust_size     = 3,
		y_min          = -30000,
		y_max          = -20000,
	})
end


minetest.register_node("mystical_agriculture:inferium_essence_ore", {
	description = "Inferium Essence Ore",
	tiles = {"default_stone.png^inferium_essence_ore.png"},
	groups = {cracky = 2},
	light_source = 3,
	paramtype = "light",
	drop = "mystical_agriculture:inferium_essence 2",
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mystical_agriculture:inferium_essence_ore",
	wherein        = "default:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 3,
	clust_size     = 3,
	y_min          = -1000,
	y_max          = 250,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mystical_agriculture:inferium_essence_ore",
	wherein        = "default:stone",
	clust_scarcity = 16 * 16 * 16,
	clust_num_ores = 3,
	clust_size     = 3,
	y_min          = 3000,
	y_max          = 6000,
})

if(minetest.get_modpath("nether")~=nil) then  
	minetest.register_node("mystical_agriculture:nether_inferium_essence_ore", {
		description = "Nether Prosperity Ore",
		tiles = {"nether_rack.png^inferium_essence_ore.png"},
		groups = {cracky = 2},
		light_source = 5,
		paramtype = "light",
		drop = "mystical_agriculture:chaos_essence 4",
		sounds = default.node_sound_stone_defaults(),
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mystical_agriculture:nether_inferium_essence_ore",
		wherein        = "nether:rack",
		clust_scarcity = 10 * 10 * 10,
		clust_num_ores = 3,
		clust_size     = 3,
		y_min          = -30000,
		y_max          = -20000,
	})
end