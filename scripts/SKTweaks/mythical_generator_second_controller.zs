import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "second_order_fluid_controller_make",
    "me_mythic_assembler",
    // inputs
    [
        <contenttweaker:summoning_computer>*2,
        <contenttweaker:mythic_excavation_engine>*8,
        <contenttweaker:mythic_coil_t2>*64,
        <contenttweaker:wildwood_core>*512,
        <contenttweaker:adamantium_plate>*256,
        <contenttweaker:recursive_powder>*1310720,
        <extendedcrafting:singularity_custom:1014>*1,
        <extendedcrafting:singularity_custom:1013>*1,
        <extendedcrafting:singularity_custom:1012>*1,
        <extendedcrafting:singularity_custom:1011>*1,
        <extendedcrafting:singularity_custom:1010>*1,
        <extendedcrafting:singularity_custom:1009>*1,
        <extendedcrafting:singularity_custom:1008>*1,
        <extendedcrafting:singularity_custom:1007>*1

    ],
    // fluid inputs
    [],
    // outputs
    [<modularmachinery:mythical_generator_second_order_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    12000, // 10 分钟
    1280000,
    0
);