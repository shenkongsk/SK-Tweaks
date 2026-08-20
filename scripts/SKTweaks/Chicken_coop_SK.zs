import mods.modularmachinery.RecipeBuilder;

val defined_chicken = RecipeBuilder.newBuilder("defined_chicken","mechanized_coop",480);
defined_chicken.addItemInput(<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:defined_chicken"}}));
defined_chicken.setChance(0.0);
defined_chicken.addItemOutput(<contenttweaker:defined_egg>*1);
defined_chicken.build();


scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "defined_chicken_make",
    "plasmatic_condenser",
    // inputs
    [
        <contenttweaker:defined_insanium_cluster>*32768,
        <contenttweaker:self_actualizing_warren_rift>*32,
        <avaritia:resource:5>*65536,
        <contenttweaker:imperfect_gallifreyan_alloy>*128,
    ],
    // fluid inputs
    [
        <liquid:dense_plasma>*2147483647
    ],
    // outputs
    [<chickens:spawn_egg>.withTag({ChickenType: {id: "contenttweaker:defined_chicken"}})],
    // fluid outputs
    [],
    // time, energy input, energy output
    200,
    0,
    0
);