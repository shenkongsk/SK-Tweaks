import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "auto_altar_controller_make",
    "me_mythic_assembler",
    // inputs
    [
        <botania:storage>*640,
        <contenttweaker:gaia_spirit_block>*64,
        <contenttweaker:greater_gaia_spirit>*8,
        <extrabotany:gildedmashedpotato>*64,
        <extrabotany:material:5>*4,
        <extrabotany:material:8>*4,
        <contenttweaker:innerved_sky_stone>*8
    ],
    // fluid inputs
    [
        <liquid:terrasteel>*11451400
    ],
    // outputs
    [<modularmachinery:auto_altar_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    4000,
    25600000,
    0
);