import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "dream_energy_core_make",
    "me_mythic_assembler",
    // inputs
    [
        <draconicevolution:energy_storage_core>*1,
        <actuallyadditions:item_misc:19>*64,
        <contenttweaker:terrasteel_crystal>*32,
        <extrabotany:material:7>*64,
        <extrabotany:spiritfuel>*640,
        <contenttweaker:bloodmaster_block>*1024,
        <contenttweaker:spinel_ring>*256
    ],
    // fluid inputs
    [
        <liquid:eternal_dragon_fire>*32768000
    ],
    // outputs
    [<modularmachinery:dream_energy_core_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    4000,
    2560000000,
    0
);