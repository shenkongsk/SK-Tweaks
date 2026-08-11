// ======================================================================================
// 如果你真的想要使用这个超模功能，把下面所有代码取消注释即可
// If you really want to use this overpowered feature, just uncomment all the code below
// ======================================================================================

import crafttweaker.item.IItemStack;

recipes.remove(<modularmachinery:blockparallelcontroller:0>);
recipes.remove(<modularmachinery:blockparallelcontroller:1>);
recipes.remove(<modularmachinery:blockparallelcontroller:2>);
recipes.remove(<modularmachinery:blockparallelcontroller:3>);
recipes.remove(<modularmachinery:blockparallelcontroller:4>);

recipes.addShaped("parallelcontrollerx4",
    <modularmachinery:blockparallelcontroller:0>*4,
    [
        [<modularmachinery:blockcasing:4>,<nae2:coprocessor_4x>,<modularmachinery:blockcasing:4>],
        [<nae2:coprocessor_4x>,<ore:blockLudicrite>,<nae2:coprocessor_4x>],
        [<modularmachinery:blockcasing:4>,<nae2:coprocessor_4x>,<modularmachinery:blockcasing:4>]
    ]
);

// recipes.addShaped("parallelcontrollerx16",
//     <modularmachinery:blockparallelcontroller:1>,
//     [
//         [<modularmachinery:blockparallelcontroller:0>,<nae2:coprocessor_16x>,<modularmachinery:blockparallelcontroller:0>],
//         [<nae2:coprocessor_16x>,<contenttweaker:blue_matter>,<nae2:coprocessor_16x>],
//         [<modularmachinery:blockparallelcontroller:0>,<nae2:coprocessor_16x>,<modularmachinery:blockparallelcontroller:0>]
//     ]
// );

