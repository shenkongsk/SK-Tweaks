#loader crafttweaker reloadable

import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;

import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

val MACHINE = "large_scale_chicken_farm";
MachineModifier.setMaxThreads(MACHINE, 16);

// val romanNumerals = [
//     "I", "II", "III", "IV", "V", "VI", "VII", "VIII",
//     "IX", "X", "XI", "XII", "XIII", "XIV", "XV", "XVI"
// ] as string[];

// for roman in romanNumerals {
//     val thread = FactoryRecipeThread.createCoreThread("§e鸡舍" + roman);
//     MachineModifier.addCoreThread(MACHINE, thread);
// }
// MachineModifier.setInternalParallelism("large_scale_chicken_farm", 4);
<modularmachinery:large_scale_chicken_farm_factory_controller>.addTooltip(format.gold("内置额外16线程！"));




function Recipe_Builder_SK_Chicken(
    recipeName as string,
    machineName as string,
    inputs as crafttweaker.item.IIngredient[],
    inputChances as double[],          // 可留空 []
    outputs as crafttweaker.item.IIngredient[],
    time as long
) as void 
{
    val builder = RecipeBuilder.newBuilder(recipeName, machineName, time);
    builder.setMaxThreads(1);
    // 物品输入
    for i in 0 to inputs.length{
        val item = inputs[i];
        val chance = (inputChances.length > i) ? inputChances[i] : 1.0;
        builder.addItemInput(item).setChance(chance);
    }
    // 物品输出
    for item in outputs {
        builder.addItemOutput(item);
    }


    builder.build();
}
val Chicken_Input = [
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:polonium_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:brightsteel_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:ogerite_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:mithrillium_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:palladium_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:jade_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:cold_iron_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:chalcedony_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:arlemite_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:limonite_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:green_gemstone_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:legbone_fragment_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:bloodgem_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:chaos_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:vityte_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:purple_gemstone_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:mystite_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:blazium_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:footbone_fragment_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:bloodstone_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:rupee_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:blue_gemstone_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:amethyst_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:skullbone_fragment_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:amber_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:realmite_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:yellow_gemstone_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:runium_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:charged_runium_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:netherite_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:sapphire_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:glitch_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:crystallite_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:gemenyte_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:rosite_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:varsium_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:rhenium_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:lyon_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:candyte_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:lunastone_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:baronyte_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:jewelyte_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:unidentified_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:white_gemstone_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:chestbone_fragment_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:red_gemstone_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:emberstone_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:fluctuatite_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:ornamyte_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:infinity_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "chickens:pshardchicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "chickens:stringchicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "chickens:emeraldchicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "chickens:glasschicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "chickens:waterchicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "chickens:slimechicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "chickens:pcrystalchicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "chickens:gunpowderchicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "chickens:lavachicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:elecanium_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:hassium_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:rubidium_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:strontium_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:caesium_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:energy_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:osmium_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:ghoulish_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:pure_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:ghastly_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:heraldry_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:fesh_abomination_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "chickens:coalchicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:focusing_chicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "chickens:redstonechicken"}})*1],
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:lovely_chicken"}})*1],
    [<minecraft:egg>*1],
    [<hatchery:hatcheryegg>*1]
];

