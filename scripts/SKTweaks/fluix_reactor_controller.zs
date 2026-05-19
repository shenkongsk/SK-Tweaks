import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "fluix_reactor_controller",
    "me_mythic_assembler",
    // inputs
    [
        <appliedenergistics2:material:22>*4096,
        <appliedenergistics2:material:23>*4096,
        <appliedenergistics2:material:24>*4096,
        <nae2:material:8>*16,
        <appliedenergistics2:quartz_growth_accelerator>*1024,
        <extendedcrafting:material:12>*256

    ],
    // fluid inputs
    [],
    // outputs
    [<modularmachinery:fluix_reactor_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    1000, // 50 秒
    1600000,
    0
);