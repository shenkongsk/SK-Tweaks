import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "meatballium_crucible_controller_make",
    "me_mythic_assembler",
    // inputs
    [
        <nuclearcraft:salt_fission_controller>*4,
        <contenttweaker:cursed_meatballium_reinforced_casing>*64,
        <contenttweaker:mythic_machine_case>*16,
        <nuclearcraft:salt_fission_wall>*64,
        <contenttweaker:lefhm_fuel>*64,
        <nuclearcraft:turbine_rotor_bearing>*64,
        <extendedcrafting:singularity_custom:2037>*1,
        <contenttweaker:arc_reactor_coil>*64

    ],
    // fluid inputs
    [
        <liquid:meatballium>*16000,
        <liquid:pyrotheum>*6400000,
    ],
    // outputs
    [<modularmachinery:meatballium_crucible_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    12000, // 10 分钟
    1280000,
    0
);