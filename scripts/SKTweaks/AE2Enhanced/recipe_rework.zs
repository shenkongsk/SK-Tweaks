import mods.modularmachinery.RecipeBuilder;
import mods.ae2enhanced.BlackHole;
import crafttweaker.item.IItemStack;

var bh_id =[
    "test_obsidian",
    "stable_spacetime_manifold",
    "differential_form_stabilizer",
    "conformal_invariant_charge"
];
for i in bh_id {
    BlackHole.removeRecipe(i);
}
var recipe_remove as IItemStack[] = [
	<ae2enhanced:hyperdimensional_controller>,
	<ae2enhanced:hyperdimensional_casing>,
	<ae2enhanced:hyperdimensional_singularity_core>,
	<ae2enhanced:hyperdimensional_me_interface>,
	<ae2enhanced:computation_core>,
	<ae2enhanced:causal_anchor_core>,
	<ae2enhanced:super_crafting_interface>,
	<ae2enhanced:constant_spinor_field_casing>,
	<ae2enhanced:constant_tensor_field_casing>,
	<ae2enhanced:assembly_controller>,
	<ae2enhanced:assembly_casing>,
	<ae2enhanced:assembly_inner_wall>,
	<ae2enhanced:assembly_stabilizer>,
	<ae2enhanced:assembly_me_interface>,
	<ae2enhanced:upgrade_card:1>,
	<ae2enhanced:upgrade_card:2>,
	<ae2enhanced:upgrade_card:3>,
	<ae2enhanced:upgrade_card:4>,
	<ae2enhanced:smart_pattern_interface>,
	<ae2enhanced:rf_access_node>,
	<ae2enhanced:omni_wireless_terminal>,
	<ae2enhanced:part_stocking_bus>,
	<ae2enhanced:universal_memory_card>,
	<ae2enhanced:channel_receiver_card>,
	<ae2enhanced:wireless_channel_transmitter>,
	<ae2enhanced:omni_upgrade_card>,
	<ae2enhanced:upgrade_card>,
	<ae2enhanced:compressed_chunk_power_node>,
	<ae2enhanced:chunk_power_node>,
	<ae2enhanced:central_me_interface>
];
for i in recipe_remove{
	recipes.remove(i);
}

