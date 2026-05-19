import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "machine_mana_pool_controller_make",
    "me_mythic_assembler",
    // inputs
    [
        <contenttweaker:wildwood_refined_gem>*1,
        <botania:manaresource>*1024,
        <extrabotany:blockorichalcos>*8,
        <botania:pool:3>*64,
        <contenttweaker:mythic_machine_case>*8,
        <contenttweaker:greater_mana_core>*64,
        <botania:livingrock>*40960
    ],
    // fluid inputs
    [],
    // outputs
    [<modularmachinery:machine_mana_pool_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    12000, // 10 分钟
    1280000,
    0
);