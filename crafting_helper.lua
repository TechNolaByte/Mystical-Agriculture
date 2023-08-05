-- cuts down the boilerplate
return function(output, recipe, type)
	if not type then
		type = "shaped"
	end

	local format_essence = function(string)
		if string.sub(string, 1, 2) == "E " then
			return "mystical_agriculture:"..string.sub(string, 3).."_essence"
		end
		return string
	end

	if type == "shapeless" then
		for i in pairs(recipe) do
			recipe[i] = format_essence(recipe[i])
		end
	else
		for x in pairs(recipe) do
			for y in pairs(recipe[x]) do
				recipe[x][y] = format_essence(recipe[x][y])
			end
		end
	end

	minetest.register_craft({
		type = type,
		output = output,
		recipe = recipe
	})
end