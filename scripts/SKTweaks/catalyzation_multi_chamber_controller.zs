#loader crafttweaker reloadable
import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "catalyzation_multi_chamber_make",
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
        <liquid:cryotheum>*64000,
        <liquid:water>*1600000
    ],
    // outputs
    [<modularmachinery:catalyzation_multi_chamber_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    6000, // 5 分钟
    800000,
    0
);