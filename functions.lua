mystical_agriculture = {}
--[[
local function get_inv_image(name)
	local t = default_texture
	local d = minetest.registered_items[name]
	if name ~= "air" and d then
		if d.inventory_image and #d.inventory_image > 0 then
			t = d.inventory_image
		else
			local c = #d.tiles
			local x = {}
			for i, v in ipairs(d.tiles) do
				if type(v) == "table" then
					x[i] = v.name
				else
					x[i] = v
				end
				i = i + 1
			end
			if not x[3] then x[3] = x[1] end
			if not x[4] then x[4] = x[3] end
			t = minetest.inventorycube(x[1], x[3], x[4])
		end
	end
	return t
end
]]--
mystical_agriculture.get_inv_image = function(name)
	local t = default_texture
	local d = minetest.registered_items[name]
	if name ~= "air" and d then
		t = d.inventory_image
	end
	return t
end
mystical_agriculture.register_normal_ore_crop = function(id,itemid,desc,craftset,amount,itemtex,craft6set)	

if itemtex == nil then
minetest.register_craftitem("mystical_agriculture:"..id.."_seed", {
	description = desc.." Seeds",
	inventory_image = id.."_seeds.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "mystical_agriculture:"..id.."step_1")
	end
})
else
minetest.register_craftitem("mystical_agriculture:"..id.."_seed", {
	description = desc.." Seeds",
	inventory_image = itemtex.."^seeds_mask.png^[makealpha:0,0,0",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "mystical_agriculture:"..id.."step_1")
	end
})
end

