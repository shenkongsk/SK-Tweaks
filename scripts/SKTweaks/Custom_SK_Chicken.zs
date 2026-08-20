#loader preinit 
#modloaded chickens

import mods.contenttweaker.ChickenFactory;
import mods.contenttweaker.Color;
// 定义鸡
var definedchicken = ChickenFactory.createChicken("defined_chicken", Color.fromHex("E331AE"), <item:contenttweaker:defined_egg>);
definedchicken.setForegroundColor(Color.fromHex("b8b8b8"));
definedchicken.setSpawnType("NONE");
definedchicken.register();