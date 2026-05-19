import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "quantum_catalytic_reactor_array_factory_controller_make",
    "me_mythic_assembler",
    // inputs
    [
        <contenttweaker:strange_matter_capsule>*16,
        <contenttweaker:defined_ingot>*32,
        <contenttweaker:defined_servo>*32,
        <contenttweaker:warren_rift>*32,
        <contenttweaker:nightmare_machine_case>*128,
        <contenttweaker:fifth_order_ascended_fractal>*64,
        <contenttweaker:monumentally_sentient_meatball>*1024,
        <contenttweaker:flerovium_matrix>*4096
    ],
    // fluid inputs
    [],
    // outputs
    [<modularmachinery:quantum_catalytic_reactor_array_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    24000, // 20 分钟
    5120000,
    0
);