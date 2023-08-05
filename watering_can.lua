local water_node = function(user, pos)
	local node = minetest.get_node(pos)
	local nodedef = minetest.registered_nodes[node.name]
	if nodedef == nil then
		return -- dafuq?
	end

	-- General soil wetting
	local soil = nodedef.soil
	if soil and node.name == soil.dry then
		minetest.set_node(pos, {name=soil.wet})
		return
	end

	-- Farming soil wetting (compatibility with Farming Redo)
	if node.name == "farming:soil" then
		minetest.set_node(pos, {name="farming:soil_wet"})
		return
	end
	
	-- Cactus growth
	if node.name == "default:cactus" then
		default.grow_cactus(pos, minetest.get_node(pos))
		return
	end

	-- Papyrus growth
	if node.name == "default:papyrus" then
		default.grow_papyrus(pos, minetest.get_node(pos))
		return
	end

	-- Seed growth
	if minetest.get_item_group(node.name, "seed") > 0 and nodedef.fertility then
		local grow = false
		local node_under = minetest.get_node_or_nil({x = pos.x, y = pos.y - 1, z = pos.z})
		if node_under == nil then
			return
		end
		-- Can this seed grow on the node that's beneath it?
		for _, v in pairs(nodedef.fertility) do
			if minetest.get_item_group(node_under.name, v) > 0 then
				grow = true
			end
		end
		if grow then
			minetest.set_node(pos, {name=node.name:gsub("seed_", "") .. "_1"})
		end
		return
	end

	-- Plant growth
	local plant_nbr_s, plant_nbr_e = string.find(node.name, "_[0-9]+$")
	if minetest.get_item_group(node.name, "plant") > 0 and plant_nbr_s then
		local plant_nbr = tonumber(string.sub(node.name, plant_nbr_s+1, plant_nbr_e))
		local orig_name = string.sub(node.name, 0, plant_nbr_s)
		local next = orig_name .. (plant_nbr+1)
		if minetest.registered_nodes[next] then
			minetest.set_node(pos, {name=next})
		end
		return
	end

	-- Grow grass on dirt
	-- Convery dry grass to grass
	if (node.name == "default:dirt" and minetest.find_node_near(pos, 1, {"default:dirt_with_grass"}))
	   or (node.name == "default:dirt_with_dry_grass")
	   and math.random() > 0.4 then
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = minetest.get_node(above).name
		local above_nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and above_nodedef and
		   ((above_nodedef.sunlight_propagates or above_nodedef.paramtype == "light") and above_nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name="default:dirt_with_grass"})
		end
		return
	end

	-- Put out fire
	if node.name == "fire:basic_flame" then
		minetest.set_node(pos, {name="air"})
		minetest.sound_play("default_cool_lava",
			{pos = pos, max_hear_distance = 16, gain = 0.25})
		return
	end
end

local water_nodes = function(user, minp, maxp, chance)
	for x=math.floor(minp.x),math.floor(maxp.x) do
		for y=math.floor(minp.y),math.floor(maxp.y) do
			for z=math.floor(minp.z),math.floor(maxp.z) do
				if math.random() < chance then
					water_node(user, {x=x, y=y, z=z})
				end
			end
		end
	end

	local function rn() return math.random()-.5 end
	local function rr(min, max) return min + math.random() * (max-min) end

	local particle_count = math.random(1, 4) * (maxp.x-minp.x+1) * (maxp.z-minp.z+1)
	for _=0,particle_count do
		minetest.add_particle({
			pos = {x = rr(minp.x, maxp.x), y = maxp.y + 0.7, z = rr(minp.z, maxp.z) },
			vel = {x=rn()*.6, y=0, z=rn()*.6},
			acc = {x=0, y=-10, z=0},
			expirationtime = math.random()*2+1,
			size = 1,
			collisiondetection = true,
			vertical = false,
			texture = "waterican_droplet.png",
			playername = user:get_player_name()
		})
	end
end

return water_nodes