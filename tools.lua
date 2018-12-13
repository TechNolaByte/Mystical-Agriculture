minetest.register_tool("mystical_agriculture:master_infusion_crystal", {
	description = "Master Infusion Crystal",
	inventory_image = "master_infusion_crystal.png",
})
minetest.register_craft({
		output = "mystical_agriculture:master_infusion_crystal",
		recipe = {
		{"","mystical_agriculture:supremium_essence",""},
		{"mystical_agriculture:supremium_essence","mystical_agriculture:infusion_crystal","mystical_agriculture:supremium_essence"},
		{"","mystical_agriculture:supremium_essence",""},
},
})