for n = 1,5 do
minetest.register_node("mystical_agriculture:"..id.."step_"..n, {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"crop"..n..".png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	selection_box = {
	type = "fixed",
	fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
},
	drop = "mystical_agriculture:"..id.."_seed",
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1,growing=1},
	sounds = default.node_sound_leaves_defaults(),
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		if itemstack:get_name() == "mystical_agriculture:magicly_infused_bonemeal" then
			minetest.set_node(pos, {name="mystical_agriculture:"..id.."step_6"})
		itemstack:take_item(1)
			return itemstack
		 end
	end,
})
minetest.register_abm({
	nodenames = {"mystical_agriculture:"..id.."step_"..n},
	interval = 3,
	chance = 3,
	action = function(pos, node)
		local pos_under = {x=pos.x, y=pos.y-2, z=pos.z}
		if minetest.get_node(pos_under).name == "mystical_agriculture:growth_crystal" then
		minetest.set_node(pos, {name = "mystical_agriculture:"..id.."step_"..(n+1)})
	end
	end
})
minetest.register_abm({
	nodenames = {"mystical_agriculture:"..id.."step_"..n},
	interval = 10,
	chance = 6,
	action = function(pos, node)
		local pos_under = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.get_node(pos_under).name == "farming:soil_wet" then
		minetest.set_node(pos, {name = "mystical_agriculture:"..id.."step_"..(n+1)})
	end
	end
})
end
minetest.register_node("mystical_agriculture:"..id.."step_6", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"crop6.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
		selection_box = farming.select,
	drop = "mystical_agriculture:"..id.."_seed",
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1,growing=1},
	sounds = default.node_sound_leaves_defaults(),
	on_rightclick = function(pos, node)
		minetest.set_node(pos, {name="mystical_agriculture:"..id.."step_1"})
		pos.y = pos.y + 0.5
		minetest.add_item(pos, "mystical_agriculture:"..id.."_item_essence")
	end,
})
minetest.register_abm({
	nodenames = {"mystical_agriculture:"..id.."step_6"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		local pos_under = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.get_node(pos_under).name == "mystical_agriculture:harvest_crystal" then
		minetest.set_node(pos, {name="mystical_agriculture:"..id.."step_1"})
		pos.y = pos.y + 0.5
		minetest.add_item(pos, "mystical_agriculture:"..id.."_item_essence")
	end
	end
})
if itemtex == nil then
minetest.register_craftitem("mystical_agriculture:"..id.."_item_essence", {
	description = desc.." Essence",
	inventory_image = id.."_essence.png",
})
else
minetest.register_craftitem("mystical_agriculture:"..id.."_item_essence", {
	description = desc.." Essence",
	inventory_image = "blank_essence.png^("..itemtex.."^essence_mask.png^[makealpha:0,0,0)",
})
end


if craftset == 1 and amount ~= nil then
minetest.register_craft({
		output = itemid.." "..amount,
		recipe = {
			{"mystical_agriculture:"..id.."_item_essence","mystical_agriculture:"..id.."_item_essence","mystical_agriculture:"..id.."_item_essence"},
			{"mystical_agriculture:"..id.."_item_essence","mystical_agriculture:"..id.."_item_essence","mystical_agriculture:"..id.."_item_essence"},
			{"mystical_agriculture:"..id.."_item_essence","mystical_agriculture:"..id.."_item_essence","mystical_agriculture:"..id.."_item_essence"},
		}
	})
end
if craftset == 2 and amount ~= nil then
minetest.register_craft({
		output = itemid.." "..amount,
		recipe = {
			{"mystical_agriculture:"..id.."_item_essence","mystical_agriculture:"..id.."_item_essence",""},
			{"mystical_agriculture:"..id.."_item_essence","mystical_agriculture:"..id.."_item_essence",""},
			{"","",""},
		}
	})
end
if craftset == 3 and amount ~= nil then
minetest.register_craft({
		output = itemid.." "..amount,
		recipe = {
			{"mystical_agriculture:"..id.."_item_essence","mystical_agriculture:"..id.."_item_essence","mystical_agriculture:"..id.."_item_essence"},
			{"mystical_agriculture:"..id.."_item_essence","","mystical_agriculture:"..id.."_item_essence"},
			{"mystical_agriculture:"..id.."_item_essence","mystical_agriculture:"..id.."_item_essence","mystical_agriculture:"..id.."_item_essence"},
		}
	})
end
if craftset == 4 and amount ~= nil then
minetest.register_craft({
		output = itemid.." "..amount,
		recipe = {
			{"","mystical_agriculture:"..id.."_item_essence",""},
			{"mystical_agriculture:"..id.."_item_essence","bucket:bucket_empty","mystical_agriculture:"..id.."_item_essence"},
			{"","mystical_agriculture:"..id.."_item_essence",""},
		}
	})
end
if craftset == 5 and amount ~= nil then
minetest.register_craft({
		output = itemid.." "..amount,
		recipe = {
			{"","mystical_agriculture:"..id.."_item_essence",""},
			{"mystical_agriculture:"..id.."_item_essence","mystical_agriculture:"..id.."_item_essence","mystical_agriculture:"..id.."_item_essence"},
			{"","mystical_agriculture:"..id.."_item_essence",""},
		}
	})
end
if craftset == 6 and amount ~= nil and craft6set ~= nil then
minetest.register_craft({
		output = itemid.." "..amount,
		recipe = {
			{"","mystical_agriculture:"..id.."_item_essence",""},
			{"mystical_agriculture:"..id.."_item_essence",craft6set,"mystical_agriculture:"..id.."_item_essence"},
			{"","mystical_agriculture:"..id.."_item_essence",""},
		}
	})
end
if itemid ~= 0 then
minetest.register_craft({
		output = "mystical_agriculture:"..id.."_seed",
		recipe = {
			{itemid,itemid,itemid},
			{itemid,"mystical_agriculture:blank_seed",itemid},
			{itemid,itemid,itemid},
		}
	})
end
end

--mystical_agriculture.register_normal_ore_crop(id,itemid,desc,craftset,amount,itemtex,craft6set) --max options
--mystical_agriculture.register_normal_ore_crop(id,itemid,desc) --minimal options
--[[
craft settings
0 == Essence

1
OOO
OOO
OOO

2
OO
OO

3
OOO
O O
OOO

4
U == Empty bucket
 O 
OUO
 O
 
5
 O 
OOO
 O
 
6
X = craft6set option(right after amount)
 O 
OXO
 O
]]--  

mystical_agriculture.register_essence = function(name,desc,quality,below,coal)
minetest.register_craftitem("mystical_agriculture:"..name.."_essence", {
	description = desc.." essence",
	inventory_image = name.."_essence.png",
})
minetest.register_node("mystical_agriculture:"..name.."_block", {
	description = desc.." block",
	tiles = {name.."_block.png"},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("mystical_agriculture:"..name.."_ingot_block", {
	description = desc.." metal block",
	tiles = {name.."_ingot_block.png"},
	groups = {cracky=1},
	sounds = default.node_sound_metal_defaults(),
})
if coal == true then
minetest.register_node("mystical_agriculture:"..name.."_coal_block", {
	description = desc.." coal block",
	tiles = {"coal_block_"..name..".png"},
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_craftitem("mystical_agriculture:"..name.."_coal", {
	description = desc.." coal",
	inventory_image = "coal_"..name..".png",
})
end
minetest.register_craftitem("mystical_agriculture:"..name.."_ingot", {
	description = desc.." metal ingot",
	inventory_image = name.."_ingot.png",
})
minetest.register_craftitem("mystical_agriculture:"..name.."_nugget", {
	description = desc.." metal nugget",
	inventory_image = name.."_nugget.png",
})
minetest.register_craft({
		output = "mystical_agriculture:"..name.."_essence",
		recipe = {
		{"",below,""},
		{below,"mystical_agriculture:infusion_crystal",below},
		{"",below,""},
},
})
minetest.register_craft({
		output = "mystical_agriculture:"..name.."_essence",
		recipe = {
		{"",below,""},
		{below,"mystical_agriculture:master_infusion_crystal",below},
		{"",below,""},
},
		replacements = {
		{"mystical_agriculture:master_infusion_crystal", "mystical_agriculture:master_infusion_crystal"},
}
})
minetest.register_craft({
	type = "cooking",
	cooktime = (quality*4),
	output = "mystical_agriculture:"..name.."_ingot",
	recipe = "mystical_agriculture:"..name.."_block"
})
if coal == true then
minetest.register_craft({
	type = "fuel",
	recipe = "mystical_agriculture:"..name.."_coal",
	burntime = quality*4,
})
minetest.register_craft({
	type = "fuel",
	recipe = "mystical_agriculture:"..name.."_coal_block",
	burntime = quality*36,
})
end
minetest.register_craft({
	type = "cooking",
	cooktime = quality,
	output = "mystical_agriculture:"..name.."_essence 2",
	recipe = "mystical_agriculture:"..name.."_nugget"
})
if coal == true then
minetest.register_craft({
		output = "mystical_agriculture:"..name.."_coal_block",
		recipe = {
			{"mystical_agriculture:"..name.."_coal","mystical_agriculture:"..name.."_coal","mystical_agriculture:"..name.."_coal"},
			{"mystical_agriculture:"..name.."_coal","mystical_agriculture:"..name.."_coal","mystical_agriculture:"..name.."_coal"},
			{"mystical_agriculture:"..name.."_coal","mystical_agriculture:"..name.."_coal","mystical_agriculture:"..name.."_coal"},
		}
	})
minetest.register_craft({
		output = "mystical_agriculture:"..name.."_coal",
		recipe = {
			{"","mystical_agriculture:"..name.."_essence",""},
			{"mystical_agriculture:"..name.."_essence","default:coalblock","mystical_agriculture:"..name.."_essence"},
			{"","mystical_agriculture:"..name.."_essence",""},
		}
	})
minetest.register_craft({
		output = "mystical_agriculture:"..name.."_coal 9",
		recipe = {
			{"mystical_agriculture:"..name.."_coal_block"},	 
		}
	})
end
minetest.register_craft({
		output = "mystical_agriculture:"..name.."_block",
		recipe = {
			{"mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence"},
			{"mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence"},
			{"mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence"},
		}
	})
minetest.register_craft({
		output = "mystical_agriculture:"..name.."_ingot_block",
		recipe = {
			{"mystical_agriculture:"..name.."_ingot","mystical_agriculture:"..name.."_ingot"},
			{"mystical_agriculture:"..name.."_ingot","mystical_agriculture:"..name.."_ingot"},
		}
	})
minetest.register_craft({
		output = "mystical_agriculture:"..name.."_ingot 4",
		recipe = {
			{"mystical_agriculture:"..name.."_ingot_block"},
		}
	})
minetest.register_craft({
		output = "mystical_agriculture:"..name.."_essence 9",
		recipe = {
			{"mystical_agriculture:"..name.."_block"},
		}
	})
minetest.register_craft({
		output = "mystical_agriculture:"..name.."_ingot",
		recipe = {
			{"mystical_agriculture:"..name.."_nugget","mystical_agriculture:"..name.."_nugget"},
			{"mystical_agriculture:"..name.."_nugget","mystical_agriculture:"..name.."_nugget"},
		}
})
minetest.register_craft({
		output = "mystical_agriculture:"..name.."_nugget 4",
		recipe = {
		   {"mystical_agriculture:"..name.."_ingot"},
	 }
 })
end

mystical_agriculture.register_pressence_ore_crop = function(id,itemid,desc,essence,itemtex)	
if itemtex == nil then
minetest.register_craftitem("mystical_agriculture:"..id.."_seed", {
	description = desc.." Seeds",
	inventory_image = id.."_seeds.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "mystical_agriculture:"..id.."step_1")
	end
})
else
minetest.register_craftitem("mystical_agriculture:"..id.."_seed", {
	description = desc.." Seeds",
	inventory_image = itemtex.."^seeds_mask.png^[makealpha:0,0,0",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "mystical_agriculture:"..id.."step_1")
	end
})
end

for n = 1,5 do
minetest.register_node("mystical_agriculture:"..id.."step_"..n, {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"crop"..n..".png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	selection_box = {
	type = "fixed",
	fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
},
	drop = "mystical_agriculture:"..id.."_seed",
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1,growing=1},
	sounds = default.node_sound_leaves_defaults(),
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		if itemstack:get_name() == "mystical_agriculture:magicly_infused_bonemeal" then
			minetest.set_node(pos, {name="mystical_agriculture:"..id.."step_6"})
		itemstack:take_item(1)
			return itemstack
		 end
	end,
})
minetest.register_abm({
	nodenames = {"mystical_agriculture:"..id.."step_"..n},
	interval = 3,
	chance = 3,
	action = function(pos, node)
		local pos_under = {x=pos.x, y=pos.y-2, z=pos.z}
		if minetest.get_node(pos_under).name == "mystical_agriculture:growth_crystal" then
		minetest.set_node(pos, {name = "mystical_agriculture:"..id.."step_"..(n+1)})
	end
	end
})
minetest.register_abm({
	nodenames = {"mystical_agriculture:"..id.."step_"..n},
	interval = 10,
	chance = 6,
	action = function(pos, node)
		local pos_under = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.get_node(pos_under).name == "farming:soil_wet" then
		minetest.set_node(pos, {name = "mystical_agriculture:"..id.."step_"..(n+1)})
	end
	end
})
end
minetest.register_node("mystical_agriculture:"..id.."step_6", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"crop6.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
		selection_box = farming.select,
	drop = "mystical_agriculture:"..id.."_seed",
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1,growing=1},
	sounds = default.node_sound_leaves_defaults(),
	on_rightclick = function(pos, node)
		minetest.set_node(pos, {name="mystical_agriculture:"..id.."step_1"})
		pos.y = pos.y + 0.5
		minetest.add_item(pos, essence)
	end,
})
minetest.register_abm({
	nodenames = {"mystical_agriculture:"..id.."step_6"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		local pos_under = {x=pos.x, y=pos.y-1, z=pos.z}
		if minetest.get_node(pos_under).name == "mystical_agriculture:harvest_crystal" then
		minetest.set_node(pos, {name="mystical_agriculture:"..id.."step_1"})
		pos.y = pos.y + 0.5
		minetest.add_item(pos, essence)
	end
	end
})
if itemid ~= 0 then
minetest.register_craft({
		output = "mystical_agriculture:"..id.."_seed",
		recipe = {
			{itemid,itemid,itemid},
			{itemid,"mystical_agriculture:blank_seed",itemid},
			{itemid,itemid,itemid},
		}
	})
end
end