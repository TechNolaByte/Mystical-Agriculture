--[
minetest.register_craft({
        output = "mystical_agriculture:bone_seed",
        recipe = {
            {"mystical_agriculture:blank_seed","skytest:bone","mystical_agriculture:blank_seed"},
            {"skytest:bone","mystical_agriculture:blank_seed","skytest:bone"},
            {"mystical_agriculture:blank_seed","skytest:bone","mystical_agriculture:blank_seed"},
        }
    })
	minetest.register_craft({
        output = "skytest:bone 4",
        recipe = {
            {"","mystical_agriculture:bone_essence",""},
            {"mystical_agriculture:bone_essence","default:stick","mystical_agriculture:bone_essence"},
            {"","mystical_agriculture:bone_essence",""},
        }
    })
			minetest.register_craft({
        output = "mystical_agriculture:magicly_infused_bonemeal 18",
        recipe = {
            {"mystical_agriculture:blank_seed","skytest:bonemeal","mystical_agriculture:blank_seed"},
            {"skytest:bonemeal","mystical_agriculture:blank_seed","skytest:bonemeal"},
            {"mystical_agriculture:blank_seed","skytest:bonemeal","mystical_agriculture:blank_seed"},
        }
    })
]--
