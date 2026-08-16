import mods.modularmachinery.RecipeBuilder;
import crafttweaker.item.IItemStack;


var mmce_recipe_remove as IItemStack[]=[
    <mmceaddition:me_async_item_output_bus>,
    <mmceaddition:me_async_fluid_output_hatch>,
    <mmceaddition:me_pattern_assembly>,
    <mmceaddition:me_output_assembly>,
    <mmceaddition:virtual_assembler>,
    <mmceaddition:virtual_parallel_hatch>
];
for i in mmce_recipe_remove{
	recipes.remove(i);
}
// 物品输出总成
recipes.addShaped("SK_me_async_item_output_bus",<mmceaddition:me_async_item_output_bus>, [
	[<cells:overclocked_processor:1>, <cells:overclocked_processor:2>, <cells:overclocked_processor:1>], 
	[<cells:overclocked_processor:2>, <modularmachinery:blockmeitemoutputbus>, <cells:overclocked_processor:2>], 
	[<cells:overclocked_processor:1>, <cells:overclocked_processor:2>, <cells:overclocked_processor:1>]
]);
// 流体输出总成
recipes.addShaped("SK_me_async_fluid_output_hatch",<mmceaddition:me_async_fluid_output_hatch>, [
	[<cells:overclocked_processor:1>, <cells:overclocked_processor:2>, <cells:overclocked_processor:1>], 
	[<cells:overclocked_processor:2>, <modularmachinery:blockmefluidoutputbus>, <cells:overclocked_processor:2>], 
	[<cells:overclocked_processor:1>, <cells:overclocked_processor:2>, <cells:overclocked_processor:1>]
]);
// ME输出总成
recipes.addShaped("SK_me_output_assembly",<mmceaddition:me_output_assembly>, [
	[<modularmachinery:blockcasing:4>, <mmceaddition:me_async_fluid_output_hatch>, <modularmachinery:blockcasing:4>], 
	[<mmceaddition:me_async_item_output_bus>, <contenttweaker:singular_spatial_processor>, <mmceaddition:me_async_item_output_bus>], 
	[<modularmachinery:blockcasing:4>, <mmceaddition:me_async_fluid_output_hatch>, <modularmachinery:blockcasing:4>]
]);
// 样板总成
recipes.addShaped("SK_me_pattern_assembly",<mmceaddition:me_pattern_assembly>, [
	[<contenttweaker:everwondering_megelium>, <contenttweaker:infinite_loving_plate>, <contenttweaker:everwondering_megelium>], 
	[<contenttweaker:infinite_loving_plate>, <modularmachinery:blockmepatternprovider>, <contenttweaker:infinite_loving_plate>], 
	[<contenttweaker:everwondering_megelium>, <contenttweaker:infinite_loving_plate>, <contenttweaker:everwondering_megelium>]
]);
// 虚拟并行仓
recipes.addShaped("SK_virtual_parallel_hatch",<mmceaddition:virtual_parallel_hatch>*2, [
	[<ore:plateIron>, <appliedenergistics2:creative_energy_cell>, <ore:plateIron>], 
	[<appliedenergistics2:creative_energy_cell>, <modularmachinery:blockparallelcontroller>, <appliedenergistics2:creative_energy_cell>], 
	[<ore:plateIron>, <appliedenergistics2:creative_energy_cell>, <ore:plateIron>]
]);
// 虚拟装配器
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "SK_virtual_assembler_make",
    "me_mythic_assembler",
    // inputs
    [
        <threng:big_assembler:4>*64,
        <threng:big_assembler>*128,
        <ae2enhanced:virtual_parallel_card>.withTag({Tier: 0})*32,
        <ae2enhanced:stable_spacetime_manifold>*32,
        <ae2enhanced:differential_form_stabilizer>*32,
        <ae2enhanced:computation_core>*32,
    ],
    // fluid inputs
    [
        <liquid:short.mead>*32000,
        <liquid:mirion>*32000,
        <liquid:stellar_alloy>*32000,
        <liquid:vivid_alloy>*32000
    ],
    // outputs
    [<mmceaddition:virtual_assembler>],
    // fluid outputs
    [],
    // time, energy input, energy output
    600, // 30 秒
    800000,
    0
);