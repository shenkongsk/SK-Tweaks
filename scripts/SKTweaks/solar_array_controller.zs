import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "solar_array_controller_make",
    "me_mythic_assembler",
    // inputs
    [
        <contenttweaker:arc_residue>*1024,
        <aether_legacy:zanite_gemstone>*10240,
        <actuallyadditions:block_furnace_solar>*1024,
        <advancedrocketry:satellitepowersource:1>*16384,
        <contenttweaker:mythic_machine_case>*64,
        <draconicevolution:draconic_energy_core>*64,
        <extendedcrafting:material:13>*8,
    ],
    // fluid inputs
    [
        <liquid:cryotheum>*1600000,
        <liquid:pyrotheum>*1600000,
        <liquid:evanescent_bifrost>*160000
    ],
    // outputs
    [<modularmachinery:solar_array_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    12000, // 10 分钟
    1280000,
    0
);