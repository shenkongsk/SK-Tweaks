import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "draconic_mythical_infusion_factory_controller",
    "me_mythic_assembler",
    // inputs
    [
        <modularmachinery:small_draconic_mythical_infusion_controller>*64,
        <contenttweaker:vibranium_alloy_cluster>*64,
        <contenttweaker:ascended_draconic_alloy>*128,
        <contenttweaker:energetic_draconium_ingot>*10240,
        <draconicevolution:chaos_shard>*256,
        <draconicevolution:draconium_block:1>*64,
        <draconicevolution:draconic_energy_core>*4096,
        <draconicevolution:reactor_component>*8,
        <contenttweaker:perfected_gem_of_the_cosmos>*1
    ],
    // fluid inputs
    [
        <liquid:molten_awakened>*40960000
    ],
    // outputs
    [<modularmachinery:draconic_mythical_infusion_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    8000,
    12800000,
    0
);
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "small_draconic_mythical_infusion_controller",
    "me_mythic_assembler",
    // inputs
    [
        <draconicevolution:fusion_crafting_core>*1,
        <divinerpg:eden_block>*32,
        <contenttweaker:eden_star>*64,
        <extendedcrafting:material:19>*16,
        <contenttweaker:first_order_mythic_fractal>
    ],
    // fluid inputs
    [
        <liquid:molten_awakened>*10000
    ],
    // outputs
    [<modularmachinery:small_draconic_mythical_infusion_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    2000,
    6400000,
    0
);