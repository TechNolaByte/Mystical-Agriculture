local modpath = minetest.get_modpath("mystical_agriculture")

dofile(modpath.."/nodes.lua")
dofile(modpath.."/items.lua")
dofile(modpath.."/tools.lua")
dofile(modpath.."/essence_crafting.lua")
dofile(modpath.."/functions.lua")
dofile(modpath.."/registering.lua")

if(minetest.get_modpath("dye")~=nil) then  
dofile(modpath.."/optional_depends/dye.lua")
end

if(minetest.get_modpath("bacon")~=nil) then  
dofile(modpath.."/optional_depends/bacon.lua")
end

if(minetest.get_modpath("lapis")~=nil) then  
dofile(modpath.."/optional_depends/lapis.lua")
end

if(minetest.get_modpath("exoticores")~=nil) then  
dofile(modpath.."/optional_depends/exoticores.lua")
end

if(minetest.get_modpath("glooptest")~=nil) then  
dofile(modpath.."/optional_depends/glooptest.lua")
end

if(minetest.get_modpath("terumet")~=nil) then  
dofile(modpath.."/optional_depends/terumet.lua")
end
	
if(minetest.get_modpath("skytest")~=nil) then  
dofile(modpath.."/optional_depends/skytest.lua")
end

if(minetest.get_modpath("technic")~=nil) then  
dofile(modpath.."/optional_depends/technic.lua")
end

if(minetest.get_modpath("bonemeal")~=nil) then  
dofile(modpath.."/optional_depends/bonemeal.lua")
end

if(minetest.get_modpath("titanite")~=nil) then
dofile(modpath.."/optional_depends/titanite.lua")
end

if(minetest.get_modpath("rainbow_ore")~=nil) then
dofile(modpath.."/optional_depends/rainbow_ore.lua")
end

if(minetest.get_modpath("moreores")~=nil) then
dofile(modpath.."/optional_depends/moreores.lua")
end
--[[
	
list of all materials that can be directly farmed via essence	
	
default:ice
default:snow
default:diamond
default:mese_crystal
default:tin_ingot
default:copper_ingot
default:steel_ingot   
default:gold_ingot
default:bronze_ingot
default:coal_lump
bucket:bucket_water
bucket:bucket_lava
technic:rubber 
technic:uranium0_ingot - technic:uranium35_ingot
technic:stainless_steel_ingot
technic:chromium_ingot
technic:sulfur_lump
technic:carbon_steel_ingot
technic:brass_ingot
technic:zinc_ingot
technic:lead_ingot
bones:bones
moreores:silver_ingot
moreores:mithril_ingot

technic:mixed_metal_ingot
technic:cast_iron_ingot
terumet:ingot_tcop
terumet:ingot_tcha
terumet:ingot_raw
terumet:ingot_cgls
terumet:ingot_tste
terumet:ingot_tgol
terumet:item_thermese
skytest:cosmic_drop
skytest:neptonium_nuggets
skytest:bedrockium_ingot
]]--


--[[Adamantine
Aluminum
Aluminum Brass
Apatite
Aquamarine
Aquarium
Ardite
Basalt
Black Quartz
Blue Topaz
Certus Quartz
Chimerite
Cobalt
Cold-Iron
Conductive Iron
Constantan
Dark Steel
Dawnstone
Desh
Draconium
Dye
Electrical Steel
Electrum
Elementium
Emerald
End
Ender Amethyst
Ender Biotite
Energetic Alloy
Experience
Fiery Ingot
Fluix
Fluxed Electrum
Glowstone
Glowstone Ingot
Invar
Iridium
Iridium Ore
Ironwood
Knightmetal
Knightslime
Lapis Lazuli
Limestone
Manasteel
Manyullyn
Marble
Menril
Meteoric Iron
Mithril
Moonstone
Mystical Flower
Nether
Nether Quartz
Nickel
Osmium
Platinum
Pulsating Iron
Quartz Enriched Iron
Redstone
Redstone Alloy
Refined Obsidian
Rock Crystal
Saltpeter
Silicon
Silver
Sky Stone
Slate
Soularium
Starmetal
Star-Steel
Steel
Steeleaf
Sunstone
Terrasteel
Titanium
Tungsten
Vibrant Alloy
Vinteum
Yellorium
]]--