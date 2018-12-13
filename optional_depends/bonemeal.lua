minetest.register_craft({
        output = "mystical_agriculture:bone_seed",
        recipe = {
            {"mystical_agriculture:blank_seed","bonemeal:bone","mystical_agriculture:blank_seed"},
            {"bonemeal:bone","mystical_agriculture:blank_seed","bonemeal:bone"},
            {"mystical_agriculture:blank_seed","bonemeal:bone","mystical_agriculture:blank_seed"},
        }
    })
	minetest.register_craft({
        output = "bonemeal:bone 4",
        recipe = {
            {"","mystical_agriculture:bone_essence",""},
            {"mystical_agriculture:bone_essence","default:wood","mystical_agriculture:bone_essence"},
            {"","mystical_agriculture:bone_essence",""},
        }
    })