#loader crafttweaker reloadable
import scripts.SKTweaks.lib.aaa_function;

// =====================================================================================================
// 工作台合成	↓
// =====================================================================================================
// 机械源质输出
recipes.addShaped(<modularmachineryaddons:blockmeessentiaoutputbus>,
	[
	[<modularmachinery:itemmodularium>, <forge:bucketfilled>.withTag({FluidName: "hint_of_divinity", Amount: 1000}), <modularmachinery:itemmodularium>],
	[<contenttweaker:recursive_powder>, <modularmachinery:blockaspectprovideroutput>, <contenttweaker:recursive_powder>],
	[<modularmachinery:itemmodularium>, <forge:bucketfilled>.withTag({FluidName: "hint_of_insanity", Amount: 1000}), <modularmachinery:itemmodularium>]
	]
);
// 样板镜像
// recipes.addShaped(<modularmachinery:blockmepatternmirrorimage>,
// 	[
// 	[<ore:ingotModularium>, <ore:ingotSednanite>, <ore:ingotModularium>], 
// 	[<modularmachinery:blockmepatternprovider>, <appliedenergistics2:material:1>, <modularmachinery:blockmepatternprovider>], 
// 	[<ore:ingotModularium>, <ore:ingotSednanite>, <ore:ingotModularium>]
// 	]
// );
// 智能数据接口
recipes.addShaped(<modularmachinery:blocksmartinterface>,
	[
	[<modularmachinery:blockcasing>, <appliedenergistics2:material:47>, <modularmachinery:blockcasing>], 
	[<appliedenergistics2:material:22>, <appliedenergistics2:material:23>, <appliedenergistics2:material:24>], 
	[<modularmachinery:blockcasing>, <appliedenergistics2:material:47>, <modularmachinery:blockcasing>]
	]
);
// 维度仓
recipes.addShaped(<modularmachineryaddons:blockdimensionproviderinput>, [
	[<modularmachinery:blockcasing:4>, <contenttweaker:wormhole_field_module>, <modularmachinery:blockcasing:4>], 
	[<contenttweaker:wormhole_field_module>, <draconicevolution:celestial_manipulator>, <contenttweaker:wormhole_field_module>], 
	[<modularmachinery:blockcasing:4>, <contenttweaker:wormhole_field_module>, <modularmachinery:blockcasing:4>]
]);
// 平衡机械外壳增产
mods.extendedcrafting.TableCrafting.addShaped(4, <contenttweaker:balanced_machine_casing>*32, [
	[<contenttweaker:hungering_machine_case>, <contenttweaker:hungering_machine_case>, <minecraft:bedrock>, <minecraft:bedrock>, <minecraft:bedrock>, <minecraft:bedrock>, <minecraft:bedrock>, <contenttweaker:hungering_machine_case>, <contenttweaker:hungering_machine_case>], 
	[<contenttweaker:hungering_machine_case>, <contenttweaker:ascended_spatial_chassis>, <contenttweaker:cuendillar_seal>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:cuendillar_seal>, <contenttweaker:ascended_spatial_chassis>, <contenttweaker:hungering_machine_case>], 
	[<minecraft:bedrock>, <contenttweaker:cuendillar_seal>, <contenttweaker:etherium_plate>, <contenttweaker:everburner>, <contenttweaker:everburner>, <contenttweaker:everburner>, <contenttweaker:etherium_plate>, <contenttweaker:cuendillar_seal>, <minecraft:bedrock>], 
	[<minecraft:bedrock>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:everburner>, <contenttweaker:etherium_plate>, <contenttweaker:hyperuranon_actualizing_fabrial>, <contenttweaker:etherium_plate>, <contenttweaker:everburner>, <contenttweaker:stone_of_universal_balance>, <minecraft:bedrock>], 
	[<minecraft:bedrock>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:everburner>, <contenttweaker:hyperuranon_actualizing_fabrial>, <contenttweaker:unleashed_star_ingot>, <contenttweaker:hyperuranon_actualizing_fabrial>, <contenttweaker:everburner>, <contenttweaker:stone_of_universal_balance>, <minecraft:bedrock>], 
	[<minecraft:bedrock>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:everburner>, <contenttweaker:etherium_plate>, <contenttweaker:hyperuranon_actualizing_fabrial>, <contenttweaker:etherium_plate>, <contenttweaker:everburner>, <contenttweaker:stone_of_universal_balance>, <minecraft:bedrock>], 
	[<minecraft:bedrock>, <contenttweaker:cuendillar_seal>, <contenttweaker:etherium_plate>, <contenttweaker:everburner>, <contenttweaker:everburner>, <contenttweaker:everburner>, <contenttweaker:etherium_plate>, <contenttweaker:cuendillar_seal>, <minecraft:bedrock>], 
	[<contenttweaker:hungering_machine_case>, <contenttweaker:ascended_spatial_chassis>, <contenttweaker:cuendillar_seal>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:cuendillar_seal>, <contenttweaker:ascended_spatial_chassis>, <contenttweaker:hungering_machine_case>], 
	[<contenttweaker:hungering_machine_case>, <contenttweaker:hungering_machine_case>, <minecraft:bedrock>, <minecraft:bedrock>, <minecraft:bedrock>, <minecraft:bedrock>, <minecraft:bedrock>, <contenttweaker:hungering_machine_case>, <contenttweaker:hungering_machine_case>]
]);
// 升级总线
recipes.addShaped("upgradebus_1",<modularmachinery:blockupgradebus>, [
	[<modularmachinery:blockcasing:4>, <ore:plateSedna>, <modularmachinery:blockcasing:4>], 
	[<ore:plateSedna>, <forge:bucketfilled>.withTag({FluidName: "erbium", Amount: 1000}), <ore:plateSedna>], 
	[<modularmachinery:blockcasing:4>, <ore:plateSedna>, <modularmachinery:blockcasing:4>]
]);

