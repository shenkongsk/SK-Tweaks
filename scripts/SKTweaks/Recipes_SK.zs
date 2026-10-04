#loader crafttweaker reloadable
import mods.modularmachinery.RecipeBuilder;
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
// mods.extendedcrafting.TableCrafting.addShaped(4, <contenttweaker:balanced_machine_casing>*32, [
// 	[<contenttweaker:hungering_machine_case>, <contenttweaker:hungering_machine_case>, <minecraft:bedrock>, <minecraft:bedrock>, <minecraft:bedrock>, <minecraft:bedrock>, <minecraft:bedrock>, <contenttweaker:hungering_machine_case>, <contenttweaker:hungering_machine_case>], 
// 	[<contenttweaker:hungering_machine_case>, <contenttweaker:ascended_spatial_chassis>, <contenttweaker:cuendillar_seal>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:cuendillar_seal>, <contenttweaker:ascended_spatial_chassis>, <contenttweaker:hungering_machine_case>], 
// 	[<minecraft:bedrock>, <contenttweaker:cuendillar_seal>, <contenttweaker:etherium_plate>, <contenttweaker:everburner>, <contenttweaker:everburner>, <contenttweaker:everburner>, <contenttweaker:etherium_plate>, <contenttweaker:cuendillar_seal>, <minecraft:bedrock>], 
// 	[<minecraft:bedrock>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:everburner>, <contenttweaker:etherium_plate>, <contenttweaker:hyperuranon_actualizing_fabrial>, <contenttweaker:etherium_plate>, <contenttweaker:everburner>, <contenttweaker:stone_of_universal_balance>, <minecraft:bedrock>], 
// 	[<minecraft:bedrock>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:everburner>, <contenttweaker:hyperuranon_actualizing_fabrial>, <contenttweaker:unleashed_star_ingot>, <contenttweaker:hyperuranon_actualizing_fabrial>, <contenttweaker:everburner>, <contenttweaker:stone_of_universal_balance>, <minecraft:bedrock>], 
// 	[<minecraft:bedrock>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:everburner>, <contenttweaker:etherium_plate>, <contenttweaker:hyperuranon_actualizing_fabrial>, <contenttweaker:etherium_plate>, <contenttweaker:everburner>, <contenttweaker:stone_of_universal_balance>, <minecraft:bedrock>], 
// 	[<minecraft:bedrock>, <contenttweaker:cuendillar_seal>, <contenttweaker:etherium_plate>, <contenttweaker:everburner>, <contenttweaker:everburner>, <contenttweaker:everburner>, <contenttweaker:etherium_plate>, <contenttweaker:cuendillar_seal>, <minecraft:bedrock>], 
// 	[<contenttweaker:hungering_machine_case>, <contenttweaker:ascended_spatial_chassis>, <contenttweaker:cuendillar_seal>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:cuendillar_seal>, <contenttweaker:ascended_spatial_chassis>, <contenttweaker:hungering_machine_case>], 
// 	[<contenttweaker:hungering_machine_case>, <contenttweaker:hungering_machine_case>, <minecraft:bedrock>, <minecraft:bedrock>, <minecraft:bedrock>, <minecraft:bedrock>, <minecraft:bedrock>, <contenttweaker:hungering_machine_case>, <contenttweaker:hungering_machine_case>]
// ]);
// 平衡机械框架
mods.extendedcrafting.TableCrafting.addShaped(<contenttweaker:balanced_machine_frame>, [
	[<contenttweaker:stone_of_universal_balance>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:stone_of_universal_balance>], 
	[<contenttweaker:stone_of_universal_balance>, <contenttweaker:cuendillar_plate>, <contenttweaker:ascended_spatial_chassis>, <contenttweaker:cuendillar_plate>, <contenttweaker:stone_of_universal_balance>], 
	[<contenttweaker:stone_of_universal_balance>, <contenttweaker:ascended_spatial_chassis>, <contenttweaker:hungering_machine_case>, <contenttweaker:ascended_spatial_chassis>, <contenttweaker:stone_of_universal_balance>], 
	[<contenttweaker:stone_of_universal_balance>, <contenttweaker:cuendillar_plate>, <contenttweaker:ascended_spatial_chassis>, <contenttweaker:cuendillar_plate>, <contenttweaker:stone_of_universal_balance>], 
	[<contenttweaker:stone_of_universal_balance>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:stone_of_universal_balance>, <contenttweaker:stone_of_universal_balance>]
]);
// 平衡机械导管
mods.extendedcrafting.TableCrafting.addShaped(<contenttweaker:balanced_machine_conduit>*8, [
	[<contenttweaker:hungering_machine_case>, <contenttweaker:balanced_machine_frame>, <contenttweaker:balanced_machine_casing>, <contenttweaker:balanced_machine_casing>, <contenttweaker:balanced_machine_casing>, <contenttweaker:balanced_machine_frame>, <contenttweaker:hungering_machine_case>], 
	[<contenttweaker:balanced_machine_frame>, <avaritiaitem:spatial_processor>, <contenttweaker:shard_of_the_cosmos>, <contenttweaker:fractallite_furnace_conduit>, <contenttweaker:shard_of_the_cosmos>, <avaritiaitem:spatial_processor>, <contenttweaker:balanced_machine_frame>], 
	[<contenttweaker:balanced_machine_casing>, <contenttweaker:shard_of_the_cosmos>, <contenttweaker:exotic_dyson_conduit>, <contenttweaker:entropy_director_element>, <contenttweaker:exotic_dyson_conduit>, <contenttweaker:shard_of_the_cosmos>, <contenttweaker:balanced_machine_casing>], 
	[<contenttweaker:balanced_machine_casing>, <contenttweaker:fractallite_furnace_conduit>, <contenttweaker:entropy_director_element>, <contenttweaker:hyperuranon_actualizing_fabrial>, <contenttweaker:entropy_director_element>, <contenttweaker:fractallite_furnace_conduit>, <contenttweaker:balanced_machine_casing>], 
	[<contenttweaker:balanced_machine_casing>, <contenttweaker:shard_of_the_cosmos>, <contenttweaker:exotic_dyson_conduit>, <contenttweaker:entropy_director_element>, <contenttweaker:exotic_dyson_conduit>, <contenttweaker:shard_of_the_cosmos>, <contenttweaker:balanced_machine_casing>], 
	[<contenttweaker:balanced_machine_frame>, <avaritiaitem:spatial_processor>, <contenttweaker:shard_of_the_cosmos>, <contenttweaker:fractallite_furnace_conduit>, <contenttweaker:shard_of_the_cosmos>, <avaritiaitem:spatial_processor>, <contenttweaker:balanced_machine_frame>], 
	[<contenttweaker:hungering_machine_case>, <contenttweaker:balanced_machine_frame>, <contenttweaker:balanced_machine_casing>, <contenttweaker:balanced_machine_casing>, <contenttweaker:balanced_machine_casing>, <contenttweaker:balanced_machine_frame>, <contenttweaker:hungering_machine_case>]
]);
// 暗物质框架
mods.extendedcrafting.TableCrafting.addShaped(<contenttweaker:dark_matter_frame>, [
	[<contenttweaker:sashimi_of_the_gate_of_darkness>, <tconstruct:large_plate>.withTag({Material: "rebalanced_dark_matter"}), <contenttweaker:sashimi_of_the_gate_of_darkness>, <tconstruct:large_plate>.withTag({Material: "rebalanced_dark_matter"}), <contenttweaker:sashimi_of_the_gate_of_darkness>], 
	[<tconstruct:large_plate>.withTag({Material: "rebalanced_dark_matter"}), <contenttweaker:dark_matter_node>, <contenttweaker:dust_of_infinite_wishes>, <contenttweaker:dark_matter_node>, <tconstruct:large_plate>.withTag({Material: "rebalanced_dark_matter"})], 
	[<contenttweaker:sashimi_of_the_gate_of_darkness>, <contenttweaker:dust_of_infinite_wishes>, <contenttweaker:hyperdense_matter>, <contenttweaker:dust_of_infinite_wishes>, <contenttweaker:sashimi_of_the_gate_of_darkness>], 
	[<tconstruct:large_plate>.withTag({Material: "rebalanced_dark_matter"}), <contenttweaker:dark_matter_node>, <contenttweaker:dust_of_infinite_wishes>, <contenttweaker:dark_matter_node>, <tconstruct:large_plate>.withTag({Material: "rebalanced_dark_matter"})], 
	[<contenttweaker:sashimi_of_the_gate_of_darkness>, <tconstruct:large_plate>.withTag({Material: "rebalanced_dark_matter"}), <contenttweaker:sashimi_of_the_gate_of_darkness>, <tconstruct:large_plate>.withTag({Material: "rebalanced_dark_matter"}), <contenttweaker:sashimi_of_the_gate_of_darkness>]
]);
// 升级总线
recipes.addShaped("upgradebus_1",<modularmachinery:blockupgradebus>, [
	[<modularmachinery:blockcasing:4>, <ore:plateSedna>, <modularmachinery:blockcasing:4>], 
	[<ore:plateSedna>, <forge:bucketfilled>.withTag({FluidName: "erbium", Amount: 1000}), <ore:plateSedna>], 
	[<modularmachinery:blockcasing:4>, <ore:plateSedna>, <modularmachinery:blockcasing:4>]
]);
// 机械视窗
mods.extendedcrafting.TableCrafting.addShaped(<mmce_complement:machine_glass>*64, [
	[<bigreactors:turbineglass>, <bigreactors:turbineglass>, <bigreactors:turbineglass>, <bigreactors:turbineglass>, <bigreactors:turbineglass>, <bigreactors:turbineglass>, <bigreactors:turbineglass>], 
	[<bigreactors:turbineglass>, <tconstruct:large_plate>.withTag({Material: "terrasteel"}), <ore:plateadvancedAlloy>, <ore:plateadvancedAlloy>, <ore:plateadvancedAlloy>, <tconstruct:large_plate>.withTag({Material: "terrasteel"}), <bigreactors:turbineglass>], 
	[<bigreactors:turbineglass>, <ore:plateadvancedAlloy>, <ore:ingotTerrasteel>, <ore:ingotTerrasteel>, <ore:ingotTerrasteel>, <ore:plateadvancedAlloy>, <bigreactors:turbineglass>], 
	[<bigreactors:turbineglass>, <ore:plateadvancedAlloy>, <ore:ingotTerrasteel>, <thaumicaugmentation:fortified_glass>, <ore:ingotTerrasteel>, <ore:plateadvancedAlloy>, <bigreactors:turbineglass>], 
	[<bigreactors:turbineglass>, <ore:plateadvancedAlloy>, <ore:ingotTerrasteel>, <ore:ingotTerrasteel>, <ore:ingotTerrasteel>, <ore:plateadvancedAlloy>, <bigreactors:turbineglass>], 
	[<bigreactors:turbineglass>, <tconstruct:large_plate>.withTag({Material: "terrasteel"}), <ore:plateadvancedAlloy>, <ore:plateadvancedAlloy>, <ore:plateadvancedAlloy>, <tconstruct:large_plate>.withTag({Material: "terrasteel"}), <bigreactors:turbineglass>], 
	[<bigreactors:turbineglass>, <bigreactors:turbineglass>, <bigreactors:turbineglass>, <bigreactors:turbineglass>, <bigreactors:turbineglass>, <bigreactors:turbineglass>, <bigreactors:turbineglass>]
]);
// =====================================================================================================
// 工作台合成	↑
// =====================================================================================================



