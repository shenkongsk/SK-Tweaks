import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK_Chance(
    "first_order_fluid",
    "mythical_generator_first_order",
    // inputs - chances
    [
        <contenttweaker:first_order_mythic_fractal>,
        <contenttweaker:recursion_fragment_precasia>*2,
        <contenttweaker:recursion_fragment_abyss>*2,
        <contenttweaker:recursion_fragment_lelyetia>*2,
        <contenttweaker:recursion_fragment_deeplands>*2,
        <contenttweaker:recursion_fragment_creeponia>*2,
        <contenttweaker:recursion_fragment_barathos>*2
    ],
    [0.25],
    // fluid inputs - chances
    [],
    [],
    // outputs - chances
    [],
    [],
    // fluid outputs - chances
    [
        <liquid:spicy_pyrotheum>*16000,
        <liquid:lving_gold_nak>*16000,
        <liquid:dragons_blood_plastic>*16000,
        <liquid:aerial_moonshine>*16000,
        <liquid:weakened_cryotheoum>*16000,
        <liquid:luminous_lava>*16000
    ],
    [
        0.5,0.5,0.5,0.5,0.5,0.5
    ],
    // time, energy input, energy output
    2000,
    160000,
    0
);