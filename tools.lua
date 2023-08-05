minetest.register_craftitem("mystical_agriculture:infusion_crystal", {
	description = "Infusion Crystal\nConsumed on use",
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

minetest.register_tool("mystical_agriculture:master_infusion_crystal", {
	description = "Master Infusion Crystal\nNever consumed",
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



minetest.register_craftitem("mystical_agriculture:fertilized_essence", {
	description = "Fertilized Essence",
	inventory_image = "fertilized_essence.png",
})
minetest.register_craft({
	output = "mystical_agriculture:fertilized_essence",
	recipe = {
		{"group:flora","mystical_agriculture:prosperity_essence","group:flora"},
		{"mystical_agriculture:prosperity_essence","mystical_agriculture:infusion_crystal","mystical_agriculture:prosperity_essence"},
		{"group:flora","mystical_agriculture:prosperity_essence","group:flora"},
	}
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
	description = "Magical fertilizer\nInstantly grows 1 resource crop",
	inventory_image = "mystical_fertilizer.png",
})

if minetest.get_modpath("bonemeal") then  
	minetest.register_craft({
		output = "mystical_agriculture:magicly_infused_bonemeal 16",
		recipe = {
			{"bonemeal:fertiliser","bonemeal:fertiliser","bonemeal:fertiliser"},
			{"bonemeal:fertiliser","mystical_agriculture:fertilized_essence","bonemeal:fertiliser"},
			{"bonemeal:fertiliser","bonemeal:fertiliser","bonemeal:fertiliser"},
		}
	})
elseif minetest.get_modpath("bones") then  
	minetest.register_craft({
		output = "mystical_agriculture:magicly_infused_bonemeal 36",
		recipe = {
			{"bones:bones","mystical_agriculture:fertilized_essence","bones:bones"},
			{"mystical_agriculture:fertilized_essence","bones:bones","mystical_agriculture:fertilized_essence"},
			{"bones:bones","mystical_agriculture:fertilized_essence","bones:bones"},
		}
	})
end
