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

val MACHINE = "large_scale_hypergrowth_insolator";
MachineModifier.setMaxThreads(MACHINE, 32);

// val romanNumerals = [
//     "I", "II", "III", "IV", "V", "VI", "VII", "VIII",
//     "IX", "X", "XI", "XII", "XIII", "XIV", "XV", "XVI"
// ] as string[];

// for roman in romanNumerals {
//     val thread = FactoryRecipeThread.createCoreThread("§e鸡舍" + roman);
//     MachineModifier.addCoreThread(MACHINE, thread);
// }
// MachineModifier.setInternalParallelism("large_scale_chicken_farm", 4);
<modularmachinery:large_scale_hypergrowth_insolator_factory_controller>.addTooltip(format.gold("内置额外32线程！"));




function Recipe_Builder_SK_Hypergrowth(
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
    builder.addFluidInput(<liquid:hot_spring_water>*100);
    // 物品输出
    for item in outputs {
        builder.addItemOutput(item);
    }


    builder.build();
}
val Hypergrowth_Input = [
    [<mysticalagradditions:nether_star_seeds>],
    [<mysticalagradditions:dragon_egg_seeds>],
    [<mysticalagradditions:awakened_draconium_seeds>],
    [<mysticalagradditions:neutronium_seeds>],
    [<mysticalagriculture:stone_seeds>],
    [<mysticalagriculture:dirt_seeds>],
    [<mysticalagriculture:nature_seeds>],
    [<mysticalagriculture:wood_seeds>],
    [<mysticalagriculture:water_seeds>],
    [<mysticalagriculture:ice_seeds>],
    [<mysticalagriculture:fire_seeds>],
    [<mysticalagriculture:dye_seeds>],
    [<mysticalagriculture:nether_seeds>],
    [<mysticalagriculture:coal_seeds>],
    [<mysticalagriculture:iron_seeds>],
    [<mysticalagriculture:nether_quartz_seeds>],
    [<mysticalagriculture:glowstone_seeds>],
    [<mysticalagriculture:redstone_seeds>],
    [<mysticalagriculture:obsidian_seeds>],
    [<mysticalagriculture:gold_seeds>],
    [<mysticalagriculture:lapis_lazuli_seeds>],
    [<mysticalagriculture:end_seeds>],
    [<mysticalagriculture:diamond_seeds>],
    [<mysticalagriculture:emerald_seeds>],
    [<mysticalagriculture:slime_seeds>],
    [<mysticalagriculture:silicon_seeds>],
    [<mysticalagriculture:sulfur_seeds>],
    [<mysticalagriculture:aluminum_seeds>],
    [<mysticalagriculture:copper_seeds>],
    [<mysticalagriculture:saltpeter_seeds>],
    [<mysticalagriculture:tin_seeds>],
    [<mysticalagriculture:zinc_seeds>],
    [<mysticalagriculture:silver_seeds>],
    [<mysticalagriculture:lead_seeds>],
    [<mysticalagriculture:graphite_seeds>],
    [<mysticalagriculture:nickel_seeds>],
    [<mysticalagriculture:mithril_seeds>],
    [<mysticalagriculture:tungsten_seeds>],
    [<mysticalagriculture:titanium_seeds>],
    [<mysticalagriculture:uranium_seeds>],
    [<mysticalagriculture:chrome_seeds>],
    [<mysticalagriculture:platinum_seeds>],
    [<mysticalagriculture:iridium_seeds>],
    [<mysticalagriculture:ruby_seeds>],
    [<mysticalagriculture:sapphire_seeds>],
    [<mysticalagriculture:peridot_seeds>],
    [<mysticalagriculture:amber_seeds>],
    [<mysticalagriculture:topaz_seeds>],
    [<mysticalagriculture:malachite_seeds>],
    [<mysticalagriculture:tanzanite_seeds>],
    [<mysticalagriculture:hop_graphite_seeds>],
    [<mysticalagriculture:knightslime_seeds>],
    [<mysticalagriculture:ardite_seeds>],
    [<mysticalagriculture:cobalt_seeds>],
    [<mysticalagriculture:mystical_flower_seeds>],
    [<mysticalagriculture:quicksilver_seeds>],
    [<mysticalagriculture:thaumium_seeds>],
    [<mysticalagriculture:void_metal_seeds>],
    [<mysticalagriculture:marble_seeds>],
    [<mysticalagriculture:limestone_seeds>],
    [<mysticalagriculture:basalt_seeds>],
    [<mysticalagriculture:apatite_seeds>],
    [<mysticalagriculture:electrotine_seeds>],
    [<mysticalagriculture:steeleaf_seeds>],
    [<mysticalagriculture:ironwood_seeds>],
    [<mysticalagriculture:knightmetal_seeds>],
    [<mysticalagriculture:fiery_ingot_seeds>],
    [<mysticalagriculture:coralium_seeds>],
    [<mysticalagriculture:abyssalnite_seeds>],
    [<mysticalagriculture:dreadium_seeds>],
    [<mysticalagriculture:slimy_bone_seeds>],
    [<mysticalagriculture:syrmorite_seeds>],
    [<mysticalagriculture:octine_seeds>],
    [<mysticalagriculture:valonite_seeds>],
    [<mysticalagriculture:thorium_seeds>],
    [<mysticalagriculture:boron_seeds>],
    [<mysticalagriculture:lithium_seeds>],
    [<mysticalagriculture:magnesium_seeds>],
    [<mysticalagriculture:black_quartz_seeds>],
    [<mysticalagriculture:menril_seeds>],
    [<mysticalagriculture:aquamarine_seeds>],
    [<mysticalagriculture:starmetal_seeds>],
    [<mysticalagriculture:rock_crystal_seeds>],
    [<mysticalagriculture:jade_seeds>],
    [<mysticalagriculture:ender_amethyst_seeds>],
    [<mysticalagriculture:draconium_seeds>],
    [<mysticalagriculture:yellorium_seeds>],
    [<mysticalagriculture:sky_stone_seeds>],
    [<mysticalagriculture:certus_quartz_seeds>],
    [<mysticalagriculture:fluix_seeds>],
    [<aoa3:bubble_berry_seeds>],
    [<aoa3:heart_fruit_seeds>],
    [<aoa3:holly_top_seeds>],
    [<divinerpg:tomato_seeds>],
    [<divinerpg:marsine_seeds>],
    [<divinerpg:white_mushroom_seeds>],
    [<divinerpg:moonbulb_seeds>],
    [<erebus:materials:3>],
    [<aoa3:rosidon_seeds>],
    [<thaumadditions:void_seed>],
    [<contenttweaker:tier_i_defined_seed>],
    [<contenttweaker:tier_ii_defined_seed>],
    [<contenttweaker:tier_iii_defined_seed>],
    [<contenttweaker:tier_iv_defined_seed>],
    [<contenttweaker:tier_v_defined_seed>],
    [<contenttweaker:tier_vi_defined_seed>]
];

