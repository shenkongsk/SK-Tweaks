import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "auto_thaumatorium_comtroller_make",
    "me_mythic_assembler",
    // inputs
    [
        <contenttweaker:infused_rhenium_ingot>*64,
        <extendedcrafting:singularity_custom:666>,
        <contenttweaker:warped_stone>*4,
        <contenttweaker:phasing_alloy_plate>*16,
        <contenttweaker:depleted_radiant_fissile_alloy>*64,
        <contenttweaker:radiant_meatballium_reinforced_casing>*4
    ],
    // fluid inputs
    [
        <liquid:liquid_death>*4096000
    ],
    // outputs
    [<modularmachinery:auto_thaumatorium_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    4000,
    25600000,
    0
);