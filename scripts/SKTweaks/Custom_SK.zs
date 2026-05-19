#loader crafttweaker reloadable
#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.Commands;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;
import mods.contenttweaker.Block;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.MaterialBuilder;

var eezo_ore = VanillaFactory.createItem("eezo_ore");
eezo_ore.maxStackSize = 64;
eezo_ore.beaconPayment = false;
eezo_ore.register();
var refined_eezo = VanillaFactory.createItem("refined_eezo");
refined_eezo.maxStackSize = 64;
refined_eezo.beaconPayment = false;
refined_eezo.register();
var eezo_energy_unit = VanillaFactory.createItem("eezo_energy_unit");
eezo_energy_unit.maxStackSize = 64;
eezo_energy_unit.beaconPayment = false;
eezo_energy_unit.register();
