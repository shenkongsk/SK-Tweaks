#loader crafttweaker reloadable
//  机械源质输出
recipes.addShaped(<modularmachineryaddons:blockmeessentiaoutputbus>,
[[<modularmachinery:itemmodularium>, <forge:bucketfilled>.withTag({FluidName: "hint_of_divinity", Amount: 1000}), <modularmachinery:itemmodularium>],
[<contenttweaker:recursive_powder>, <modularmachinery:blockaspectprovideroutput>, <contenttweaker:recursive_powder>],
[<modularmachinery:itemmodularium>, <forge:bucketfilled>.withTag({FluidName: "hint_of_insanity", Amount: 1000}), <modularmachinery:itemmodularium>]]);
// 样板镜像
recipes.addShaped(<modularmachinery:blockmepatternmirrorimage>,[
	[<ore:ingotModularium>, <ore:ingotSednanite>, <ore:ingotModularium>], 
	[<modularmachinery:blockmepatternprovider>, <appliedenergistics2:material:1>, <modularmachinery:blockmepatternprovider>], 
	[<ore:ingotModularium>, <ore:ingotSednanite>, <ore:ingotModularium>]
	]);
// // tooltip
// <modularmachinery:blockmefluidinputbus>.addTooltip(format.gold("不放容量卡，缓存默认为2.1Gmb，加入容量卡来降低缓存"));
// <modularmachinery:blockmefluidoutputbus>.addTooltip(format.gold("不放容量卡，缓存默认为2.1Gmb，加入容量卡来降低缓存"));
// 创造源质原件 、
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