import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "alfheim_portal_controller",
    "me_mythic_assembler",
    // inputs
    [
        <contenttweaker:mythic_machine_case>*16,
        <botania:alfheimportal>*64,
        <extrabotany:spiritfuel>*4096,
        <extrabotany:nightmarefuel>*4096,
        <extrabotany:material:5>*64,
        <extrabotany:material:8>*64,
        <extrabotany:quantummanabuffer>*8,
        <contenttweaker:greater_mana_core>*512,
        <extendedcrafting:material:32>*4,
        <contenttweaker:mythic_excavation_computer>*8

    ],
    // fluid inputs
    [],
    // outputs
    [<modularmachinery:alfheim_portal_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    12000, // 10 分钟
    1280000,
    0
);