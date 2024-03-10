local R = dofile(minetest.get_modpath("mystical_agriculture") .. "/crafting_helper.lua")

mystical_agriculture = {}

mystical_agriculture.get_inv_image = function(name)
	local t = default_texture
	local d = minetest.registered_items[name]
	if name ~= "air" and d then
		t = d.inventory_image
	end
	return t
end

mystical_agriculture.register_ore_crop = function(id, name, options)
	if not options then options = {} end
	-- options.resource (required)
	-- options.use_as_essence
	-- options.craft { type, amount, center_item}
	-- options.generate_textures_from_resource_texture

	local seed_texture
	local essence_texture
	local mature_crop_texture
	if options.generate_textures_from_resource_texture then
		seed_texture = options.generate_textures_from_resource_texture.."^seeds_mask.png^[makealpha:0,0,0"
		essence_texture = "blank_essence.png^("..options.generate_textures_from_resource_texture.."^essence_mask.png^[makealpha:0,0,0)"
		mature_crop_texture = "crop6.png^("..options.generate_textures_from_resource_texture..")" -- wip needs to be centered somehow
	else 
		seed_texture = id.."_seeds.png"
		essence_texture = id.."_essence.png"
		mature_crop_texture = "crop_"..id..".png"
	end

	minetest.register_craftitem("mystical_agriculture:"..id.."_seed", {
		description = name.." Seeds",
		inventory_image = seed_texture,
		on_place = function(itemstack, placer, pointed_thing)
			return farming.place_seed(itemstack, placer, pointed_thing, "mystical_agriculture:"..id.."step_1")
		end
	})

	local essence_itemid = options.use_as_essence
	if essence_itemid == nil then
		essence_itemid = "mystical_agriculture:"..id.."_essence"
		minetest.register_craftitem(essence_itemid, {
			description = name.." Essence",
			inventory_image = essence_texture,
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
				if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "mystical_agriculture:growth_crystal" then
					minetest.set_node(pos, {name = "mystical_agriculture:"..id.."step_"..(n+1)})
				end
			end
		})
		minetest.register_abm({
			nodenames = {"mystical_agriculture:"..id.."step_"..n},
			neighbors = {"farming:soil_wet"},
			interval = 10,
			chance = 6,
			action = function(pos, node)
				if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "farming:soil_wet" then
					minetest.set_node(pos, {name = "mystical_agriculture:"..id.."step_"..(n+1)})
				end
			end
		})
	end

	local function harvest(pos, node)
		local plant_type = minetest.registered_nodes[node.name]

		minetest.set_node(pos, {name="mystical_agriculture:"..id.."step_1"})
		pos.y = pos.y + 0.5
		minetest.add_item(pos, plant_type._yields_essence)
	end

	minetest.register_node("mystical_agriculture:"..id.."step_6", {
		paramtype = "light",
		walkable = false,
		drawtype = "plantlike",
		tiles = {mature_crop_texture},
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		selection_box = farming.select,
		drop = "mystical_agriculture:"..id.."_seed",
		groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1,growing=1},
		sounds = default.node_sound_leaves_defaults(),
		_yields_essence = essence_itemid,
		on_rightclick = harvest,
		on_construct = function(pos, node)
			if minetest.get_node({x=pos.x, y=pos.y-2, z=pos.z}).name == "mystical_agriculture:supreme_harvest_crystal" then
				harvest(pos, minetest.get_node(pos))
			end
		end,
	})

	minetest.register_abm({
		nodenames = {"mystical_agriculture:"..id.."step_6"},
		interval = 1,
		chance = 1,
		action = function(pos, node)
			if minetest.get_node({x=pos.x, y=pos.y-2, z=pos.z}).name == "mystical_agriculture:harvest_crystal" then
				harvest(pos, node)
			end
		end
	})

	if options.resource ~= false then
		R("mystical_agriculture:"..id.."_seed", {
			{options.resource,options.resource,options.resource},
			{options.resource,"mystical_agriculture:blank_seed",options.resource},
			{options.resource,options.resource,options.resource},
		})
	end

	if options.craft == nil or options.craft.type == nil then return end

	---- Crafting essence back into resource
	if options.craft.amount == nil then options.craft.amount = 1 end
	local output = options.resource.." "..options.craft.amount

	local craftset = options.craft.type
	local E = "E "..id

	local shape = nil
	if craftset == 1 then
		shape = {
			{E,E,E},
			{E,E,E},
			{E,E,E},
		}
	elseif craftset == 2 then
		shape = {
			{E,E},
			{E,E},
		}
	elseif craftset == 3 then
		shape = {
			{E,E,E},
			{E,"",E},
			{E,E,E},
		}
	elseif craftset == 4 then
		shape = {
			{"",E,""},
			{E, E, E},
			{"",E,""},
		}
	elseif craftset == 5 then
		shape = {
			{"",E,""},
			{E, options.craft.center_item, E},
			{"",E,""},
		}
	end

	if shape then R(output, shape) end
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

