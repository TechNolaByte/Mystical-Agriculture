mystical_agriculture.register_essence("inferium","Inferium",2,"default:mese_crystal_fragment",true)
mystical_agriculture.register_essence("intermedium","Intermedium",3,"mystical_agriculture:inferium_essence",true)
mystical_agriculture.register_essence("prudentium","Prudentium",4,"mystical_agriculture:intermedium_essence",true)
mystical_agriculture.register_essence("superium","Superium",5,"mystical_agriculture:prudentium_essence",true)
mystical_agriculture.register_essence("supremium","Supremium",6,"mystical_agriculture:superium_essence",true)
mystical_agriculture.register_essence("insanium","Insanium",7,"mystical_agriculture:supremium_essence",true)
mystical_agriculture.register_essence("prosperity","Prosperity",1,"mystical_agriculture:nil",false)


--gems
mystical_agriculture.register_normal_ore_crop("diamond","default:diamond","Diamond",5,3)	
mystical_agriculture.register_normal_ore_crop("mese","default:mese_crystal","Mese",5,2) 

--basic metals
mystical_agriculture.register_normal_ore_crop("tin","default:tin_ingot","Tin",2,4)	 
mystical_agriculture.register_normal_ore_crop("copper","default:copper_ingot","Copper",2,4)	
mystical_agriculture.register_normal_ore_crop("iron","default:steel_ingot","Wrought Iron",2,4)	
mystical_agriculture.register_normal_ore_crop("gold","default:gold_ingot","Gold",2,2)   
mystical_agriculture.register_normal_ore_crop("bronze","default:bronze_ingot","Bronze",2,8)	 

--basic misc
mystical_agriculture.register_normal_ore_crop("coal","default:coal_lump","Coal",2,4)
mystical_agriculture.register_normal_ore_crop("bone","bones:bones","Bone",6,1,nil,"default:clay")  

--liquids 
mystical_agriculture.register_normal_ore_crop("water","bucket:bucket_water","Water",4,1)   
mystical_agriculture.register_normal_ore_crop("fire","bucket:bucket_lava","Fire",4,1)

--multi use materials
mystical_agriculture.register_normal_ore_crop("dirt","group:soil","Earth",0,0) 
mystical_agriculture.register_normal_ore_crop("stone","group:stone","Rock",0,0) 
mystical_agriculture.register_normal_ore_crop("wood","group:tree","Wood",0,0) 
mystical_agriculture.register_normal_ore_crop("ice","default:ice","Ice",0,0) 
mystical_agriculture.register_normal_ore_crop("nature",0,"Nature",0,0) 

--essences
mystical_agriculture.register_pressence_ore_crop("inferium","mystical_agriculture:inferium_essence","Inferium","mystical_agriculture:inferium_essence")