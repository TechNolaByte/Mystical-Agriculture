mystical_agriculture.register_normal_ore_crop("dye","Group:dye","Dye",0,0)

local dye_recipies = function(dye) 
minetest.register_craft({
		type = "shapeless",
		output = dye.." 2",
		recipe = {"mystical_agriculture:dye_item_essence",dye},
})
end
dye_recipies("dye:white")
dye_recipies("dye:grey")
dye_recipies("dye:dark_grey")
dye_recipies("dye:black")
dye_recipies("dye:violet")
dye_recipies("dye:blue")
dye_recipies("dye:cyan")
dye_recipies("dye:dark_green")
dye_recipies("dye:green")
dye_recipies("dye:yellow")
dye_recipies("dye:brown")
dye_recipies("dye:orange")
dye_recipies("dye:red")
dye_recipies("dye:magenta")
dye_recipies("dye:pink")

minetest.register_craft({
        output = "dye:white 2",
        recipe = {
            {"mystical_agriculture:dye_item_essence","mystical_agriculture:dye_item_essence",""},
            {"","",""},
            {"","",""},
        }
    })
minetest.register_craft({
        output = "dye:grey 2",
        recipe = {
            {"mystical_agriculture:dye_item_essence","",""},
            {"mystical_agriculture:dye_item_essence","",""},
            {"","",""},
        }
    })
minetest.register_craft({
        output = "dye:dark_grey 2",
        recipe = {
            {"mystical_agriculture:dye_item_essence","",""},
            {"","mystical_agriculture:dye_item_essence",""},
            {"","",""},
        }
    })
minetest.register_craft({
        output = "dye:black 2",
        recipe = {
            {"","mystical_agriculture:dye_item_essence","mystical_agriculture:dye_item_essence"},
            {"","",""},
            {"","",""},
        }
    })
minetest.register_craft({
        output = "dye:violet 2",
        recipe = {
            {"","","mystical_agriculture:dye_item_essence"},
            {"","","mystical_agriculture:dye_item_essence"},
            {"","",""},
        }
    })
minetest.register_craft({
        output = "dye:dark_green 2",
        recipe = {
            {"","","mystical_agriculture:dye_item_essence"},
            {"","mystical_agriculture:dye_item_essence",""},
            {"","",""},
        }
    })
minetest.register_craft({
        output = "dye:green 2",
        recipe = {
            {"","mystical_agriculture:dye_item_essence",""},
            {"mystical_agriculture:dye_item_essence","",""},
            {"","",""},
        }
    })
minetest.register_craft({
        output = "dye:cyan 2",
        recipe = {
            {"","mystical_agriculture:dye_item_essence",""},
            {"","mystical_agriculture:dye_item_essence",""},
            {"","",""},
        }
    })
minetest.register_craft({
        output = "dye:yellow 2",
        recipe = {
            {"","mystical_agriculture:dye_item_essence",""},
            {"","","mystical_agriculture:dye_item_essence"},
            {"","",""},
        }
    })
minetest.register_craft({
        output = "dye:brown 2",
        recipe = {
            {"","",""},
            {"mystical_agriculture:dye_item_essence","mystical_agriculture:dye_item_essence",""},
            {"","",""},
        }
    })
minetest.register_craft({
        output = "dye:orange 2",
        recipe = {
            {"","",""},
            {"","mystical_agriculture:dye_item_essence","mystical_agriculture:dye_item_essence"},
            {"","",""},
        }
    })
minetest.register_craft({
        output = "dye:red 2",
        recipe = {
            {"","",""},
            {"","mystical_agriculture:dye_item_essence",""},
            {"","mystical_agriculture:dye_item_essence",""},
        }
    })
minetest.register_craft({
        output = "dye:magenta 2",
        recipe = {
            {"","",""},
            {"","mystical_agriculture:dye_item_essence",""},
            {"mystical_agriculture:dye_item_essence","",""},
        }
    })
minetest.register_craft({
        output = "dye:pink 2",
        recipe = {
            {"","",""},
            {"","mystical_agriculture:dye_item_essence",""},
            {"","","mystical_agriculture:dye_item_essence"},
        }
    })
minetest.register_craft({
        output = "dye:blue 2",
        recipe = {
            {"","mystical_agriculture:dye_item_essence",""},
            {"","",""},
            {"","mystical_agriculture:dye_item_essence",""},
        }
    })