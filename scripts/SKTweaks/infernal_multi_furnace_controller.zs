#loader crafttweaker reloadable
import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "infernal_furnace_controller_make",
    "me_mythic_assembler",
    // inputs
    [
        <contenttweaker:tsleu_235_fuel>*256,
        <minecraft:netherbrick>*40960,
        <enderio:block_reinforced_obsidian>*256,
        <thaumicaugmentation:material:5>*32,
        <contenttweaker:spinel_ring>*4

    ],
    // fluid inputs
    [
        <liquid:molten_netherite>*64000,
        <liquid:lava>*1600000
    ],
    // outputs
    [<modularmachinery:infernal_multi_furnace_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    6000, // 5 分钟
    800000,
    0
);