val Egg_Output = [
    [<contenttweaker:polonium_egg>*16],
    [<contenttweaker:brightsteel_egg>*16],
    [<contenttweaker:ogerite_egg>*16],
    [<contenttweaker:mithrillium_egg>*16],
    [<contenttweaker:palladium_egg>*16],
    [<contenttweaker:jade_egg>*16],
    [<contenttweaker:cold_iron_egg>*16],
    [<contenttweaker:chalcedony_egg>*16],
    [<contenttweaker:arlemite_egg>*16],
    [<contenttweaker:limonite_egg>*16],
    [<contenttweaker:green_gemstone_egg>*16],
    [<contenttweaker:legbone_fragment_egg>*16],
    [<contenttweaker:bloodgem_egg>*16],
    [<contenttweaker:chaotic_egg>*16],
    [<contenttweaker:vityte_egg>*16],
    [<contenttweaker:purple_gemstone_egg>*16],
    [<contenttweaker:mystite_egg>*16],
    [<contenttweaker:blazium_egg>*16],
    [<contenttweaker:footbone_fragment_egg>*16],
    [<contenttweaker:bloodstone_egg>*16],
    [<contenttweaker:rupee_egg>*16],
    [<contenttweaker:blue_gemstone_egg>*16],
    [<contenttweaker:amethyst_egg>*16],
    [<contenttweaker:skullbone_fragment_egg>*16],
    [<contenttweaker:amber_egg>*16],
    [<contenttweaker:realmite_egg>*16],
    [<contenttweaker:yellow_gemstone_egg>*16],
    [<contenttweaker:runium_egg>*16],
    [<contenttweaker:charged_runium_egg>*16],
    [<contenttweaker:netherite_egg>*16],
    [<contenttweaker:sapphire_egg>*16],
    [<contenttweaker:glitch_infused_egg>*16],
    [<contenttweaker:crystallite_egg>*16],
    [<contenttweaker:gemenyte_egg>*16],
    [<contenttweaker:rosite_egg>*16],
    [<contenttweaker:varsium_egg>*16],
    [<contenttweaker:rhenium_egg>*16],
    [<contenttweaker:lyon_egg>*16],
    [<contenttweaker:candyte_egg>*16],
    [<contenttweaker:lunastone_egg>*16],
    [<contenttweaker:baronyte_egg>*16],
    [<contenttweaker:jewelyte_egg>*16],
    [<contenttweaker:unidentified_egg>*16],
    [<contenttweaker:white_gemstone_egg>*16],
    [<contenttweaker:chestbone_fragment_egg>*16],
    [<contenttweaker:red_gemstone_egg>*16],
    [<contenttweaker:emberstone_egg>*16],
    [<contenttweaker:fluctuatite_egg>*16],
    [<contenttweaker:ornamyte_egg>*16],
    [<contenttweaker:infinity_egg>*16],
    [<minecraft:prismarine_shard>*64],
    [<minecraft:string>*64],
    [<minecraft:emerald>*64],
    [<minecraft:glass>*64],
    [<chickens:liquid_egg:0>*64],
    [<minecraft:slime_ball>*64],
    [<minecraft:prismarine_crystals>*64],
    [<minecraft:gunpowder>*64],
    [<chickens:liquid_egg:1>*64],
    [<contenttweaker:elecanium_egg>*16],
    [<contenttweaker:hassium_egg>*16],
    [<contenttweaker:rubidium_egg>*16],
    [<contenttweaker:strontium_egg>*16],
    [<contenttweaker:caesium_egg>*16],
    [<contenttweaker:energy_egg>*16],
    [<contenttweaker:osmium_egg>*16],
    [<contenttweaker:ghoulish_egg>*16],
    [<contenttweaker:pure_egg>*16],
    [<contenttweaker:ghastly_egg>*16],
    [<contenttweaker:heraldry_egg>*64],
    [<contenttweaker:abominable_egg>*16],
    [<minecraft:coal>*128],
    [<contenttweaker:focusing_egg>*16],
    [<minecraft:redstone>*128],
    [<contenttweaker:lovely_egg>*32],
    [<minecraft:egg>*64],
    [<minecraft:egg>*128]
];

for i in 0 to Chicken_Input.length{
    val recipeName = "chicken_sk_" + (i + 1);
    Recipe_Builder_SK_Chicken(
        recipeName,                        // 配方名
        "large_scale_chicken_farm",        // 机器名
        Chicken_Input[i],                  // 物品输入（单元素数组）
        [0.0],                             // 输入几率（0%）
        Egg_Output[i],                     // 物品输出
        480                               // 时间（tick）
    );
}