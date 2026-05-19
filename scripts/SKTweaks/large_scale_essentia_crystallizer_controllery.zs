#loader crafttweaker reloadable
import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "large_scale_essentia_crystallizer_controller_make",
    "creation_altar",
    // inputs
    [
        <contenttweaker:slightly_dense_pebble>*4,
        <contenttweaker:stone_of_aura>*1,
        <environmentaltech:structure_frame_6>*64,
        <contenttweaker:cursed_meatballium_reinforced_casing>*32,
        <contenttweaker:superconducting_mithril>*64,
        
    ],
    // fluid inputs
    [
        <liquid:pristine_aura>*32000,
        <liquid:astralsorcery.liquidstarlight>*320000
    ],
    // outputs
    [<modularmachinery:large_scale_essentia_crystallizer_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    10000, // 500秒
    900000,
    0
);