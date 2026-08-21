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
import mods.contenttweaker.IItemStackSupplier;
import crafttweaker.item.IItemStack;
// import crafttweaker.creativetabs.ICreativeTab;
import mods.contenttweaker.CreativeTab;


// 创造模式标签
// static SKT as CreativeTab = VanillaFactory.createCreativeTab("§dSKTweaks", <minecraft:nether_star>);
// SKT.register();
static SKT as CreativeTab = VanillaFactory.createCreativeTab(
    "SKT",<item:tardis:tardis_coral>
);
SKT.register();
function simple_register_item(
    name as string
) {
    var item = VanillaFactory.createItem(name);
    item.maxStackSize = 64;
    item.beaconPayment = false;
    item.creativeTab = <creativetab:SKT>;
    item.register();
}
simple_register_item("eezo_ore");
simple_register_item("refined_eezo");
simple_register_item("eezo_energy_unit");
simple_register_item("etherium_plate");
simple_register_item("eternal_glory");
simple_register_item("unleashed_star_ingot");
simple_register_item("defined_egg");
simple_register_item("balanced_ingot");
// function SK_ITEM_REGISTER(
//     name as string,
//     stacksize as int,
//     beacon as bool,
//     creativetab as CreativeTab,//按理来说类型是ICreativeTab
//     glowing as bool,
//     maxdamage as int,       //小于0当作普通物品
//     rarity as string,
//     toolclass as string,
//     toollevel as int
// )as void {
//     var item = VanillaFactory.createItem(name);
//     item.maxStackSize = stacksize;
//     item.beaconPayment = beacon;
//     item.creativeTab = creativetab;
//     item.glowing = glowing;
//     item.maxDamage = maxdamage;
//     item.rarity = rarity;
//     item.toolClass = toolclass;
//     item.toolLevel = toollevel;
//     item.register();
// }
function simple_register_block(
    name as string,
    istransparent as bool,
    isbeacon as bool,
    iswitherProof as bool,
    BlockHardness as float,
    BlockLayer as string
) {
    var block = VanillaFactory.createBlock(name, <blockmaterial:iron>);
    block.blockHardness = BlockHardness;
    block.blockResistance = 5.0;
    block.beaconBase = isbeacon;
    block.toolClass = "pickaxe";
    block.toolLevel = 2;
    block.blockSoundType = <soundtype:metal>;
    block.slipperiness = 0.6;
    block.creativeTab = <creativetab:SKT>;
    block.translucent = istransparent;
    block.witherProof = iswitherProof;
    block.blockLayer = BlockLayer;
    block.register();
}
simple_register_block("core_astral",true,true,true,9.0,"TRANSLUCENT");
simple_register_block("core_avartia",false,true,true,9.0,"SOLID");
simple_register_block("core_blackhole",false,true,true,9.0,"SOLID");
simple_register_block("core_cosmos",false,true,true,9.0,"SOLID");
simple_register_block("core_dark",false,true,true,9.0,"SOLID");
simple_register_block("core_pure",false,true,true,9.0,"SOLID");
simple_register_block("core_eternal",false,true,true,9.0,"SOLID");


