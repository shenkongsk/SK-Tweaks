import mods.modularmachinery.RecipeBuilder;

scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "mythical_generator_first_order_controller",
    "me_mythic_assembler",
    // inputs
    [
        <contenttweaker:high_strength_transmission>*4,
        <contenttweaker:mythic_coil_t1>*8,
        <contenttweaker:eden_core>*64,
        <contenttweaker:dark_soul_machine_chassis>*32,
        <contenttweaker:recursive_powder>*65536,
        <extendedcrafting:singularity_custom:1001>*1,
        <extendedcrafting:singularity_custom:1002>*1,
        <extendedcrafting:singularity_custom:1003>*1,
        <extendedcrafting:singularity_custom:1004>*1,
        <extendedcrafting:singularity_custom:1005>*1,
        <extendedcrafting:singularity_custom:1006>*1

    ],
    // fluid inputs
    [],
    // outputs
    [<modularmachinery:mythical_generator_first_order_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    1000, // 50 秒
    1600000,
    0
);