minetest.register_craftitem("mystical_agriculture:prosperity_essence", {
	description = "Prosperity Shard",
	inventory_image = "prosperity_essence.png",
})
minetest.register_craft({
		output = "mystical_agriculture:prosperity_essence 2",
		recipe = {
		{"default:obsidian_shard","default:mese_crystal_fragment","default:clay_lump"},
		{"default:mese_crystal_fragment","default:flint","default:mese_crystal_fragment"},
		{"default:clay_lump","default:mese_crystal_fragment","default:obsidian_shard"},
},
})

minetest.register_craftitem("mystical_agriculture:fertilized_essence", {
	description = "Fertilized essence",
	inventory_image = "fertilized_essence.png",
})
minetest.register_craft({
	output = "mystical_agriculture:fertilized_essence",
	recipe = {
		{"group:flora","mystical_agriculture:prosperity_essence","group:flora"},
		{"mystical_agriculture:prosperity_essence","mystical_agriculture:master_infusion_crystal","mystical_agriculture:prosperity_essence"},
		{"group:flora","mystical_agriculture:prosperity_essence","group:flora"},
	},
	replacements = {
		{"mystical_agriculture:master_infusion_crystal", "mystical_agriculture:master_infusion_crystal"},
}
})

minetest.register_craftitem("mystical_agriculture:magicly_infused_bonemeal", {
	description = "Magical fertilizer\nInstantly grows any resource crops",
	inventory_image = "mystical_fertilizer.png",
})
minetest.register_craft({
	output = "mystical_agriculture:magicly_infused_bonemeal 36",
	recipe = {
		{"bones:bones","mystical_agriculture:fertilized_essence","bones:bones"},
		{"mystical_agriculture:fertilized_essence","bones:bones","mystical_agriculture:fertilized_essence"},
		{"bones:bones","mystical_agriculture:fertilized_essence","bones:bones"},
	}
})

minetest.register_craftitem("mystical_agriculture:infusion_crystal", {
	description = "Infusion Crystal",
	inventory_image = "infusion_crystal.png",
})
minetest.register_craft({
		output = "mystical_agriculture:infusion_crystal 8",
		recipe = {
		{"","mystical_agriculture:prosperity_essence","mystical_agriculture:prosperity_essence"},
		{"mystical_agriculture:prosperity_essence","mystical_agriculture:prosperity_essence","mystical_agriculture:prosperity_essence"},
		{"mystical_agriculture:prosperity_essence","mystical_agriculture:prosperity_essence",""},
},
})

minetest.register_craftitem("mystical_agriculture:blank_seed", {
	description = "Blank Seeds",
	inventory_image = "crafting_base_crafting_seed.png",
	groups = {seed=1},
})
minetest.register_craft({
	output = "mystical_agriculture:blank_seed",
	recipe = {
		{"","mystical_agriculture:inferium_essence",""},
		{"mystical_agriculture:intermedium_essence","group:seed","mystical_agriculture:intermedium_essence"},
		{"","mystical_agriculture:inferium_essence",""},
	}
})
minetest.register_craft({
	output = "mystical_agriculture:blank_seed",
	recipe = {
		{"","mystical_agriculture:intermedium_essence",""},
		{"mystical_agriculture:inferium_essence","group:seed","mystical_agriculture:inferium_essence"},
		{"","mystical_agriculture:intermedium_essence",""},
	}
})