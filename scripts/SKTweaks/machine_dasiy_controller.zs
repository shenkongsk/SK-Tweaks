import mods.modularmachinery.RecipeBuilder;

scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "machine_daisy_controller_make",
    "me_mythic_assembler",
    // inputs
    [
        <contenttweaker:purity_offer>*1,
        <botania:specialflower>.withTag({type: "puredaisy"})*64,
        <extrabotany:blockorichalcos>*8,
        <contenttweaker:gaia_spirit_block>*8,
        <extrabotany:material:2>.withTag({ench: [{lvl: 5 as short, id: 1}, {lvl: 5 as short, id: 4}, {lvl: 5 as short, id: 3}, {lvl: 5 as short, id: 0}]})*1
    ],
    // fluid inputs
    [],
    // outputs
    [<modularmachinery:machine_daisy_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    1000, // 50 秒
    1600000,
    0
);