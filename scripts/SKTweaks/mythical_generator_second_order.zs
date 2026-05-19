import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK_Chance(
    "second_order_fluid",
    "mythical_generator_second_order",
    // inputs - chances
    [
        
        <contenttweaker:second_order_mythic_fractal>,
        <contenttweaker:recursion_fragment_vox>*2,
        <contenttweaker:recursion_fragment_mysterium>*2,
        <contenttweaker:recursion_fragment_candyland>*2,
        <contenttweaker:recursion_fragment_haven>*2,
        <contenttweaker:recursion_fragment_iromine>*2,
        <contenttweaker:recursion_fragment_celeve>*2,
        <contenttweaker:recursion_fragment_gardencia>*2,
        <contenttweaker:recursion_fragment_crystevia>*2
    ],
    [0.2],
    // fluid inputs - chances
    [],
    [],
    // outputs - chances
    [],
    [],
    // fluid outputs - chances
    [        
        <liquid:ethereal_fabric>*16000,
        <liquid:liquid_madness>*16000,
        <liquid:milkiest_chocolate>*16000,
        <liquid:astral_water>*16000,
        <liquid:alchemical_goo>*16000,
        <liquid:ghostly_matter>*16000,
        <liquid:liquid_life>*16000,
        <liquid:seared_grave_stone>*16000
        // 共8种流体输出，每种16000mb
    ],
    [
        0.7,0.7,0.7,0.7,0.7,0.7,0.7,0.7
    ],
    // time, energy input, energy output
    2000,
    160000,
    0
);