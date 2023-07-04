minetest.register_craft({
	output = "default:obsidian_shard 14",
	recipe = {
		{"mystical_agriculture:water_essence","mystical_agriculture:fire_essence","mystical_agriculture:water_essence"},
		{"mystical_agriculture:fire_essence","default:cobble","mystical_agriculture:fire_essence"},
		{"mystical_agriculture:water_essence","mystical_agriculture:fire_essence","mystical_agriculture:water_essence"},
	}
})
minetest.register_craft({
	output = "mystical_agriculture:nature_seed",
	recipe = {
		{"mystical_agriculture:blank_seed","mystical_agriculture:blank_seed","mystical_agriculture:blank_seed"},
		{"mystical_agriculture:stone_essence","mystical_agriculture:water_essence","mystical_agriculture:stone_essence"},
		{"mystical_agriculture:dirt_essence","mystical_agriculture:water_essence","mystical_agriculture:dirt_essence"},
	}
})
minetest.register_craft({
	output = "default:sapling 4",
	recipe = {
		{"","mystical_agriculture:nature_essence",""},
		{"mystical_agriculture:nature_essence","mystical_agriculture:wood_essence","mystical_agriculture:nature_essence"},
		{"","mystical_agriculture:wood_essence",""},
	}
})
minetest.register_craft({
	output = "default:leaves 8",
	recipe = {
		{"mystical_agriculture:nature_essence","mystical_agriculture:nature_essence"},
		{"mystical_agriculture:nature_essence","mystical_agriculture:nature_essence"},
	}
})
minetest.register_craft({
	output = "default:dirt_with_grass 4",
	recipe = {
		{"","default:dirt",""},
		{"default:dirt","mystical_agriculture:nature_essence","default:dirt"},
		{"","default:dirt",""},
	}
})
minetest.register_craft({
	output = "default:papyrus 6",
	recipe = {
		{"mystical_agriculture:nature_essence","","mystical_agriculture:nature_essence"},
		{"mystical_agriculture:nature_essence","","mystical_agriculture:nature_essence"},
		{"mystical_agriculture:nature_essence","","mystical_agriculture:nature_essence"},
	}
})
minetest.register_craft({
	output = "default:cactus 5",
	recipe = {
		{"mystical_agriculture:nature_essence","","mystical_agriculture:nature_essence"},
		{"","mystical_agriculture:nature_essence",""},
		{"mystical_agriculture:nature_essence","","mystical_agriculture:nature_essence"},
	}
})
minetest.register_craft({
	output = "default:fern_1 1",
	recipe = {
		{"mystical_agriculture:nature_essence","",""},
		{"","",""},
		{"","",""},
	}
})
minetest.register_craft({
	output = "default:grass_1 1",
	recipe = {
		{"","mystical_agriculture:nature_essence",""},
		{"","",""},
		{"","",""},
	}
})
minetest.register_craft({
	output = "default:jungle_grass 1",
	recipe = {
		{"","","mystical_agriculture:nature_essence"},
		{"","",""},
		{"","",""},
	}
})
minetest.register_craft({
	output = "default:marram_grass_1",
	recipe = {
		{"","",""},
		{"mystical_agriculture:nature_essence","",""},
		{"","",""},
	}
})
minetest.register_craft({
	output = "default:sand_with_kelp 1",
	recipe = {
		{"","",""},
		{"","mystical_agriculture:nature_essence",""},
		{"","",""},
	}
})
minetest.register_craft({
	output = "default:permafrost_with_moss 4",
	recipe = {
		{"","default:permafrost",""},
		{"default:permafrost","mystical_agriculture:nature_essence","default:permafrost"},
		{"","default:permafrost",""},
	}
})
minetest.register_craft({
	output = "default:wood 4",
	recipe = {
		{"mystical_agriculture:wood_essence"},
	}
})
minetest.register_craft({
	output = "default:tree 4",
	recipe = {
		{"mystical_agriculture:wood_essence","mystical_agriculture:wood_essence"},
		{"mystical_agriculture:wood_essence","mystical_agriculture:wood_essence"},
	}
})
minetest.register_craft({
	output = "default:dirt 4",
	recipe = {
		{"","mystical_agriculture:dirt_essence",""},
		{"mystical_agriculture:dirt_essence","mystical_agriculture:stone_essence","mystical_agriculture:dirt_essence"},
		{"","mystical_agriculture:dirt_essence",""},
	}
})
minetest.register_craft({
	output = "default:gravel 4",
	recipe = {
		{"","mystical_agriculture:stone_essence",""},
		{"mystical_agriculture:stone_essence","mystical_agriculture:dirt_essence","mystical_agriculture:stone_essence"},
		{"","mystical_agriculture:stone_essence",""},
	}
})
minetest.register_craft({
	output = "default:clay 2",
	recipe = {
		{"mystical_agriculture:dirt_essence","mystical_agriculture:stone_essence","mystical_agriculture:dirt_essence"},
		{"mystical_agriculture:stone_essence","mystical_agriculture:dirt_essence","mystical_agriculture:stone_essence"},
		{"mystical_agriculture:dirt_essence","mystical_agriculture:stone_essence","mystical_agriculture:dirt_essence"},
	}
})
minetest.register_craft({
	output = "default:cobble 2",
	recipe = {
		{"","mystical_agriculture:stone_essence",""},
		{"mystical_agriculture:stone_essence","","mystical_agriculture:stone_essence"},
		{"","mystical_agriculture:stone_essence",""},
	}
})
minetest.register_craft({
	output = "default:stone 2",
	recipe = {
		{"","mystical_agriculture:stone_essence",""},
		{"mystical_agriculture:stone_essence","mystical_agriculture:stone_essence","mystical_agriculture:stone_essence"},
		{"","mystical_agriculture:stone_essence",""},
	}
})
minetest.register_craft({
	output = "default:ice 4",
	recipe = {
		{"","mystical_agriculture:ice_essence",""},
		{"mystical_agriculture:ice_essence","mystical_agriculture:ice_essence","mystical_agriculture:ice_essence"},
		{"","mystical_agriculture:ice_essence",""},
	}
})
minetest.register_craft({
	output = "default:dirt_with_snow 4",
	recipe = {
		{"","default:dirt",""},
		{"default:dirt","mystical_agriculture:ice_essence","default:dirt"},
		{"","default:dirt",""},
	}
})
minetest.register_craft({
	output = "default:snow 4",
	recipe = {
		{"","",""},
		{"","mystical_agriculture:ice_essence",""},
		{"","",""},
	}
})
minetest.register_craft({
	output = "default:snowblock 2",
	recipe = {
		{"","mystical_agriculture:ice_essence",""},
		{"mystical_agriculture:ice_essence","mystical_agriculture:ice_essence","mystical_agriculture:ice_essence"},
		{"","mystical_agriculture:ice_essence",""},
	}
})