// 超维度存储
val HDC = <ae2enhanced:hyperdimensional_controller>;
val HDC_Casing = <ae2enhanced:hyperdimensional_casing>;
val HDC_Singularity = <ae2enhanced:hyperdimensional_singularity_core>;
val HDC_Interface = <ae2enhanced:hyperdimensional_me_interface>;
HDC.addTooltip(format.green("多方块结构："));
HDC.addTooltip(format.green("   仓储中枢 ME 接口 × 1"));
HDC.addTooltip(format.green("   仓储中枢裸奇点核心 × 5"));
HDC.addTooltip(format.green("   仓储中枢度规稳定锚 × 14"));
mods.extendedcrafting.TableCrafting.addShaped(4, HDC, [
	[null, null, null, <contenttweaker:radiant_meatballium_reinforced_casing>, <contenttweaker:radiant_meatballium_reinforced_casing>, <contenttweaker:radiant_meatballium_reinforced_casing>, null, null, null], 
	[null, <contenttweaker:radiant_meatballium_reinforced_casing>, <contenttweaker:radiant_meatballium_reinforced_casing>, <ae2enhanced:hyperdimensional_casing>, <ae2enhanced:hyperdimensional_casing>, <ae2enhanced:hyperdimensional_casing>, <contenttweaker:radiant_meatballium_reinforced_casing>, <contenttweaker:radiant_meatballium_reinforced_casing>, null], 
	[null, <contenttweaker:radiant_meatballium_reinforced_casing>, <ae2enhanced:hyperdimensional_casing>, <ae2enhanced:hyperdimensional_casing>, <dankstorage:dank_7>, <ae2enhanced:hyperdimensional_casing>, <ae2enhanced:hyperdimensional_casing>, <contenttweaker:radiant_meatballium_reinforced_casing>, null], 
	[<contenttweaker:radiant_meatballium_reinforced_casing>, <ae2enhanced:hyperdimensional_casing>, <ae2enhanced:hyperdimensional_casing>, <cells:hyper_density_component>, <contenttweaker:sympan_spirit>, <cells:hyper_density_component>, <ae2enhanced:hyperdimensional_casing>, <ae2enhanced:hyperdimensional_casing>, <contenttweaker:radiant_meatballium_reinforced_casing>], 
	[<contenttweaker:radiant_meatballium_reinforced_casing>, <ae2enhanced:hyperdimensional_casing>, <dankstorage:dank_7>, <cells:hyper_density_component>, <appliedenergistics2:material:47>, <cells:hyper_density_component>, <dankstorage:dank_7>, <ae2enhanced:hyperdimensional_casing>, <contenttweaker:radiant_meatballium_reinforced_casing>], 
	[<contenttweaker:radiant_meatballium_reinforced_casing>, <ae2enhanced:hyperdimensional_casing>, <ae2enhanced:hyperdimensional_casing>, <cells:hyper_density_component>, <contenttweaker:sympan_spirit>, <cells:hyper_density_component>, <ae2enhanced:hyperdimensional_casing>, <ae2enhanced:hyperdimensional_casing>, <contenttweaker:radiant_meatballium_reinforced_casing>], 
	[null, <contenttweaker:radiant_meatballium_reinforced_casing>, <ae2enhanced:hyperdimensional_casing>, <ae2enhanced:hyperdimensional_casing>, <dankstorage:dank_7>, <ae2enhanced:hyperdimensional_casing>, <ae2enhanced:hyperdimensional_casing>, <contenttweaker:radiant_meatballium_reinforced_casing>, null], 
	[null, <contenttweaker:radiant_meatballium_reinforced_casing>, <contenttweaker:radiant_meatballium_reinforced_casing>, <ae2enhanced:hyperdimensional_casing>, <ae2enhanced:hyperdimensional_casing>, <ae2enhanced:hyperdimensional_casing>, <contenttweaker:radiant_meatballium_reinforced_casing>, <contenttweaker:radiant_meatballium_reinforced_casing>, null], 
	[null, null, null, <contenttweaker:radiant_meatballium_reinforced_casing>, <contenttweaker:radiant_meatballium_reinforced_casing>, <contenttweaker:radiant_meatballium_reinforced_casing>, null, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(2, HDC_Casing, [
	[<twilightforest:castle_brick>, <twilightforest:castle_brick>, <appliedenergistics2:quartz_glass>, <twilightforest:castle_brick>, <twilightforest:castle_brick>], 
	[<twilightforest:castle_brick>, <appliedenergistics2:quartz_glass>, <techreborn:lightning_rod>, <appliedenergistics2:quartz_glass>, <twilightforest:castle_brick>], 
	[<appliedenergistics2:quartz_glass>, <cells:singularity_processor:2>, <appliedenergistics2:material:47>, <cells:singularity_processor:1>, <appliedenergistics2:quartz_glass>], 
	[<twilightforest:castle_brick>, <appliedenergistics2:quartz_glass>, <cells:singularity_processor>, <appliedenergistics2:quartz_glass>, <twilightforest:castle_brick>], 
	[<twilightforest:castle_brick>, <twilightforest:castle_brick>, <appliedenergistics2:quartz_glass>, <twilightforest:castle_brick>, <twilightforest:castle_brick>]
]);
mods.extendedcrafting.TableCrafting.addShaped(3, HDC_Singularity, [
	[null, null, <nuclearcraft:fission_block>, <nuclearcraft:fission_block>, <nuclearcraft:fission_block>, null, null], 
	[null, <nuclearcraft:fission_block>, <contenttweaker:dense_alchemical_shielding>, <contenttweaker:dense_alchemical_shielding>, <contenttweaker:dense_alchemical_shielding>, <nuclearcraft:fission_block>, null], 
	[<nuclearcraft:fission_block>, <contenttweaker:dense_alchemical_shielding>, <contenttweaker:sanitized_dark_matter>, <contenttweaker:sanitized_dark_matter>, <contenttweaker:sanitized_dark_matter>, <contenttweaker:dense_alchemical_shielding>, <nuclearcraft:fission_block>], 
	[<nuclearcraft:fission_block>, <contenttweaker:dense_alchemical_shielding>, <contenttweaker:sanitized_dark_matter>, <appliedenergistics2:material:47>, <contenttweaker:sanitized_dark_matter>, <contenttweaker:dense_alchemical_shielding>, <nuclearcraft:fission_block>], 
	[<nuclearcraft:fission_block>, <contenttweaker:dense_alchemical_shielding>, <contenttweaker:sanitized_dark_matter>, <contenttweaker:sanitized_dark_matter>, <contenttweaker:sanitized_dark_matter>, <contenttweaker:dense_alchemical_shielding>, <nuclearcraft:fission_block>], 
	[null, <nuclearcraft:fission_block>, <contenttweaker:dense_alchemical_shielding>, <contenttweaker:dense_alchemical_shielding>, <contenttweaker:dense_alchemical_shielding>, <nuclearcraft:fission_block>, null], 
	[null, null, <nuclearcraft:fission_block>, <nuclearcraft:fission_block>, <nuclearcraft:fission_block>, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(2, HDC_Interface, [
	[null, <appliedenergistics2:quartz_vibrant_glass>, <modularmachinery:blockmeiteminputbus>, <appliedenergistics2:quartz_vibrant_glass>, null], 
	[<appliedenergistics2:quartz_vibrant_glass>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:quartz_vibrant_glass>], 
	[<appliedenergistics2:quartz_vibrant_glass>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:material:47>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:quartz_vibrant_glass>], 
	[<appliedenergistics2:quartz_vibrant_glass>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:quartz_vibrant_glass>], 
	[null, <appliedenergistics2:quartz_vibrant_glass>, <modularmachinery:blockmeitemoutputbus>, <appliedenergistics2:quartz_vibrant_glass>, null]
]);
// 超因果计算核心
val SCC = <ae2enhanced:computation_core>;
val SCC_CAC = <ae2enhanced:causal_anchor_core>;
val SCC_Interface = <ae2enhanced:super_crafting_interface>;
val SCC_Casing_Spinor = <ae2enhanced:constant_spinor_field_casing>;
val SCC_Casing_Tensor = <ae2enhanced:constant_tensor_field_casing>;
SCC.addTooltip(format.green("多方块结构："));
SCC.addTooltip(format.green("   恒定张量场外壳 × 144"));
SCC.addTooltip(format.green("   因果锚定核心 × 343"));
SCC.addTooltip(format.green("   恒定旋量场外壳 × 366"));
SCC.addTooltip(format.green("   超因果合成接口 × 1"));
mods.extendedcrafting.TableCrafting.addShaped(4, SCC, [
	[null, null, null, <draconicevolution:particle_generator:2>, SCC_CAC, <draconicevolution:particle_generator:2>, null, null, null], 
	[null, null, <appliedenergistics2:spatial_pylon>, <appliedenergistics2:crafting_storage_64k>, <contenttweaker:eden_core>, <appliedenergistics2:crafting_storage_64k>, <appliedenergistics2:spatial_pylon>, null, null], 
	[null, <appliedenergistics2:spatial_pylon>, <appliedenergistics2:crafting_storage_64k>, <vajra:magnetron>, <vajra:magnetron>, <vajra:magnetron>, <appliedenergistics2:crafting_storage_64k>, <appliedenergistics2:spatial_pylon>, null], 
	[<draconicevolution:particle_generator:2>, <appliedenergistics2:spatial_pylon>, <vajra:magnetron>, <techreborn:fusion_control_computer>, <thaumcraft:causality_collapser>, <techreborn:fusion_control_computer>, <vajra:magnetron>, <appliedenergistics2:spatial_pylon>, <draconicevolution:particle_generator:2>], 
	[SCC_CAC, <appliedenergistics2:spatial_pylon>, <vajra:magnetron>, <thaumcraft:causality_collapser>, <appliedenergistics2:material:47>, <thaumcraft:causality_collapser>, <vajra:magnetron>, <appliedenergistics2:spatial_pylon>, SCC_CAC], 
	[<draconicevolution:particle_generator:2>, <appliedenergistics2:spatial_pylon>, <vajra:magnetron>, <techreborn:fusion_control_computer>, <thaumcraft:causality_collapser>, <techreborn:fusion_control_computer>, <vajra:magnetron>, <appliedenergistics2:spatial_pylon>, <draconicevolution:particle_generator:2>], 
	[null, <appliedenergistics2:spatial_pylon>, <appliedenergistics2:crafting_storage_64k>, <vajra:magnetron>, <vajra:magnetron>, <vajra:magnetron>, <appliedenergistics2:crafting_storage_64k>, <appliedenergistics2:spatial_pylon>, <draconicevolution:particle_generator:2>], 
	[null, null, <appliedenergistics2:spatial_pylon>, <appliedenergistics2:crafting_storage_64k>, <contenttweaker:eden_core>, <appliedenergistics2:crafting_storage_64k>, <appliedenergistics2:spatial_pylon>, null, null], 
	[null, null, null, <draconicevolution:particle_generator:2>, SCC_CAC, <draconicevolution:particle_generator:2>, null, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(3, SCC_CAC*32, [
	[null, null, SCC_Casing_Spinor, SCC_Casing_Spinor, SCC_Casing_Spinor, null, <contenttweaker:stellar_alloy_shaft>], 
	[null, SCC_Casing_Spinor, <contenttweaker:meatballium_ingot>, <ae2enhanced:hyperdimensional_singularity_core>, <contenttweaker:meatballium_ingot>, SCC_Casing_Spinor, null], 
	[SCC_Casing_Spinor, <contenttweaker:meatballium_ingot>, <ae2enhanced:hyperdimensional_singularity_core>, <ae2enhanced:assembly_stabilizer>, <ae2enhanced:hyperdimensional_singularity_core>, <contenttweaker:meatballium_ingot>, SCC_Casing_Tensor], 
	[SCC_Casing_Spinor, <ae2enhanced:hyperdimensional_singularity_core>, <ae2enhanced:assembly_stabilizer>, <appliedenergistics2:material:47>, <ae2enhanced:assembly_stabilizer>, <ae2enhanced:hyperdimensional_singularity_core>, SCC_Casing_Tensor], 
	[SCC_Casing_Spinor, <contenttweaker:meatballium_ingot>, <ae2enhanced:hyperdimensional_singularity_core>, <ae2enhanced:assembly_stabilizer>, <ae2enhanced:hyperdimensional_singularity_core>, <contenttweaker:meatballium_ingot>, SCC_Casing_Tensor], 
	[null, SCC_Casing_Tensor, <contenttweaker:meatballium_ingot>, <ae2enhanced:hyperdimensional_singularity_core>, <contenttweaker:meatballium_ingot>, SCC_Casing_Tensor, null], 
	[<contenttweaker:stellar_alloy_shaft>, null, SCC_Casing_Tensor, SCC_Casing_Tensor, SCC_Casing_Tensor, null, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(2, SCC_Interface, [
	[null, <ae2enhanced:causal_anchor_core>, <modularmachinery:blockmeiteminputbus>, SCC_CAC, null], 
	[<ae2enhanced:causal_anchor_core>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:quantum_ring>, <ae2enhanced:causal_anchor_core>], 
	[<ae2enhanced:causal_anchor_core>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:material:47>, <appliedenergistics2:quantum_ring>, <ae2enhanced:causal_anchor_core>], 
	[<ae2enhanced:causal_anchor_core>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:quantum_ring>, <ae2enhanced:causal_anchor_core>], 
	[null, <ae2enhanced:causal_anchor_core>, <modularmachinery:blockmeitemoutputbus>, <ae2enhanced:causal_anchor_core>, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(3, SCC_Casing_Tensor*8,  [
	[<ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>], 
	[<ore:turfMoon>, <divinerpg:arcanium_block>, <ore:ingotSednanite>, <ore:ingotSednanite>, <ore:ingotSednanite>, <divinerpg:arcanium_block>, <ore:turfMoon>], 
	[<ore:turfMoon>, <ore:ingotSednanite>, <fluxnetworks:fluxcore>, <fluxnetworks:fluxcore>, <fluxnetworks:fluxcore>, <ore:ingotSednanite>, <ore:turfMoon>], 
	[<ore:turfMoon>, <ore:ingotSednanite>, <fluxnetworks:fluxcore>, <appliedenergistics2:material:47>, <fluxnetworks:fluxcore>, <ore:ingotSednanite>, <ore:turfMoon>], 
	[<ore:turfMoon>, <ore:ingotSednanite>, <fluxnetworks:fluxcore>, <fluxnetworks:fluxcore>, <fluxnetworks:fluxcore>, <ore:ingotSednanite>, <ore:turfMoon>], 
	[<ore:turfMoon>, <divinerpg:arcanium_block>, <ore:ingotSednanite>, <ore:ingotSednanite>, <ore:ingotSednanite>, <divinerpg:arcanium_block>, <ore:turfMoon>], 
	[<ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>]
]);
mods.extendedcrafting.TableCrafting.addShaped(3, SCC_Casing_Spinor*8,  [
	[<ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>], 
	[<ore:turfMoon>, <ore:blockFiery>, <ore:ingotSednanite>, <ore:ingotSednanite>, <ore:ingotSednanite>, <ore:blockFiery>, <ore:turfMoon>], 
	[<ore:turfMoon>, <ore:ingotSednanite>, <fluxnetworks:fluxcore>, <fluxnetworks:fluxcore>, <fluxnetworks:fluxcore>, <ore:ingotSednanite>, <ore:turfMoon>], 
	[<ore:turfMoon>, <ore:ingotSednanite>, <fluxnetworks:fluxcore>, <appliedenergistics2:material:47>, <fluxnetworks:fluxcore>, <ore:ingotSednanite>, <ore:turfMoon>], 
	[<ore:turfMoon>, <ore:ingotSednanite>, <fluxnetworks:fluxcore>, <fluxnetworks:fluxcore>, <fluxnetworks:fluxcore>, <ore:ingotSednanite>, <ore:turfMoon>], 
	[<ore:turfMoon>, <ore:blockFiery>, <ore:ingotSednanite>, <ore:ingotSednanite>, <ore:ingotSednanite>, <ore:blockFiery>, <ore:turfMoon>], 
	[<ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>]
]);

// 装配枢纽
val ASC = <ae2enhanced:assembly_controller>;
val ASC_Casing = <ae2enhanced:assembly_casing>;
val ASC_Inner_Wall = <ae2enhanced:assembly_inner_wall>;
val ASC_Stabilizer = <ae2enhanced:assembly_stabilizer>;
val ASC_Interface = <ae2enhanced:assembly_me_interface>;
ASC.addTooltip(format.green("多方块结构："));
ASC.addTooltip(format.green("   装配枢纽 ME 接口 × 3"));
ASC.addTooltip(format.green("   装配枢纽外壳 × 179"));
ASC.addTooltip(format.green("   装配枢纽内壁 × 128"));
ASC.addTooltip(format.green("   装配枢纽稳定器 × 32"));
mods.extendedcrafting.TableCrafting.addShaped(2, ASC, [
	[ASC_Casing, <appliedenergistics2:molecular_assembler>, ASC_Stabilizer, <appliedenergistics2:molecular_assembler>, ASC_Casing], 
	[<appliedenergistics2:molecular_assembler>, <appliedenergistics2:molecular_assembler>, ASC_Inner_Wall, <appliedenergistics2:molecular_assembler>, <appliedenergistics2:molecular_assembler>], 
	[ASC_Stabilizer, ASC_Inner_Wall,<appliedenergistics2:material:47>, ASC_Inner_Wall, ASC_Stabilizer], 
	[<appliedenergistics2:molecular_assembler>, <appliedenergistics2:molecular_assembler>, ASC_Inner_Wall, <appliedenergistics2:molecular_assembler>, <appliedenergistics2:molecular_assembler>], 
	[ASC_Casing, <appliedenergistics2:molecular_assembler>, ASC_Stabilizer, <appliedenergistics2:molecular_assembler>, ASC_Casing]
]);
mods.extendedcrafting.TableCrafting.addShaped(2, ASC_Stabilizer*8, [
	[null, <appliedenergistics2:quartz_vibrant_glass>, ASC_Casing, <appliedenergistics2:quartz_vibrant_glass>, null], 
	[<appliedenergistics2:quartz_vibrant_glass>, <ore:plateAdvanced>, ASC_Inner_Wall, <ore:plateAdvanced>, <appliedenergistics2:quartz_vibrant_glass>], 
	[ASC_Casing, ASC_Inner_Wall, <appliedenergistics2:material:47>, ASC_Inner_Wall, ASC_Casing], 
	[<appliedenergistics2:quartz_vibrant_glass>, <ore:plateAdvanced>, ASC_Inner_Wall, <ore:plateAdvanced>, <appliedenergistics2:quartz_vibrant_glass>], 
	[null, <appliedenergistics2:quartz_vibrant_glass>, ASC_Casing, <appliedenergistics2:quartz_vibrant_glass>, null]
]);
mods.extendedcrafting.TableCrafting.addShaped(2, ASC_Inner_Wall*4, [
	[<appliedenergistics2:quartz_vibrant_glass>, <extendedcrafting:material:2>, <extendedcrafting:material:2>, <extendedcrafting:material:2>, <appliedenergistics2:quartz_vibrant_glass>], 
	[<extendedcrafting:material:2>, <threng:material:2>, <threng:material:2>, <threng:material:2>, <extendedcrafting:material:2>], 
	[<extendedcrafting:material:2>, <threng:material:2>, <threng:material:2>, <threng:material:2>, <extendedcrafting:material:2>], 
	[<extendedcrafting:material:2>, <threng:material:2>, <threng:material:2>, <threng:material:2>, <extendedcrafting:material:2>], 
	[<appliedenergistics2:quartz_vibrant_glass>, <extendedcrafting:material:2>, <extendedcrafting:material:2>, <extendedcrafting:material:2>, <appliedenergistics2:quartz_vibrant_glass>]
]);
mods.extendedcrafting.TableCrafting.addShaped(2, ASC_Casing*8, [
	[<ore:plateBasic>, <appliedenergistics2:quartz_vibrant_glass>, <appliedenergistics2:quartz_vibrant_glass>, <appliedenergistics2:quartz_vibrant_glass>, <ore:plateBasic>], 
	[<appliedenergistics2:quartz_vibrant_glass>, <techreborn:machine_casing:2>, <techreborn:machine_casing:2>, <techreborn:machine_casing:2>, <appliedenergistics2:quartz_vibrant_glass>], 
	[<appliedenergistics2:quartz_vibrant_glass>, <techreborn:machine_casing:2>, <ore:plateAdvanced>, <techreborn:machine_casing:2>, <appliedenergistics2:quartz_vibrant_glass>], 
	[<appliedenergistics2:quartz_vibrant_glass>, <techreborn:machine_casing:2>, <techreborn:machine_casing:2>, <techreborn:machine_casing:2>, <appliedenergistics2:quartz_vibrant_glass>], 
	[<ore:plateBasic>, <appliedenergistics2:quartz_vibrant_glass>, <appliedenergistics2:quartz_vibrant_glass>, <appliedenergistics2:quartz_vibrant_glass>, <ore:plateBasic>]
]);
mods.extendedcrafting.TableCrafting.addShaped(2, ASC_Interface, [
	[null, <ae2enhanced:assembly_casing>, <modularmachinery:blockmeiteminputbus>, <ae2enhanced:assembly_casing>, null], 
	[<ae2enhanced:assembly_casing>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:quantum_ring>, <ae2enhanced:assembly_casing>], 
	[<ae2enhanced:assembly_casing>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:material:47>, <appliedenergistics2:quantum_ring>, <ae2enhanced:assembly_casing>], 
	[<ae2enhanced:assembly_casing>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:quantum_ring>, <appliedenergistics2:quantum_ring>, <ae2enhanced:assembly_casing>], 
	[null, <ae2enhanced:assembly_casing>, <modularmachinery:blockmeitemoutputbus>, <ae2enhanced:assembly_casing>, null]
]);
// 自动上传模块
BlackHole.addRecipe(<ae2enhanced:upgrade_card:4>, [<appliedenergistics2:material:28>, <contenttweaker:erbium_dust>]);
// 维度折叠模块
BlackHole.addRecipe(<ae2enhanced:upgrade_card:3>, [<appliedenergistics2:material:28>, <appliedenergistics2:material:27>, <appliedenergistics2:material:47>]);
// 能量优化模块
BlackHole.addRecipe(<ae2enhanced:upgrade_card:2>, [<appliedenergistics2:material:47>, <draconicevolution:draconic_ingot>]);
// 时空膨胀模块
mods.extendedcrafting.TableCrafting.addShaped(1, <ae2enhanced:upgrade_card:1>, [
	[<contenttweaker:tainted_sentient_meatball>, <appliedenergistics2:material:47>, <contenttweaker:tainted_sentient_meatball>], 
	[<contenttweaker:wrought_iron_plate>, <contenttweaker:innerved_sky_stone>, <contenttweaker:wrought_iron_plate>], 
	[<contenttweaker:tainted_sentient_meatball>, <contenttweaker:wrought_iron_plate>, <contenttweaker:tainted_sentient_meatball>]
]);
// 智能样板
// recipes.addShapeless("ae2e_card_pattern", <ae2enhanced:smart_blank_pattern>, [<ae2enhanced:smart_pattern>]);
// mods.extendedcrafting.TableCrafting.addShaped(2,  <ae2enhanced:smart_blank_pattern>*4, [
// 	[null, null, <ore:nuggetNetherStar>, null, null], 
// 	[null, <ore:nuggetNetherStar>, <appliedenergistics2:material:52>, <ore:nuggetNetherStar>, null], 
// 	[<ore:nuggetNetherStar>, <appliedenergistics2:material:52>, <appliedenergistics2:material:47>, <appliedenergistics2:material:52>, <ore:nuggetNetherStar>], 
// 	[null, <ore:nuggetNetherStar>, <appliedenergistics2:material:52>, <ore:nuggetNetherStar>, null], 
// 	[null, null, <ore:nuggetNetherStar>, null, null]
// ]);
// 智能样板接口
mods.extendedcrafting.TableCrafting.addShaped(2, <ae2enhanced:smart_pattern_interface>, [
	[null, <appliedenergistics2:quartz_vibrant_glass>, <appliedenergistics2:quartz_vibrant_glass>, <appliedenergistics2:quartz_vibrant_glass>, null], 
	[<appliedenergistics2:quartz_vibrant_glass>, <ore:nuggetNetherStar>, <ore:nuggetNetherStar>, <ore:nuggetNetherStar>, <appliedenergistics2:quartz_vibrant_glass>], 
	[<appliedenergistics2:quartz_vibrant_glass>, <ore:nuggetNetherStar>, <modularmachinery:blockmepatternprovider>, <ore:nuggetNetherStar>, <appliedenergistics2:quartz_vibrant_glass>], 
	[<appliedenergistics2:quartz_vibrant_glass>, <ore:nuggetNetherStar>, <ore:nuggetNetherStar>, <ore:nuggetNetherStar>, <appliedenergistics2:quartz_vibrant_glass>], 
	[null, <appliedenergistics2:quartz_vibrant_glass>, <appliedenergistics2:quartz_vibrant_glass>, <appliedenergistics2:quartz_vibrant_glass>, null]
]);
// RF接口
recipes.addShaped("ae2e_RF_node", <ae2enhanced:rf_access_node>, [
	[<ore:ingotSednanite>, <appliedenergistics2:energy_acceptor>, <ore:ingotSednanite>], 
	[<appliedenergistics2:energy_acceptor>, <appliedenergistics2:material:47>, <appliedenergistics2:energy_acceptor>], 
	[<ore:ingotSednanite>, <appliedenergistics2:energy_acceptor>, <ore:ingotSednanite>]
]);
// 区块供电节点
mods.extendedcrafting.TableCrafting.addShaped(4, <ae2enhanced:chunk_power_node>, [
	[null, null, null, null, <contenttweaker:blue_matter>, null, null, null, null], 
	[null, null, null, null, <contenttweaker:blue_matter>, null, null, null, null], 
	[null, null, null, null, <minecraft:beacon>, null, null, null, null], 
	[null, null, null, <contenttweaker:blue_matter>, <draconicevolution:wyvern_energy_core>, <contenttweaker:blue_matter>, null, null, null], 
	[null, <contenttweaker:blue_matter>, <contenttweaker:blue_matter>, <draconicevolution:wyvern_energy_core>, <ore:gemDilithium>, <draconicevolution:wyvern_energy_core>, <contenttweaker:blue_matter>, <contenttweaker:blue_matter>, null], 
	[<contenttweaker:blue_matter>, <fluxnetworks:fluxpoint>, <draconicevolution:wyvern_energy_core>, <ore:gemDilithium>, <draconicevolution:energy_pylon>, <ore:gemDilithium>, <draconicevolution:wyvern_energy_core>, <fluxnetworks:fluxpoint>, <contenttweaker:blue_matter>], 
	[null, <contenttweaker:blue_matter>, <draconicevolution:wyvern_energy_core>, <appliedenergistics2:material:47>, <appliedenergistics2:material:47>, <appliedenergistics2:material:47>, <draconicevolution:wyvern_energy_core>, <contenttweaker:blue_matter>, null], 
	[null, null, <contenttweaker:blue_matter>, <draconicevolution:wyvern_energy_core>, <draconicevolution:wyvern_energy_core>, <draconicevolution:wyvern_energy_core>, <contenttweaker:blue_matter>, null, null], 
	[null, null, null, <contenttweaker:blue_matter>, <fluxnetworks:fluxpoint>, <contenttweaker:blue_matter>, null, null, null]
]);

// 全能终端
BlackHole.addRecipe(
	<ae2enhanced:omni_wireless_terminal>,
	[
		<appliedenergistics2:wireless_terminal>,
		<contenttweaker:sympan_spirit>
	]
);
BlackHole.addRecipe(
	<ae2enhanced:compressed_chunk_power_node>,
	[
		<extendedcrafting:material:13>,
		<ae2enhanced:chunk_power_node>*4
	]
);

// 通用输入总线
// recipes.addShaped("ae2e_inputbus", <ae2enhanced:part_universal_import_bus>, [
// 	[null, null, null], 
// 	[<appliedenergistics2:material:22>, <appliedenergistics2:material:44>, <appliedenergistics2:material:22>], 
// 	[<ore:ingotCyanite>, <minecraft:sticky_piston>, <ore:ingotCyanite>]
// ]);
// 通用输出总线
// recipes.addShaped("ae2e_outputbus", <ae2enhanced:part_universal_export_bus>, [
// 	[null, null, null], 
// 	[<appliedenergistics2:material:22>, <appliedenergistics2:material:44>, <appliedenergistics2:material:22>], 
// 	[<bigreactors:ingotyellorium>,<minecraft:piston>,<bigreactors:ingotyellorium>]
// ]);
// 库存维持总线
BlackHole.addRecipe(
	<ae2enhanced:part_stocking_bus>,
	[
		<ae2enhanced:part_universal_import_bus>,
		<ae2enhanced:part_universal_export_bus>
	]
);
// 高级内存卡
recipes.addShapeless("ae2e_card_memory",<ae2enhanced:universal_memory_card>, [<appliedenergistics2:memory_card>, <ore:netherStar>]);
// 频道接受卡
recipes.addShaped("ae2e_card_channel",<ae2enhanced:channel_receiver_card>, [
	[null, <appliedenergistics2:quantum_link>, null], 
	[<appliedenergistics2:material:47>, <appliedenergistics2:material:24>, <appliedenergistics2:material:47>], 
	[null, <appliedenergistics2:quantum_link>, null]
]);
// 无线发射器
recipes.addShaped("ae2e_channel_transmitter",<ae2enhanced:wireless_channel_transmitter>, [
	[null, null, <appliedenergistics2:material:41>], 
	[null, <ore:netherStar>, null], 
	[<contenttweaker:fluxed_electrum_shaft>, null, null]
]);
// 选取交互卡   
// BlackHole.addRecipe(
// 	<ae2enhanced:omni_upgrade_card:1>,
// 	[
// 		<appliedenergistics2:material:28>,
// 		<techreborn:ingot:25>*8
// 	]
// );
// 高级磁引卡
recipes.addShaped("ae2e_card_mag",<ae2enhanced:omni_upgrade_card>, [
	[<ore:ingotIron>, <appliedenergistics2:material:47>, <ore:ingotIron>], 
	[<ore:netherStar>, <appliedenergistics2:material:60>, <ore:netherStar>], 
	[<ore:ingotIron>, <appliedenergistics2:material:47>, <ore:ingotIron>]
]);


// // 注册自定义速度升级卡
// mods.ae2enhanced.AssemblyHub.registerSpeedUpgrade(
//     <my_mod:temporal_accelerator>,
//     5,                              // 最大堆叠
//     [20, 10, 5, 2, 1]              // 1~5 张时的冷却 tick 数
// );
// mods.ae2enhanced.SingularityRitual.addRecipe(
//     "my_recipe",
//     [<minecraft:diamond> * 64, <minecraft:emerald> * 32],  // dropped items
//     <minecraft:nether_star>,                                 // held item
//     <appliedenergistics2:controller>,                        // target block
//     12000                                                    // lifetime (ticks)
// );
// mods.ae2enhanced.SingularityRitual.removeRecipe("my_recipe");

// // 注册自定义并行升级卡
// 量子并行卡
// mods.ae2enhanced.AssemblyHub.registerParallelUpgrade(
//     <contenttweaker:defined_ingot>,
//     1,                              // 最大堆叠
//     [128]  // 1 张时的并行上限
// );

// 三个独立数组，分别存储物品、最大堆叠、并行上限数组
var parallelItems as IItemStack[] = [
    <contenttweaker:eden_core>,
    <contenttweaker:wildwood_core>,
    <contenttweaker:perfected_gem_of_the_cosmos>,
    <contenttweaker:defined_engine>,
    <contenttweaker:material_part:317>,
    <contenttweaker:trinity_ingot>,
    <avaritiaitem:cosmic_balance>
];
var parallelMaxStacks as int[] = [
    1,
    2,
    2,
    2,
    1,
    2,
    4
];
var parallelLimits as int[][] = [
    [256],
    [512, 768],
    [1024, 2048],
    [3840, 5120],
    [8192],
    [10240, 16384],
    [32768, 65536, 102400, 163840]
];

// 用索引进行循环
for i, item in parallelItems {
    mods.ae2enhanced.AssemblyHub.registerParallelUpgrade(
        item,
        parallelMaxStacks[i],
        parallelLimits[i]
    );
    item.addTooltip(format.gold("装配枢纽并行升级:"));
    item.addTooltip(format.gold("    最高堆叠数:" + parallelMaxStacks[i]));
    var limits = parallelLimits[i];
    var limitsStr = "";
    for index in 0 .. (limits.length) {
        if (index > 0) {
            limitsStr += ", ";
        }
        limitsStr += limits[index];
    }
    item.addTooltip(format.gold("    每个提供并行上限:" + limitsStr));
}
// ME中枢接口
// 哈哈哈不让你们用
mods.extendedcrafting.TableCrafting.addShaped(4, <ae2enhanced:central_me_interface>*32, [
	[<contenttweaker:tardis_polyp>, <contenttweaker:tardis_polyp>, <ae2enhanced:differential_form_stabilizer>, <ae2enhanced:differential_form_stabilizer>, <ae2enhanced:differential_form_stabilizer>, <ae2enhanced:differential_form_stabilizer>, <ae2enhanced:differential_form_stabilizer>, <contenttweaker:tardis_polyp>, <contenttweaker:tardis_polyp>], 
	[<contenttweaker:tardis_polyp>, <ae2enhanced:differential_form_stabilizer>, <openblocks:tank>.withTag({tank: {FluidName: "black_hole_juice", Amount: 16000}}), <contenttweaker:construct_of_the_time_lords>, <minecraft:bedrock>, <contenttweaker:construct_of_the_time_lords>, <openblocks:tank>.withTag({tank: {FluidName: "black_hole_juice", Amount: 16000}}), <ae2enhanced:differential_form_stabilizer>, <contenttweaker:tardis_polyp>], 
	[<ae2enhanced:conformal_invariant_charge>, <contenttweaker:construct_of_creative_freedom>, <contenttweaker:singular_fractal>, <contenttweaker:catalyst_of_universal_balance>, <contenttweaker:infinite_processor>, <contenttweaker:catalyst_of_universal_balance>, <contenttweaker:singular_fractal>, <contenttweaker:construct_of_creative_freedom>, <ae2enhanced:conformal_invariant_charge>], 
	[<ae2enhanced:conformal_invariant_charge>, <contenttweaker:singular_fractal>, <contenttweaker:catalyst_of_universal_balance>, <contenttweaker:infinite_processor>, <contenttweaker:unleashed_mithril_1>, <contenttweaker:infinite_processor>, <contenttweaker:catalyst_of_universal_balance>, <contenttweaker:singular_fractal>, <ae2enhanced:conformal_invariant_charge>], 
	[<ae2enhanced:conformal_invariant_charge>, <contenttweaker:singular_fractal>, <ae2enhanced:stable_spacetime_manifold>, <openblocks:tank>.withTag({tank: {FluidName: "black_hole_juice", Amount: 16000}}), <xreliquary:witherless_rose>, <openblocks:tank>.withTag({tank: {FluidName: "black_hole_juice", Amount: 16000}}), <ae2enhanced:stable_spacetime_manifold>, <contenttweaker:singular_fractal>, <ae2enhanced:conformal_invariant_charge>], 
	[<ae2enhanced:conformal_invariant_charge>, <contenttweaker:singular_fractal>, <contenttweaker:catalyst_of_universal_balance>, <contenttweaker:infinite_processor>, <contenttweaker:unleashed_mithril_2>, <contenttweaker:infinite_processor>, <contenttweaker:catalyst_of_universal_balance>, <contenttweaker:singular_fractal>, <ae2enhanced:conformal_invariant_charge>], 
	[<ae2enhanced:conformal_invariant_charge>, <contenttweaker:construct_of_creative_freedom>, <contenttweaker:singular_fractal>, <contenttweaker:catalyst_of_universal_balance>, <contenttweaker:infinite_processor>, <contenttweaker:catalyst_of_universal_balance>, <contenttweaker:singular_fractal>, <contenttweaker:construct_of_creative_freedom>, <ae2enhanced:conformal_invariant_charge>], 
	[<contenttweaker:tardis_polyp>, <ae2enhanced:differential_form_stabilizer>, <openblocks:tank>.withTag({tank: {FluidName: "black_hole_juice", Amount: 16000}}), <contenttweaker:construct_of_the_time_lords>, <minecraft:bedrock>, <contenttweaker:construct_of_the_time_lords>, <openblocks:tank>.withTag({tank: {FluidName: "black_hole_juice", Amount: 16000}}), <ae2enhanced:differential_form_stabilizer>, <contenttweaker:tardis_polyp>], 
	[<contenttweaker:tardis_polyp>, <contenttweaker:tardis_polyp>, <ae2enhanced:differential_form_stabilizer>, <ae2enhanced:differential_form_stabilizer>, <ae2enhanced:differential_form_stabilizer>, <ae2enhanced:differential_form_stabilizer>, <ae2enhanced:differential_form_stabilizer>, <contenttweaker:tardis_polyp>, <contenttweaker:tardis_polyp>]
]);
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK_Chance(
    "stable_spacetime_manifold_made",
    "mythic_excavation_lattice",
    // inputs - chances
    [
		<contenttweaker:gravitational_time_crystal>*4
    ],
    [],
    // fluid inputs - chances
    [<liquid:black_hole_juice>*1],
    [],
    // outputs - chances
    [<ae2enhanced:stable_spacetime_manifold>],
    [0.1],
    // fluid outputs - chances
    [],
    [],
    // time, energy input, energy output
    10,
    0,
    0
);
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "differential_form_stabilizer_made",
    "relativistic_collapser",
    // inputs
    [
		<ae2enhanced:stable_spacetime_manifold>*8,
		<ae2enhanced:assembly_stabilizer>*16384,
		<ae2enhanced:hyperdimensional_casing>*16384,
		<ae2enhanced:causal_anchor_core>*16384,
		<contenttweaker:tardis_branch>*2,
		<contenttweaker:everlasting_fusor>*4
	],
    // fluid inputs
    [],
    // outputs
    [
		<ae2enhanced:differential_form_stabilizer>*12
	],
    // fluid outputs
    [],
    // time, energy input, energy output
    1000, // 50 秒
    1000000000,
    0
);
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "conformal_invariant_charge_made",
    "dyson_abater",
    // inputs
    [
		<avaritiaitem:cosmic_balance>,
		<ae2enhanced:stable_spacetime_manifold>,
		<ae2enhanced:differential_form_stabilizer>*8,
		<contenttweaker:catalyst_of_natural_law>,
		<minecraft:enchanted_book>.withTag({StoredEnchantments: [{id: 51, lvl: 1 as short}]})
	],
    // fluid inputs
    [
		<liquid:nidhogg_dragonfire>*16000,
		<liquid:whisper_of_right_and_just_creation>*16000,
		<liquid:whisper_of_starvald_demelain>*16000,
		<liquid:twilight_matter>*16000,
		<liquid:copper>*16000,
		<liquid:blockfluiddirt>*16000
	],
    // outputs
    [
		<ae2enhanced:conformal_invariant_charge>*2
	],
    // fluid outputs
    [],
    // time, energy input, energy output
    20,
    0,
    0
);