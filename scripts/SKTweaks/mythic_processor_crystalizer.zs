#loader crafttweaker reloadable
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
recipes.addShapeless(<modularmachinery:mythic_processor_crystallizer_controller>*1, 
    [
        <nuclearcraft:crystallizer_idle>, 
        <modularmachinery:blockcontroller>
    ]
);

var MachineName = "mythic_processor_crystallizer";
val fluidInputs = [
    <fluid:energetic_ogerite>*10,
    <fluid:chaotic_honey_1>*5,
    <fluid:chaotic_honey_2>*5,
    <fluid:chaotic_honey_3>*5,
    <fluid:chaotic_honey_4>*5,
    <fluid:energized_mulch>*250,
    <fluid:deuterium>*500,
    <fluid:tritium>*500,
    <fluid:hydrogen>*500,
    <fluid:whispering_starlight>*100,
    <fluid:corium>*250,
    <fluid:saline_remains>*16000,
    <fluid:bef2>*500,
    <fluid:tot>*200,
    <fluid:yttrium_ruthenium>*200,
    <fluid:einstenium_253>*50,
    <fluid:einstenium_254>*50,
    <fluid:primed_technetium>*10
];
val itemOutputs = [
    <contenttweaker:ogerite_crystal_matrix>,
    <contenttweaker:chaotic_honey_shard_1>,
    <contenttweaker:chaotic_honey_shard_2>,
    <contenttweaker:chaotic_honey_shard_3>,
    <contenttweaker:chaotic_honey_shard_4>,
    <contenttweaker:shyre_mulch>,
    <contenttweaker:deuterium_crystal>,
    <contenttweaker:tritium_crystal>,
    <contenttweaker:hydrogen_crystal>,
    <contenttweaker:meatball_attuned_crystal>,
    <contenttweaker:radioactive_residue>,
    <contenttweaker:low_density_salt>,
    <contenttweaker:beryllium_fluoride_crystal>,
    <contenttweaker:seraphinite_gem>,
    <contenttweaker:yttrium_ruthenium_cluster>,
    <contenttweaker:einstenium_253>,
    <contenttweaker:einstenium_254>,
    <contenttweaker:technetium_remains>
];

// 同时遍历两个列表
for i in 0 to fluidInputs.length{
    scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
        "mythic_crystallizer_recipe_" + i,
        MachineName,
        [],                // 无物品输入
        [fluidInputs[i]],  // 流体输入
        [itemOutputs[i]],  // 物品输出
        [],                // 无流体输出
        2,
        80000,
        0
    );
}