val Essenses_Output = [
    [<mysticalagradditions:nether_star_essence> * 64],
    [<mysticalagradditions:dragon_egg_essence> * 64],
    [<mysticalagradditions:awakened_draconium_essence> * 64],
    [<mysticalagradditions:neutronium_essence> * 64],
    [<mysticalagriculture:stone_essence> * 64],
    [<mysticalagriculture:dirt_essence> * 64],
    [<mysticalagriculture:nature_essence> * 64],
    [<mysticalagriculture:wood_essence> * 64],
    [<mysticalagriculture:water_essence> * 64],
    [<mysticalagriculture:ice_essence> * 64],
    [<mysticalagriculture:fire_essence> * 64],
    [<mysticalagriculture:dye_essence> * 64],
    [<mysticalagriculture:nether_essence> * 64],
    [<mysticalagriculture:coal_essence> * 64],
    [<mysticalagriculture:iron_essence> * 64],
    [<mysticalagriculture:nether_quartz_essence> * 64],
    [<mysticalagriculture:glowstone_essence> * 64],
    [<mysticalagriculture:redstone_essence> * 64],
    [<mysticalagriculture:obsidian_essence> * 64],
    [<mysticalagriculture:gold_essence> * 64],
    [<mysticalagriculture:lapis_lazuli_essence> * 64],
    [<mysticalagriculture:end_essence> * 64],
    [<mysticalagriculture:diamond_essence> * 64],
    [<mysticalagriculture:emerald_essence> * 64],
    [<mysticalagriculture:slime_essence> * 64],
    [<mysticalagriculture:silicon_essence> * 64],
    [<mysticalagriculture:sulfur_essence> * 64],
    [<mysticalagriculture:aluminum_essence> * 64],
    [<mysticalagriculture:copper_essence> * 64],
    [<mysticalagriculture:saltpeter_essence> * 64],
    [<mysticalagriculture:tin_essence> * 64],
    [<mysticalagriculture:zinc_essence> * 64],
    [<mysticalagriculture:silver_essence> * 64],
    [<mysticalagriculture:lead_essence> * 64],
    [<mysticalagriculture:graphite_essence> * 64],
    [<mysticalagriculture:nickel_essence> * 64],
    [<mysticalagriculture:mithril_essence> * 64],
    [<mysticalagriculture:tungsten_essence> * 64],
    [<mysticalagriculture:titanium_essence> * 64],
    [<mysticalagriculture:uranium_essence> * 64],
    [<mysticalagriculture:chrome_essence> * 64],
    [<mysticalagriculture:platinum_essence> * 64],
    [<mysticalagriculture:iridium_essence> * 64],
    [<mysticalagriculture:ruby_essence> * 64],
    [<mysticalagriculture:sapphire_essence> * 64],
    [<mysticalagriculture:peridot_essence> * 64],
    [<mysticalagriculture:amber_essence> * 64],
    [<mysticalagriculture:topaz_essence> * 64],
    [<mysticalagriculture:malachite_essence> * 64],
    [<mysticalagriculture:tanzanite_essence> * 64],
    [<mysticalagriculture:hop_graphite_essence> * 64],
    [<mysticalagriculture:knightslime_essence> * 64],
    [<mysticalagriculture:ardite_essence> * 64],
    [<mysticalagriculture:cobalt_essence> * 64],
    [<mysticalagriculture:mystical_flower_essence> * 64],
    [<mysticalagriculture:quicksilver_essence> * 64],
    [<mysticalagriculture:thaumium_essence> * 64],
    [<mysticalagriculture:void_metal_essence> * 64],
    [<mysticalagriculture:marble_essence> * 64],
    [<mysticalagriculture:limestone_essence> * 64],
    [<mysticalagriculture:basalt_essence> * 64],
    [<mysticalagriculture:apatite_essence> * 64],
    [<mysticalagriculture:electrotine_essence> * 64],
    [<mysticalagriculture:steeleaf_essence> * 64],
    [<mysticalagriculture:ironwood_essence> * 64],
    [<mysticalagriculture:knightmetal_essence> * 64],
    [<mysticalagriculture:fiery_ingot_essence> * 64],
    [<mysticalagriculture:coralium_essence> * 64],
    [<mysticalagriculture:abyssalnite_essence> * 64],
    [<mysticalagriculture:dreadium_essence> * 64],
    [<mysticalagriculture:slimy_bone_essence> * 64],
    [<mysticalagriculture:syrmorite_essence> * 64],
    [<mysticalagriculture:octine_essence> * 64],
    [<mysticalagriculture:valonite_essence> * 64],
    [<mysticalagriculture:thorium_essence> * 64],
    [<mysticalagriculture:boron_essence> * 64],
    [<mysticalagriculture:lithium_essence> * 64],
    [<mysticalagriculture:magnesium_essence> * 64],
    [<mysticalagriculture:black_quartz_essence> * 64],
    [<mysticalagriculture:menril_essence> * 64],
    [<mysticalagriculture:aquamarine_essence> * 64],
    [<mysticalagriculture:starmetal_essence> * 64],
    [<mysticalagriculture:rock_crystal_essence> * 64],
    [<mysticalagriculture:jade_essence> * 64],
    [<mysticalagriculture:ender_amethyst_essence> * 64],
    [<mysticalagriculture:draconium_essence> * 64],
    [<mysticalagriculture:yellorium_essence> * 64],
    [<mysticalagriculture:sky_stone_essence> * 64],
    [<mysticalagriculture:certus_quartz_essence> * 64],
    [<mysticalagriculture:fluix_essence> * 64],
    [<aoa3:bubble_berries> * 64],
    [<aoa3:heart_fruit> * 64],
    [<aoa3:holly_top_petals> * 64],
    [<divinerpg:tomato> * 64],
    [<divinerpg:marsine> * 64],
    [<divinerpg:white_mushroom> * 64],
    [<divinerpg:moonbulb> * 64],
    [<erebus:materials:3> * 64],
    [<aoa3:rosidons> * 64],
    [<thaumcraft:void_seed> * 64],
    [<mysticalagriculture:crafting> * 128],
    [<mysticalagriculture:crafting:1> * 64],
    [<mysticalagriculture:crafting:2> * 32],
    [<mysticalagriculture:crafting:3> * 16],
    [<mysticalagriculture:crafting:4> * 8],
    [<mysticalagradditions:insanium> * 2]
];

for i in 0 to Hypergrowth_Input.length {
    val recipeName = "hypergrowth_sk_" + (i + 1);
    Recipe_Builder_SK_Hypergrowth(
        recipeName,
        "large_scale_hypergrowth_insolator",
        Hypergrowth_Input[i],
        [0.0],
        Essenses_Output[i],
        10
    );
}