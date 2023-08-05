local function T(id, resource, name, type, amount, texture)
	mystical_agriculture.register_ore_crop(id, name, {
		resource = resource,
        generate_textures_from_resource_texture = texture,
		craft = { type = type, amount = amount}
	})
end

T("akalin_ingot","glooptest:akalin_ingot","Akalin",2,4,mystical_agriculture.get_inv_image("glooptest:akalin_ingot")) 
T("alatro_ingot","glooptest:alatro_ingot","Alatro",2,4,mystical_agriculture.get_inv_image("glooptest:alatro_ingot")) 
T("arol_ingot","glooptest:arol_ingot","Arol",2,4,mystical_agriculture.get_inv_image("glooptest:arol_ingot")) 
T("talinite_ingot","glooptest:talinite_ingot","Talinite",2,4,mystical_agriculture.get_inv_image("glooptest:talinite_ingot")) 
T("amethyst_gem","glooptest:amethyst_gem","Amethyst",4,2,mystical_agriculture.get_inv_image("glooptest:amethyst_gem")) 
T("emerald_gem","glooptest:emerald_gem","Emerald",4,2,mystical_agriculture.get_inv_image("glooptest:emerald_gem")) 
T("ruby_gem","glooptest:ruby_gem","Ruby",4,2,mystical_agriculture.get_inv_image("glooptest:ruby_gem")) 
T("topaz_gem","glooptest:topaz_gem","Topaz",4,2,mystical_agriculture.get_inv_image("glooptest:topaz_gem")) 
T("sapphire_gem","glooptest:sapphire_gem","Sapphire",4,2,mystical_agriculture.get_inv_image("glooptest:sapphire_gem")) 
T("kalite_lump","glooptest:kalite_lump","Kalite",2,6,mystical_agriculture.get_inv_image("glooptest:kalite_lump")) 

