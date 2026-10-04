#loader crafttweaker reloadable
import mods.modularmachinery.RecipeBuilder;
Recipe_Builder_SK(
    "brainline_controller_make",
    "creation_altar",
    // inputs
    [
        <modularmachinery:recursive_brain_in_a_vat_starvald_demelain_controller>,
        <openblocks:tank>.withTag({tank: {FluidName: "whisper_of_starvald_demelain", Amount: 16000}})*16,
        <opencomputers:component:11>*40960,
        <contenttweaker:infinite_processor>*16,
        <contenttweaker:living_case>*64

    ],
    // fluid inputs
    [
        <liquid:matter_of_creative_inquiry>*160000,
        <liquid:fractallite_halite>*14400,
        <liquid:darkstarlight>*100000
    ],
    // outputs
    [<modularmachinery:infinite_seeker_brain_in_a_vat_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    20, // 1sec
    2147483647,
    0
);