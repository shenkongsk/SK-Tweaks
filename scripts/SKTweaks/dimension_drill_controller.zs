import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "dimension_drill_controller_make",
    "me_mythic_assembler",
    // inputs
    [
        <rftoolsdim:dimensional_blank_block>*4096,
        <extendedcrafting:singularity_custom:2012>*2,
        <techreborn:machine_frame:2>*64,
        <contenttweaker:cursed_meatballium_reinforced_casing>*16,
        <immersiveengineering:drillhead>*64,
        <contenttweaker:wrought_summoner>*8,
        <contenttweaker:imperfect_neutronium_nugget>*1

    ],
    // fluid inputs
    [],
    // outputs
    [<modularmachinery:dimension_drill_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    1000, // 50 秒
    1600000,
    0
);