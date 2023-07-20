# Mystical Agriculture (For Minetest)
The "grow-everything" mod.

## What does it do?
This mod allows you to farm many resources that you otherwise would be unable to farm.  
The purpose is to allow passive resource generation to reduce or replace the burden of mining, exploring, etc.
Additionally, the mod can eliminate the need for destructive terraforming—if you love your world too much to destroy it for the sake of gathering dirt, stone, ore, etc... or if you play Skyblock and simply don't have the option of mining terrain, then this mod is for you!

## How do I farm everything?
Each compatible resource has seeds, plants, and essence.  
Place seeds on farmland (or special growth crystals) to grow plants which, when ripe and harvested, produce unique essence; collect and craft essences into the given resource. You can farm a lot of different resources, even diamonds :)

## My avarice is unsatiated. How do I get MORE and FASTER?
Crops will grow on normal farmland, but they grow slowly.  
To speed things up, use magical fertilizer.  
To invest in a permanent speed buff, place a growth crystal under the soil.  
Still not enough? Place crops on harvest crystals instead of soil for them to automatically harvest mature crops. (Best paired with a technical mod that allows for the automatic collection of items.)
STILL not enough? Don't forget rule #1 of farming: invest your output back into crafting more seeds for a larger farm.

## What does it look like?
![alt text](https://github.com/TechNolaByte/Mystical-Agriculture/blob/master/ma4.png?raw=true)
![alt text](https://github.com/TechNolaByte/Mystical-Agriculture/blob/master/ma5.png?raw=true)
![alt text](https://github.com/TechNolaByte/Mystical-Agriculture/blob/master/ma1.png?raw=true)
![alt text](https://github.com/TechNolaByte/Mystical-Agriculture/blob/master/ma2.png?raw=true)
![alt text](https://github.com/TechNolaByte/Mystical-Agriculture/blob/master/ma3.png?raw=true)
![alt text](https://github.com/TechNolaByte/Mystical-Agriculture/blob/master/ma6.png?raw=true)

## BUT MY FAVOURITE MOD/RESOURCE ISN'T SUPPORTED :( :(
Do not be sad! It is quite easy to add new resources!  
  
I assume you can figure out how to make a new mod that depends on mystical_agriculture.  
Then, simply use this function to register seeds, essence, crops, and crafting recipes automatically:  
Arguments - ``mystical_agriculture.register_normal_ore_crop(id,itemid,description,crafttype,craftamount,texture,optionforcraft6)``  
Example - ``mystical_agriculture.register_normal_ore_crop("diamond","default:diamond","Diamond",6,2,mystical_agriculture.get_inv_image("default:diamond"),"default:dirt")``  
Note that the argument "crafttype" determines what sort of recipe is needed to convert essence into the resource. It is a number from 0 to 6, here are the following shapes:  
```	
O == Essence

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
X = item in optionforcraft6 (last option in function)  
 O   
OXO  
 O  
``` 
  
If you want to register a plant but want it to drop an existing item directly without any essence or crafting:  
Arguments - ``mystical_agriculture.register_pressence_ore_crop(id,itemIdOfItemUsedToCraftSeeds,description,ItemIdOfItemToBeUsedAsEssence,texture)``  
Example - ``mystical_agriculture.register_pressence_ore_crop("inferium","mystical_agriculture:inferium_essence","Inferium","mystical_agriculture:inferium_essence",mystical_agriculture.get_inv_image("mystical_agriculture:inferium_ingot"))``  

## Credits
The mod idea, and most textures, came from the original Minecraft mod "Mystical Agriculture" developed by BlakeBr0—released under MIT license.  
TechNolaByte (Formerly known as RSLRedstonier) produced the minetest clone for his personal use before abandoning it.  
AFCMS helped out with the support for 3d armour mod.  
MidnightPhantom has so far helped to clean up the outdated portions of the project and bring it up to working condition again.  
