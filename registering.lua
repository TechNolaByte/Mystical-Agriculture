local R = dofile(minetest.get_modpath("mystical_agriculture") .. "/crafting_helper.lua")

mystical_agriculture.register_essence("prosperity","Prosperity",1,"#D6D7E3","mystical_agriculture:nil",false, false)
minetest.register_craftitem("mystical_agriculture:prosperity_essence", {
	description = "Prosperity Shard",
	inventory_image = "prosperity_essence.png",
})
R("mystical_agriculture:prosperity_essence 2", {
    {"default:obsidian_shard","default:mese_crystal_fragment","default:clay_lump"},
    {"default:mese_crystal_fragment","default:flint","default:mese_crystal_fragment"},
    {"default:clay_lump","default:mese_crystal_fragment","default:obsidian_shard"},
})


mystical_agriculture.register_essence("inferium","Inferium",2,"#3F4B06","default:mese_crystal_fragment",true,true,{uses = 1, range = 0, chance = 0.25})
mystical_agriculture.register_ore_crop("inferium","Inferium", {
    resource = "mystical_agriculture:inferium_essence",
    use_as_essence = "mystical_agriculture:inferium_essence",
    craft = nil
})

mystical_agriculture.register_essence("intermedium","Intermedium",3,"#572A0C","mystical_agriculture:inferium_essence",true,true,{uses = 4, range = 0, chance = 0.30})
mystical_agriculture.register_essence("prudentium","Prudentium",4,"#093A15","mystical_agriculture:intermedium_essence",true,true,{uses = 4, range = 1, chance = 0.40})
mystical_agriculture.register_essence("superium","Superium",5,"#144568","mystical_agriculture:prudentium_essence",true,true,{uses = 12, range = 2, chance = 0.40})
mystical_agriculture.register_essence("supremium","Supremium",6,"#5A0606","mystical_agriculture:superium_essence",true,true,{uses = 24, range = 3, chance = 0.40})
mystical_agriculture.register_essence("insanium","Insanium",7,"#2A063C","mystical_agriculture:supremium_essence",true,true,{uses = 64, range = 4, chance = 0.80})



--gems
mystical_agriculture.register_ore_crop("diamond", "Diamond", {
    resource = "default:diamond",
    craft = { type = 4, amount = 3}
})
mystical_agriculture.register_ore_crop("mese","Mese",{
    resource = "default:mese_crystal",
    craft = { type = 4, amount = 2}
})

--basic metals
mystical_agriculture.register_ore_crop("tin","Tin",{
    resource = "default:tin_ingot",
    craft = { type = 2, amount = 4}
})
mystical_agriculture.register_ore_crop("copper","Copper",{
    resource = "default:copper_ingot",
    craft = { type = 2, amount = 4}
})
mystical_agriculture.register_ore_crop("bronze","Bronze",{
    resource = "default:bronze_ingot",
    craft = { type = 2, amount = 8}
})
mystical_agriculture.register_ore_crop("iron","Wrought Iron",{
    resource = "default:steel_ingot",
    craft = { type = 2, amount = 4}
})
mystical_agriculture.register_ore_crop("gold","Gold",{
    resource = "default:gold_ingot",
    craft = { type = 2, amount = 2}
})

--basic misc
mystical_agriculture.register_ore_crop("coal","Coal",{
    resource = "default:coal_lump",
    craft = { type = 2, amount = 4}
})

if minetest.get_modpath("bonemeal") then 
    mystical_agriculture.register_ore_crop("bone","Bone",{
        resource = "bonemeal:bone",
        craft = { type = 5, amount = 4, center_item = "default:wood"}
    })
    minetest.register_craft({
        type = "shapeless",
        output = "bonemeal:bone",
        recipe = {"mystical_agriculture:bone_essence","default:stick","mystical_agriculture:bone_essence"}
    })
elseif minetest.get_modpath("bones") then  
    mystical_agriculture.register_ore_crop("bone","Bone",{
        resource = "bones:bones",
        craft = { type = 5, amount = 2, center_item = "default:clay"}
    })
end

--liquids 
if minetest.get_modpath("bucket") then 
    mystical_agriculture.register_ore_crop("water","Water",{
        resource = "bucket:bucket_water",
        craft = { type = 5, amount = 1, center_item = "bucket:bucket_empty"}
    })
    mystical_agriculture.register_ore_crop("fire","Fire",{
        resource = "bucket:bucket_lava",
        craft = { type = 5, amount = 1, center_item = "bucket:bucket_empty"}
    })
end
