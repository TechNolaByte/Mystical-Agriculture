local R = dofile(minetest.get_modpath("mystical_agriculture") .. "/crafting_helper.lua")

minetest.registered_nodes["default:ice"]["groups"]["ice"]=1

mystical_agriculture.register_ore_crop("dirt","Earth",{ resource = "group:soil" })
mystical_agriculture.register_ore_crop("stone","Rock",{ resource = "group:stone" })
mystical_agriculture.register_ore_crop("wood","Wood",{ resource = "group:tree" })
mystical_agriculture.register_ore_crop("ice","Ice",{ resource = "group:ice" })

---- Nature
mystical_agriculture.register_ore_crop("nature","Nature",{ resource = false })
R("mystical_agriculture:nature_seed", {
	{"mystical_agriculture:blank_seed","mystical_agriculture:blank_seed","mystical_agriculture:blank_seed"},
	{"E stone","E water","E stone"},
	{"E dirt","E water","E dirt"},
})


R("default:sapling 4", {
	{"","E nature",""},
	{"E nature","E wood","E nature"},
	{"","E wood",""}
})

R("default:dirt_with_grass 4", {
	{"","default:dirt",""},
	{"default:dirt","E nature","default:dirt"},
	{"","default:dirt",""},
})

R("default:papyrus 6", {
	{"E nature","","E nature"},
	{"E nature","","E nature"},
	{"E nature","","E nature"},
})
R("default:cactus 5", {
	{"E nature","","E nature"},
	{"","E nature",""},
	{"E nature","","E nature"},
})

R("default:fern_1 1", {
	{"E nature","",""},
	{"","",""},
	{"","",""},
})
R("default:grass_1 1", {
	{"","E nature",""},
	{"","",""},
	{"","",""},
})
R("default:jungle_grass 1", {
	{"","","E nature"},
	{"","",""},
	{"","",""},
})
R("default:marram_grass_1", {
	{"","",""},
	{"E nature","",""},
	{"","",""},
})
R("default:sand_with_kelp 1", {
	{"","",""},
	{"","E nature",""},
	{"","",""},
})
R("default:permafrost_with_moss 4", {
	{"","default:permafrost",""},
	{"default:permafrost","E nature","default:permafrost"},
	{"","default:permafrost",""},
})

R("default:leaves 8", {
	{"E nature", "E nature"},
	{"E nature", "E nature"},
})

---- Wood

R("default:wood 4", {
	{"E wood"}
})
R("default:tree 4", {
	{"E wood", "E wood"},
	{"E wood", "E wood"}
})


---- Snow
R("default:snow 3", {
	{"E ice"}
})
R("default:snowblock 2", {
	"E ice", "E ice", "E ice"
}, "shapeless")
R("default:ice 4", {
	{"E ice", "E ice"},
	{"E ice", "E ice"}
})
R("default:dirt_with_snow 4", {
	{"","default:dirt",""},
	{"default:dirt","E ice","default:dirt"},
	{"","default:dirt",""},
})


---- Dirt/Stone
R("default:dirt 4", {
	{"","E dirt",""},
	{"E dirt","E stone","E dirt"},
	{"","E dirt",""},
})
R("default:gravel 4", {
	{"","E stone",""},
	{"E stone","E dirt","E stone"},
	{"","E stone",""},
})
R("default:clay 2", {
	{"E dirt","E stone","E dirt"},
	{"E stone","E dirt","E stone"},
	{"E dirt","E stone","E dirt"},
})
R("default:cobble 2", {
	{"","E stone",""},
	{"E stone","","E stone"},
	{"","E stone",""},
})
R("default:stone 2", {
	{"","E stone",""},
	{"E stone","E stone","E stone"},
	{"","E stone",""},
})

---- Misc
R("default:obsidian_shard 14", {
	{"E water","E fire","E water"},
	{"E fire","default:cobble","E fire"},
	{"E water","E fire","E water"}
})

minetest.register_craftitem("mystical_agriculture:blank_seed", {
	description = "Blank Seeds",
	inventory_image = "crafting_base_crafting_seed.png",
	groups = {seed=1},
})
R("mystical_agriculture:blank_seed",{
	{"","E inferium",""},
	{"E intermedium","group:seed","E intermedium"},
	{"","E inferium",""},
})
R("mystical_agriculture:blank_seed",{
	{"","E intermedium",""},
	{"E inferium","group:seed","E inferium"},
	{"","E intermedium",""},
})
