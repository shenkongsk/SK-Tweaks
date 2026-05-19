#loader crafttweaker reloadable
import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "large_scale_chicken_farm_controller_make",
    "me_mythic_assembler",
    // inputs
    [
        <contenttweaker:adamantium_reinforced_petrified_wood>*64,
        <natura:overworld_planks:5>*4096,
        <contenttweaker:awakened_electromagnet>*64,
        <roost:roost>*16,
        <avaritiaitem:cosmic_balance>*1
    ],
    // fluid inputs
    [
        <liquid:evanescent_bifrost>*100000
    ],
    // outputs
    [<modularmachinery:large_scale_chicken_farm_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    3000, // 2.5 分钟
    800000,
    0
);