// =====================================================================================================
// 工作台合成	↑
// =====================================================================================================



// =====================================================================================================
// 多方块合成	↓
// =====================================================================================================
// 创造源质原件 
aaa_function.Recipe_Builder_SK(
	"creative_essense_cell_make",
	"creation_altar",
	[
		<contenttweaker:stone_of_aura>*64,
		<extendedcrafting:singularity_ultimate>*64,
		<cells:hyper_density_component:5>,
		<contenttweaker:self_actualizing_warren_rift>,
		<appliedenergistics2:material:39>*1
	],
	[
		<liquid:darkstarlight>*16000,
		<liquid:sacrificial_essence>*16000,
		<liquid:strange_matter>*16000,
		<liquid:pristine_aura>*16000
	],
	[
		<thaumicenergistics:essentia_cell_creative>
	],
	[],
	20000,
	8000000,
	0
);
// 以太金属板
aaa_function.Recipe_Builder_SK(
	"etherium_plate_make",
	"mythic_processor_compactor",
	[
		<contenttweaker:etherium_ingot>*16
	],
	[],
	[
		<contenttweaker:etherium_plate>*16
	],
	[],
	2,
	60000,
	0
);
// 解缚恒星锭
aaa_function.Recipe_Builder_SK(
	"unleashed_star_ingot_make",
	"fractallite_furnace",
	[
		<contenttweaker:eternal_glory>*1,
		<contenttweaker:trinity_ingot>*1,
		<botania:brewflask>.withTag({brewKey: "warpWard"})*1,
		<contenttweaker:star_core>*4,
		<contenttweaker:ingot_of_shadesmar>*16,
		<contenttweaker:sunstruck_gem>*64
		
	],
	[
		<liquid:black_hole_juice>*10
	],
	[
		<contenttweaker:eternal_glory>*1,
		<contenttweaker:unleashed_star_ingot>*4
	],
	[],
	600,
	0,
	0
);
// 无限水和无限熔岩原件
val infinite_water_cell = <cells:creative_fluid_cell>.withTag({CreativeFluidFilters: [{FluidName: "water", Amount: 1}], display: {Name: "§b无限水原件", Lore: ["§f感觉不如水槽......", "§8但是，这个提供的水更多"]}});
val infinite_lava_cell = <cells:creative_fluid_cell>.withTag({CreativeFluidFilters: [{FluidName: "lava", Amount: 1}], display: {Name: "§c无限熔岩原件", Lore: ["§c§m感觉不如机械动力......"]}});
aaa_function.Recipe_Builder_SK(
	"infinite_water_cell_make",
	"creation_altar",
	[
		<projecte:item.pe_evertide_amulet>*1,
		<contenttweaker:alchemical_particle>*64,
		<cells:hyper_density_fluid_component:5>*1,
		<appliedenergistics2:material:39>*1
	],
	[
	],
	[
		infinite_water_cell
	],
	[],
	200,
	800000,
	0
);
aaa_function.Recipe_Builder_SK(
	"infinite_lava_cell_make",
	"creation_altar",
	[
		<projecte:item.pe_volcanite_amulet>*1,
		<contenttweaker:alchemical_particle>*64,
		<cells:hyper_density_fluid_component:5>*1,
		<appliedenergistics2:material:39>*1
	],
	[
	],
	[
		infinite_lava_cell
	],
	[],
	200,
	800000,
	0
);

// =====================================================================================================
// 多方块合成	↑
// =====================================================================================================