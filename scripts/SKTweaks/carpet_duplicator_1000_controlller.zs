#loader crafttweaker reloadable
import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "carpet_duplicator_1000_factory_controller_make",
    "me_mythic_assembler",
    // inputs
    [
        <divinerpg:rainbow_wool>*64,
        <minecraft:redstone>*64,
        <minecraft:redstone_torch>*64,
        <minecraft:comparator>*64,
        <minecraft:observer>*64,
        <modularmachinery:itemmodularium>*32
    ],
    // fluid inputs
    [
    ],
    // outputs
    [<modularmachinery:carpet_duplicator_1000_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    20, // 1sec
    10000,
    0
);