#loader crafttweaker reloadable
import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "infinite_recursive_factory_controller_make",
    "creation_altar",
    // inputs
    [
        <contenttweaker:tardis_polyp>*1,
        <contenttweaker:recursion_of_notbeinganoob>*1,
        <contenttweaker:recursion_of_worthiness>*1,
        <contenttweaker:ingot_of_infinite_wishes>*64,
        <contenttweaker:plate_clump_fractal>*32,
        <contenttweaker:infinite_processor>*16,
        <contenttweaker:cosmic_string_conduit>*8,
        <projectex:final_star_shard>*2048,
        <contenttweaker:galactic_power_unit>*1
    ],
    // fluid inputs
    [
        <liquid:whisper_of_starvald_demelain>*1000,
        <liquid:galactic_plasma>*1000000
    ],
    // outputs
    [<modularmachinery:infinite_recursive_factory_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    40000, //
    40960000,
    0
);
