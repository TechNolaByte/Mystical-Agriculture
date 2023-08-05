local function T(id, resource, name, amount)
	mystical_agriculture.register_ore_crop(id, name, {
		resource = resource,
		craft = { type = 3, amount = amount}
	})
end

T("rubber","technic:rubber","Rubber",8) 
T("stainless_steel","technic:stainless_steel_ingot","Stainless Steel",2) 
T("chrome","technic:chromium_ingot","Chromium",4)
T("brass","technic:brass_ingot","Brass",4) 
T("carbon_steel","technic:carbon_steel_ingot","Carbon Steel",4) 
T("sulfur","technic:sulfur_lump","Sulfur",8) 
T("zinc","technic:zinc_ingot","Zinc",4) 
T("lead","technic:lead_ingot","Lead",6)

-- for number = 0, 35 do
-- mystical_agriculture.register_normal_ore_crop("uranium_"..number,"technic:uranium"..number.."_ingot","Uranium "..(number/10).." Fizzle",1,3,"uranium_0_essence.png")   
-- end