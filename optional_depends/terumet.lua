local function T(id, resource, name, type, amount)
	mystical_agriculture.register_ore_crop(id, name, {
		resource = resource,
		craft = { type = type, amount = amount}
	})
end

T("thermese","terumet:item_thermese","Thermese",4,2) 
T("terumetal","terumet:ingot_raw","Terumetal",2,2) 
T("entropy","terumet:item_entropy","Entropic",4,1) 
T("teruceramic","terumet:item_ceramic","Teruceramic",2,2) 
T("terucopper","terumet:ingot_tcop","Terucopper",2,4) 
T("terutin","terumet:ingot_ttin","Terutin",2,4) 
T("terusteel","terumet:ingot_tste","Terusteel",2,4) 
T("terugold","terumet:ingot_tgol","Terugold",2,2) 
T("coreglass","terumet:ingot_cgls","Coreglass",4,2) 
T("teruchalcum","terumet:ingot_tcha","Teruchalcum",2,4) 