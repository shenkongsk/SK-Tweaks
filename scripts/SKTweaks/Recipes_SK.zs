#loader crafttweaker reloadable


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
recipes.addShaped(<modularmachinery:blockmepatternmirrorimage>,
	[
	[<ore:ingotModularium>, <ore:ingotSednanite>, <ore:ingotModularium>], 
	[<modularmachinery:blockmepatternprovider>, <appliedenergistics2:material:1>, <modularmachinery:blockmepatternprovider>], 
	[<ore:ingotModularium>, <ore:ingotSednanite>, <ore:ingotModularium>]
	]
);
// 智能数据接口
recipes.addShaped(<modularmachinery:blocksmartinterface>,
	[
	[<modularmachinery:blockcasing>, <appliedenergistics2:material:47>, <modularmachinery:blockcasing>], 
	[<appliedenergistics2:material:22>, <appliedenergistics2:material:23>, <appliedenergistics2:material:24>], 
	[<modularmachinery:blockcasing>, <appliedenergistics2:material:47>, <modularmachinery:blockcasing>]
	]
);
// =====================================================================================================
// 工作台合成	↑
// =====================================================================================================



// =====================================================================================================
// 多方块合成	↓
// =====================================================================================================
// 创造源质原件 
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
	"creative_essense_cell_make",
	"creation_altar",
	[
		<contenttweaker:stone_of_aura>*64,
		<extendedcrafting:singularity_ultimate>*64,
		<cells:hyper_density_component:5>,
		<contenttweaker:self_actualizing_warren_rift>
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
// =====================================================================================================
// 多方块合成	↑
// =====================================================================================================