local modpath = minetest.get_modpath("mystical_agriculture")

dofile(modpath.."/functions.lua")
dofile(modpath.."/registering.lua")
dofile(modpath.."/multiuse_essences.lua")

dofile(modpath.."/tools.lua")
dofile(modpath.."/nodes.lua")

local supported_mods = {
    "dye", "bacon", "lapis", "exoticores",
    "glooptest", "terumet", "technic",
    "titanite", "rainbow_ore","moreores",
    -- "bonemeal", yes bonemeal is an optional depend, but it is evaluated elsewhere
}

for i in pairs(supported_mods) do
    if minetest.get_modpath(supported_mods[i])  then  
        dofile(modpath.."/optional_depends/"..supported_mods[i]..".lua")
    end 
end
