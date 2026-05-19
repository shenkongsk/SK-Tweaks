#loader crafttweaker reloadable
import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "large_scale_hypergrowth_insolator_make",
    "creation_altar",
    // inputs
    [
        <contenttweaker:slightly_dense_pebble>*4,
        <contenttweaker:hypergrowth_component>*16,
        <botania:blacklotus>*512,
        <environmentaltech:structure_frame_6>*64,
        <contenttweaker:cursed_meatballium_reinforced_casing>*32,
        <mysticalagriculture:growth_accelerator>*10240,
        <mysticalagradditions:stuff:69>*512,
        <avaritiaitem:cosmic_balance>*1
        
    ],
    // fluid inputs
    [
        <liquid:molten_insanium>*400000,
        <liquid:infinity>*50000
    ],
    // outputs
    [<modularmachinery:large_scale_hypergrowth_insolator_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    20000, // 1000秒
    900000,
    0
);