local waterican_water_nodes = dofile(minetest.get_modpath("mystical_agriculture") .. "/watering_can.lua")
mystical_agriculture.register_essence = function(name,desc,quality,color,below,coal,metal,waterican)
	local colourize = "^[colorize:"..color..":128"

	local ingot = "mystical_agriculture:"..name.."_ingot"
	local nugget = "mystical_agriculture:"..name.."_nugget"

	if waterican and waterican.uses and waterican.range and waterican.chance and metal == true then
		local range = (waterican.range*2)+1;
		local extra_desc = ""
		if range > 1 then extra_desc = "\nShift-punch to dump all the range in one spot" end

		minetest.register_tool("mystical_agriculture:"..name.."_watering_can", {
			description = desc.." Waterican\nUses before refil: "..waterican.uses.."  Range: "..range.."x"..range..extra_desc,
			liquids_pointable = true,
			inventory_image = "watering_can.png"..colourize,
			wield_image = "watering_can.png"..colourize,
			wield_scale = {x = 1, y = 1, z = 6},
			tool_capabilities = {
				full_punch_interval = 2.0,
			},
			on_use = function(itemstack, user, pointed_thing)
				local wear = itemstack:get_wear()

				-- Refill if pointing at water and not already full
				if pointed_thing.type == "node" then
					local node = minetest.get_node(pointed_thing.under)
					if node.name == "default:water_source" then
						if wear > 0 then
							itemstack:set_wear(0)
							minetest.set_node(pointed_thing.under, {name="air"})
							return itemstack
						end
						return
					end
				end

				-- Worn out = no more water.
				if wear == 65534 then
					return
				end

				if pointed_thing.type == "node" then
					p = pointed_thing.under
					if user:get_player_control().sneak then
						local total_uses = range*range
						
						while total_uses > 0 do
							minetest.after(0.01*total_uses, waterican_water_nodes, user, {x=p.x,y=p.y-1,z=p.z}, p, waterican.chance/2)
							total_uses = total_uses - 1
						end
						
					else
						local r = (waterican.range+0.4);
						waterican_water_nodes(user, {x=p.x-r,y=p.y-1,z=p.z-r}, {x=p.x+r,y=p.y,z=p.z+r}, waterican.chance)
					end
				end
				
				if waterican.uses then
					local wearadd = 65534/waterican.uses+1
					wearadd = math.min(wearadd, 65534-wear)
					itemstack:add_wear(wearadd)
					return itemstack
				end
			end
		})
		
		minetest.register_craft({
			output = "mystical_agriculture:"..name.."_watering_can",
			recipe = {
				{ingot,nugget,nugget},
				{ingot,"mystical_agriculture:fertilized_essence",ingot},
				{"",ingot,""},
			}
		})
	end

	minetest.register_craftitem("mystical_agriculture:"..name.."_essence", {
		description = desc.." essence",
		inventory_image = name.."_essence.png",
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

	minetest.register_node("mystical_agriculture:"..name.."_block", {
		description = desc.." block",
		tiles = {"essence_block.png"..colourize},
		groups = {cracky=1},
		sounds = default.node_sound_stone_defaults(),
	})
	minetest.register_craft({
		output = "mystical_agriculture:"..name.."_block",
		recipe = {
			{"mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence"},
			{"mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence"},
			{"mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence","mystical_agriculture:"..name.."_essence"},
		}
	})
	minetest.register_craft({
		output = "mystical_agriculture:"..name.."_essence 9",
		recipe = {
			{"mystical_agriculture:"..name.."_block"},
		}
	})

	if coal == true then
		minetest.register_node("mystical_agriculture:"..name.."_coal_block", {
			description = desc.." coal block",
			tiles = {"coal_block.png"..colourize},
			groups = {cracky=1},
			sounds = default.node_sound_stone_defaults(),
		})
		minetest.register_craftitem("mystical_agriculture:"..name.."_coal", {
			description = desc.." coal",
			inventory_image = "coal.png"..colourize,
		})

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


	if metal == true then 
		minetest.register_node("mystical_agriculture:"..name.."_ingot_block", {
			description = desc.." metal block",
			tiles = {"ingot_block.png"..colourize},
			groups = {cracky=1},
			sounds = default.node_sound_metal_defaults(),
		})

		minetest.register_craftitem(ingot, {
			description = desc.." metal ingot",
			inventory_image = "ingot.png"..colourize,
		})
		minetest.register_craftitem(nugget, {
			description = desc.." metal nugget",
			inventory_image = "nugget.png"..colourize,
		})

		minetest.register_craft({
			type = "cooking",
			cooktime = (quality*4),
			output = ingot,
			recipe = "mystical_agriculture:"..name.."_block"
		})

		minetest.register_craft({
			type = "cooking",
			cooktime = quality,
			output = "mystical_agriculture:"..name.."_essence 2",
			recipe = nugget
		})

		minetest.register_craft({
			output = "mystical_agriculture:"..name.."_ingot_block",
			recipe = {
				{ingot,ingot},
				{ingot,ingot},
			}
		})
		minetest.register_craft({
				output = "mystical_agriculture:"..name.."_ingot 4",
				recipe = {
					{"mystical_agriculture:"..name.."_ingot_block"},
				}
			})
		
		minetest.register_craft({
				output = ingot,
				recipe = {
					{nugget,nugget},
					{nugget,nugget},
				}
		})
		minetest.register_craft({
				output = "mystical_agriculture:"..name.."_nugget 4",
				recipe = {
				{ingot},
			}
		})

		--Add armor
		if minetest.get_modpath("3d_armor") then
			armor:register_armor("mystical_agriculture:"..name.."_chestplate", {
					description = ("MysticalAgriculture "..desc.." chestplate"),
					inventory_image = "chestplate_"..name.."_inv.png",
					texture = "chestplate_"..name..".png",
					preview = "chestplate_"..name.."_preview.png",
					groups = {armor_torso=1, armor_heal=23, armor_use=1000, armor_fire=10},
					groups = {armor_torso=1, armor_heal=23, armor_use=1000*quality, armor_fire=10},
					armor_groups = {fleshy=40},
					wear = 0,
				})
			armor:register_armor("mystical_agriculture:"..name.."boots", {
					description = ("MysticalAgriculture "..desc.." boots"),
					inventory_image = "boots_"..name.."_inv.png",
					texture = "boots_"..name..".png",
					preview = "boots_"..name.."_preview.png",
					groups = {armor_feet=1, armor_heal=10, armor_use=1000, armor_fire=10, physics_speed=1.3, physics_jump=.7},
					groups = {armor_feet=1, armor_heal=10, armor_use=1000*quality, armor_fire=10, physics_speed=1.05,},
					armor_groups = {fleshy=40},
					wear = 0,
				})
			armor:register_armor("mystical_agriculture:"..name.."leggings", {
					description = ("MysticalAgriculture "..desc.." leggings"),
					inventory_image = "leggings_"..name.."_inv.png",
					texture = "leggings_"..name..".png",
					preview = "leggings_"..name.."_preview.png",
					groups = {armor_legs=1, armor_heal=15, armor_use=1000, armor_fire=10},
					groups = {armor_legs=1, armor_heal=15, armor_use=1000*quality, armor_fire=10},
					armor_groups = {fleshy=20},
					wear = 0,
				})
			armor:register_armor("mystical_agriculture:"..name.."helmet", {
					description = ("MysticalAgriculture "..desc.." helmet"),
					inventory_image = "helmet_"..name.."_inv.png",
					texture = "helmet_"..name..".png",
					preview = "helmet_"..name.."_preview.png",
					groups = {armor_head=1, armor_heal=10, armor_use=1000, armor_fire=10, physics_speed=2, physics_jump=.7, physics_gravity=-.7},
					groups = {armor_head=1, armor_heal=10*quality, armor_use=1000*quality, armor_fire=10},
					armor_groups = {fleshy=20},
					wear = 0,
				})
			
			minetest.register_craft({
					output = "mystical_agriculture:"..name.."helmet",
					recipe = {
						{ingot, ingot, ingot},
						{ingot, "", ingot},
					}
				})
			
			minetest.register_craft({
				output = "mystical_agriculture:"..name.."chestplate",
				recipe = {
					{ingot, "", ingot},
					{ingot, ingot, ingot},
					{ingot, ingot, ingot},
				}
			})
			
			minetest.register_craft({
				output = "mystical_agriculture:"..name.."leggings",
				recipe = {
					{ingot, ingot, ingot},
					{ingot, "", ingot},
					{ingot, "", ingot},
				}
			})
			
			minetest.register_craft({
				output = "mystical_agriculture:"..name.."boots",
				recipe = {
					{ingot, "", ingot},
					{ingot, "", ingot},
				}
			})
		end
	end
end