// =====================================================================================================
// 多方块合成	↓
// =====================================================================================================
// 创造源质原件 
Recipe_Builder_SK(
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
Recipe_Builder_SK(
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
Recipe_Builder_SK(
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
Recipe_Builder_SK(
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
Recipe_Builder_SK(
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
// 神圣之精要 前期过度
Recipe_Builder_SK(
	"sk_divinity_1",
	"advanced_liquid_conversion_machine",
	[
		<contenttweaker:collecting_stone>*1,
		<contenttweaker:divine_ironwood_ingot>*8,
		<aoa3:gold_coin>*8
	],
	[
		<liquid:astralsorcery.liquidstarlight>*100000
	],
	[],
	[
		<liquid:hint_of_divinity>*16000
	],
	20,
	100000,
	0
);
// 癫狂之精要 前期过度
Recipe_Builder_SK(
	"sk_insanity_1",
	"advanced_liquid_conversion_machine",
	[
		<contenttweaker:finis>*1,
		<contenttweaker:recursive_powder>*32
	],
	[
		<liquid:astralsorcery.liquidstarlight>*100000
	],
	[],
	[
		<liquid:hint_of_insanity>*64000
	],
	20,
	100000,
	0
);
// 高等盖亚之魂-高级配方-1
Recipe_Builder_SK(
	"sk_greater_gaia_recipe_1",
	"creation_altar",
	[
		<contenttweaker:yggdrasil_wood>*64,
		<avaritia:resource:5>*64,
		<contenttweaker:botanical_pillar>*4,
		<ore:blockShyregem>*8,
		<extrabotany:material:9>*8,
		<contenttweaker:gem_of_the_dying_constellation>*4
	],
	[
	],
	[
		<contenttweaker:greater_gaia_spirit>*32
	],
	[],
	60,
	10000000,
	0
);
// 秘金块-高级配方-1
Recipe_Builder_SK(
	"sk_mithminite_block_recipe_1",
	"arcane_autoinfuser",
	[
		<contenttweaker:power_wrought_brightsteel_alloy_plate>*4,
		<thaumadditions:adaminite_block>*8,
		<contenttweaker:ichorium_gem>*16,
		<forge:bucketfilled>.withTag({FluidName: "eleint_dragonfire", Amount: 1000})*1
	],
	[],
	[
		<thaumadditions:mithminite_block>*16
	],
	[],
	60,
	10000000,
	0
);
// 宝石符文-高级配方-1
Recipe_Builder_SK(
	"sk_jeweled_runium_recipe_1",
	"creation_altar",
	[
		<contenttweaker:actualized_starlight_sphere>*4,
		<contenttweaker:material_part:129>*8,
		<contenttweaker:hypercharged_runium_chunk>*2
	],
	[
		<liquid:eikaic_jeweled_blend>*3000
	],
	[
		<contenttweaker:jeweled_runium>*16
	],
	[],
	120,
	1000000,
	0
);
// 更多液态泥土配方
// 1x
Recipe_Builder_SK(
	"liquid_dirt_recipe_1",
	"mythic_processor_melter",
	[<ore:compressed1xDirt>*1],
	[],
	[],
	[<liquid:blockfluiddirt>*1296],
	2,
	60000,
	0
);
// 2x
Recipe_Builder_SK(
	"liquid_dirt_recipe_2",
	"mythic_processor_melter",
	[<ore:compressed2xDirt>*1],
	[],
	[],
	[<liquid:blockfluiddirt>*11664],
	2,
	60000,
	0
);
// 3x
Recipe_Builder_SK(
	"liquid_dirt_recipe_3",
	"mythic_processor_melter",
	[<ore:compressed3xDirt>*1],
	[],
	[],
	[<liquid:blockfluiddirt>*104976],
	2,
	60000,
	0
);
// 
// =====================================================================================================
// 多方块合成	↑
// =====================================================================================================
// =====================================================================================================
// 增产配方	↓
// =====================================================================================================
// 神秘机械外壳
Recipe_Builder_SK(
	"better_mythic_machine_case_1",
	"auto_astral_altar",
	[
		<mysticalagriculture:charm:12>*64,
		<contenttweaker:supertranslucent_catalyst>*32,
		<contenttweaker:lyonite_framing>*16,
		<nuclearcraft:heat_exchanger_tube_thermoconducting>*4,
		<contenttweaker:vibranium_servo>*8,
		<contenttweaker:monopolar_catalyst>*24,
		<contenttweaker:restless_steel_frame>*4,
		<contenttweaker:cryotheum_myrmex_coolant_cell>*1,
		<cells:compressed_calculation_print:2>*1
	],
	[
	],
	[
		<contenttweaker:mythic_machine_case>*128
	],
	[],
	200,
	10000000,
	0
);
// =====================================================================================================
// 增产配方	↓
// =====================================================================================================

// ==================不要动这里的神秘代码不然大S老师的脚本会炸掉==================
val creationdivinelattice = RecipeBuilder.newBuilder("wtfweishenmebuneng","creation_altar",10);
// creationdivinelattice.addEnergyPerTickInput(400000);
// creationdivinelattice.addFluidInput(<fluid:harmonic_draconian_lattice>*5000);
// creationdivinelattice.addFluidInput(<fluid:infinite_divine_wish>*5000);
// creationdivinelattice.addItemInput(<contenttweaker:divine_stellar_fabrial>);
// creationdivinelattice.addItemInput(<contenttweaker:divine_flake>);
// creationdivinelattice.addItemInput(<contenttweaker:divine_ironwood_ingot>);
// creationdivinelattice.addFluidOutput(<liquid:harmonic_divine_lattice>*5000);
// creationdivinelattice.addRecipeTooltip("test");
creationdivinelattice.build();
// ==================不要动这里的神秘代码不然大S老师的脚本会炸掉==================