mods.extendedcrafting.TableCrafting.addShaped(3, <modularmachinery:blockparallelcontroller:1>*64, [
	[<contenttweaker:deepland_cap>, <contenttweaker:cursed_meatballium_reinforced_casing>, <extendedcrafting:singularity_custom:991>, <contenttweaker:creeponian_cap>, <extendedcrafting:singularity_custom:991>, <contenttweaker:cursed_meatballium_reinforced_casing>, <contenttweaker:deepland_cap>], 
	[<contenttweaker:cursed_meatballium_reinforced_casing>, <contenttweaker:abyssal_cap>, <contenttweaker:lelyetian_cap>, <contenttweaker:precasian_cap>, <contenttweaker:lelyetian_cap>, <contenttweaker:abyssal_cap>, <contenttweaker:cursed_meatballium_reinforced_casing>], 
	[<extendedcrafting:singularity_custom:991>, <contenttweaker:barathos_cap>, <cells:hyper_density_component:2>, <modularmachinery:blockparallelcontroller>, <cells:hyper_density_component:2>, <contenttweaker:barathos_cap>, <extendedcrafting:singularity_custom:991>], 
	[<contenttweaker:creeponian_cap>, <contenttweaker:precasian_cap>, <modularmachinery:blockparallelcontroller>, <appliedenergistics2:material:34>, <modularmachinery:blockparallelcontroller>, <contenttweaker:precasian_cap>, <contenttweaker:creeponian_cap>], 
	[<extendedcrafting:singularity_custom:991>, <contenttweaker:barathos_cap>, <cells:hyper_density_component:2>, <modularmachinery:blockparallelcontroller>, <cells:hyper_density_component:2>, <contenttweaker:barathos_cap>, <extendedcrafting:singularity_custom:991>], 
	[<contenttweaker:cursed_meatballium_reinforced_casing>, <contenttweaker:abyssal_cap>, <contenttweaker:lelyetian_cap>, <contenttweaker:precasian_cap>, <contenttweaker:lelyetian_cap>, <contenttweaker:abyssal_cap>, <contenttweaker:cursed_meatballium_reinforced_casing>], 
	[<contenttweaker:deepland_cap>, <contenttweaker:cursed_meatballium_reinforced_casing>, <extendedcrafting:singularity_custom:991>, <contenttweaker:creeponian_cap>, <extendedcrafting:singularity_custom:991>, <contenttweaker:cursed_meatballium_reinforced_casing>, <contenttweaker:deepland_cap>]
]);
// recipes.addShaped("parallelcontrollerx64",
//     <modularmachinery:blockparallelcontroller:2>,
//     [
//         [<modularmachinery:blockparallelcontroller:1>, <nae2:coprocessor_64x>, <modularmachinery:blockparallelcontroller:1>],
//         [<nae2:coprocessor_64x>, <contenttweaker:divine_star>, <nae2:coprocessor_64x>],
//         [<modularmachinery:blockparallelcontroller:1>, <nae2:coprocessor_64x>, <modularmachinery:blockparallelcontroller:1>]
//     ]
// );
mods.extendedcrafting.TableCrafting.addShaped(4, <modularmachinery:blockparallelcontroller:2>*64, [
	[null, <modularmachinery:blockparallelcontroller>, <glassential:glass_light>, <glassential:glass_light>, <forge:bucketfilled>.withTag({FluidName: "californium_252_fluoride_flibe", Amount: 1000}), <glassential:glass_light>, <glassential:glass_light>, <modularmachinery:blockparallelcontroller>, null], 
	[<modularmachinery:blockparallelcontroller>, <contenttweaker:recursion_of_notbeinganoob>, <contenttweaker:prophetic_paper>, <contenttweaker:prophetic_paper>, <contenttweaker:fifth_order_ascended_fractal>, <contenttweaker:prophetic_paper>, <contenttweaker:prophetic_paper>, <contenttweaker:recursion_of_notbeinganoob>, <modularmachinery:blockparallelcontroller>], 
	[<glassential:glass_light>, <contenttweaker:prophetic_paper>, <extendedcrafting:singularity_ultimate>, <contenttweaker:cuendillar_plate>, <contenttweaker:defined_engine>, <contenttweaker:cuendillar_plate>, <extendedcrafting:singularity_ultimate>, <contenttweaker:prophetic_paper>, <glassential:glass_light>], 
	[<glassential:glass_light>, <contenttweaker:prophetic_paper>, <contenttweaker:cuendillar_plate>, <modularmachinery:blockparallelcontroller:1>, <ore:blockInfinity>, <modularmachinery:blockparallelcontroller:1>, <contenttweaker:cuendillar_plate>, <contenttweaker:prophetic_paper>, <glassential:glass_light>], 
	[<forge:bucketfilled>.withTag({FluidName: "californium_252_fluoride_flibe", Amount: 1000}), <contenttweaker:fifth_order_ascended_fractal>, <contenttweaker:defined_engine>, <ore:blockInfinity>, <contenttweaker:fractallite_furnace_core>, <ore:blockInfinity>, <contenttweaker:defined_engine>, <contenttweaker:fifth_order_ascended_fractal>, <forge:bucketfilled>.withTag({FluidName: "californium_252_fluoride_flibe", Amount: 1000})], 
	[<glassential:glass_light>, <contenttweaker:prophetic_paper>, <contenttweaker:cuendillar_plate>, <modularmachinery:blockparallelcontroller:1>, <ore:blockInfinity>, <modularmachinery:blockparallelcontroller:1>, <contenttweaker:cuendillar_plate>, <contenttweaker:prophetic_paper>, <glassential:glass_light>], 
	[<glassential:glass_light>, <contenttweaker:prophetic_paper>, <extendedcrafting:singularity_ultimate>, <contenttweaker:cuendillar_plate>, <contenttweaker:defined_engine>, <contenttweaker:cuendillar_plate>, <extendedcrafting:singularity_ultimate>, <contenttweaker:prophetic_paper>, <glassential:glass_light>], 
	[<modularmachinery:blockparallelcontroller>, <contenttweaker:recursion_of_notbeinganoob>, <contenttweaker:prophetic_paper>, <contenttweaker:prophetic_paper>, <contenttweaker:fifth_order_ascended_fractal>, <contenttweaker:prophetic_paper>, <contenttweaker:prophetic_paper>, <contenttweaker:recursion_of_notbeinganoob>, <modularmachinery:blockparallelcontroller>], 
	[null, <modularmachinery:blockparallelcontroller>, <glassential:glass_light>, <glassential:glass_light>, <forge:bucketfilled>.withTag({FluidName: "californium_252_fluoride_flibe", Amount: 1000}), <glassential:glass_light>, <glassential:glass_light>, <modularmachinery:blockparallelcontroller>, null]
]);

// recipes.addShaped("parallelcontrollerx256",
//     <modularmachinery:blockparallelcontroller:3>,
//     [
//         [<modularmachinery:blockparallelcontroller:2>,<nae2:coprocessor_64x>,<modularmachinery:blockparallelcontroller:2>],
//         [<nae2:coprocessor_64x>,<threng:material:6>,<nae2:coprocessor_64x>],
//         [<modularmachinery:blockparallelcontroller:2>,<nae2:coprocessor_64x>,<modularmachinery:blockparallelcontroller:2>]
//     ]
// );
// recipes.addShaped("parallelcontrollerx512",
//     <modularmachinery:blockparallelcontroller:4>,
//     [
//         [<modularmachinery:blockparallelcontroller:3>,<projectex:matter:11>,<modularmachinery:blockparallelcontroller:3>],
//         [<projectex:matter:11>,<contenttweaker:innerved_sky_stone>  ,<projectex:matter:11>],
//         [<modularmachinery:blockparallelcontroller:3>,<projectex:matter:11>,<modularmachinery:blockparallelcontroller:3>]
//     ]
// );
<modularmachinery:blockparallelcontroller:4>.addTooltip(format.gold("说真的，为什么你需要这个"));