minetest.register_node("mystical_agriculture:tech_ore_radar", {
	description = "Technic Ore Radar",
	tiles = {"collector_side.png"},
	groups = {cracky = 3, stone = 1},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
	local mineral_uranium = minetest.find_node_near(pos, 50, {"technic:mineral_uranium"})
	local mineral_chromium = minetest.find_node_near(pos, 50, {"technic:mineral_chromium"})
	local mineral_zinc = minetest.find_node_near(pos, 50, {"technic:mineral_zinc"})
	local mineral_lead = minetest.find_node_near(pos, 50, {"technic:mineral_lead"})
	local marble = minetest.find_node_near(pos, 50, {"technic:marble"})
	local granite = minetest.find_node_near(pos, 50, {"technic:granite"})
	local mineral_sulfur = minetest.find_node_near(pos, 50, {"technic:mineral_sulfur"})
	if mineral_uranium ~= nil then
		minetest.chat_send_player(player:get_player_name(), "Found Uranium In a 50 block radius!")
	end
	if mineral_chromium ~= nil then
		minetest.chat_send_player(player:get_player_name(), "Found Chromium In a 50 block radius!")
	end
		if mineral_zinc ~= nil then
		minetest.chat_send_player(player:get_player_name(), "Found Zinc In a 50 block radius!")
	end
		if mineral_lead ~= nil then
		minetest.chat_send_player(player:get_player_name(), "Found Lead In a 50 block radius!")
	end
		if marble ~= nil then
		minetest.chat_send_player(player:get_player_name(), "Found Marble In a 50 block radius!")
	end
		if granite ~= nil then
		minetest.chat_send_player(player:get_player_name(), "Found Granite In a 50 block radius!")
	end
		if mineral_sulfur ~= nil then
		minetest.chat_send_player(player:get_player_name(), "Found Sulfur In a 50 block radius!")
	end
	end,
})
	minetest.register_craft({
        output = "mystical_agriculture:tech_ore_radar",
        recipe = {
            {"technic:uranium0_ingot","mystical_agriculture:chrome_item_essence","technic:uranium0_ingot"},
            {"technic:uranium0_ingot","mystical_agriculture:chrome_item_essence","technic:uranium0_ingot"},
            {"technic:uranium0_ingot","mystical_agriculture:chrome_item_essence","technic:uranium0_ingot"},
        }
    })
		minetest.register_craft({
        output = "technic:mineral_uranium",
        recipe = {
            {"group:stone","group:uranium_ingot","group:stone"},
            {"group:uranium_ingot","group:uranium_ingot","group:uranium_ingot"},
            {"group:stone","group:uranium_ingot","group:stone"},
        }
    })
	
mystical_agriculture.register_normal_ore_crop("rubber","technic:rubber","Rubber",3,8) 
mystical_agriculture.register_normal_ore_crop("stainless_steel","technic:stainless_steel_ingot","Stainless Steel",3,2) 
mystical_agriculture.register_normal_ore_crop("chrome","technic:chromium_ingot","Chromium",3,4) 
mystical_agriculture.register_normal_ore_crop("brass","technic:brass_ingot","Brass",3,4) 
mystical_agriculture.register_normal_ore_crop("carbon_steel","technic:carbon_steel_ingot","Carbon Steel",3,4) 
mystical_agriculture.register_normal_ore_crop("sulfur","technic:sulfur_lump","Sulfur",3,8) 
mystical_agriculture.register_normal_ore_crop("zinc","technic:zinc_ingot","Zinc",3,4) 
mystical_agriculture.register_normal_ore_crop("lead","technic:lead_ingot","Lead",3,6) 
for number = 0, 35 do
mystical_agriculture.register_normal_ore_crop("uranium_"..number,"technic:uranium"..number.."_ingot","Uranium "..(number/10).." Fizzle",1,3,"uranium_0_essence.png")   
end