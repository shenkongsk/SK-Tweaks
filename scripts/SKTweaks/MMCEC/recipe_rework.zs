#loader crafttweaker reloadable
import scripts.SKTweaks.lib.aaa_function;

// 无线通量输入仓
mods.extendedcrafting.TableCrafting.addShaped(2, <mmce_complement:flux_input_hatch>, [
	[null, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, null], 
	[<modularmachinery:blockcasing:4>, <fluxnetworks:fluxcore>, <modularmachinery:blockenergyinputhatch:7>, <fluxnetworks:fluxcore>, <modularmachinery:blockcasing:4>], 
	[<modularmachinery:blockcasing:4>, <modularmachinery:blockenergyinputhatch:7>, <contenttweaker:supercharged_signalum>, <modularmachinery:blockenergyinputhatch:7>, <modularmachinery:blockcasing:4>], 
	[<modularmachinery:blockcasing:4>, <fluxnetworks:fluxcore>, <modularmachinery:blockenergyinputhatch:7>, <fluxnetworks:fluxcore>, <modularmachinery:blockcasing:4>], 
	[null, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, null]
]);
// 无线通量输出仓
mods.extendedcrafting.TableCrafting.addShaped(2, <mmce_complement:flux_output_hatch>, [
	[null, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, null], 
	[<modularmachinery:blockcasing:4>, <fluxnetworks:fluxcore>, <modularmachinery:blockenergyoutputhatch:7>, <fluxnetworks:fluxcore>, <modularmachinery:blockcasing:4>], 
	[<modularmachinery:blockcasing:4>, <modularmachinery:blockenergyoutputhatch:7>, <contenttweaker:supercharged_signalum>, <modularmachinery:blockenergyoutputhatch:7>, <modularmachinery:blockcasing:4>], 
	[<modularmachinery:blockcasing:4>, <fluxnetworks:fluxcore>, <modularmachinery:blockenergyoutputhatch:7>, <fluxnetworks:fluxcore>, <modularmachinery:blockcasing:4>], 
	[null, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, null]
]);
// 样板供应器II
mods.extendedcrafting.TableCrafting.addShaped(2,<mmce_complement:me_pattern_provider_ii>, [
	[<ore:ingotUltimate>, <modularmachinery:blockcasing>, <modularmachinery:blockcasing>, <modularmachinery:blockcasing>, <ore:ingotUltimate>], 
	[<modularmachinery:blockcasing>, <contenttweaker:superconducting_sednanite>, <modularmachinery:blockmepatternprovider>, <contenttweaker:superconducting_sednanite>, <modularmachinery:blockcasing>], 
	[<modularmachinery:blockcasing>, <modularmachinery:blockmepatternprovider>, <contenttweaker:supercharged_signalum>, <modularmachinery:blockmepatternprovider>, <modularmachinery:blockcasing>], 
	[<modularmachinery:blockcasing>, <contenttweaker:superconducting_sednanite>, <modularmachinery:blockmepatternprovider>, <contenttweaker:superconducting_sednanite>, <modularmachinery:blockcasing>], 
	[<ore:ingotUltimate>, <modularmachinery:blockcasing>, <modularmachinery:blockcasing>, <modularmachinery:blockcasing>, <ore:ingotUltimate>]
]);
// ME链接共享仓
mods.extendedcrafting.TableCrafting.addShaped(2,<mmce_complement:me_connection_share_hatch>, [
	[null, <appliedenergistics2:fluix_block>, <appliedenergistics2:fluix_block>, <appliedenergistics2:fluix_block>, null], 
	[<appliedenergistics2:fluix_block>, <ore:crystalPureCertusQuartz>, <appliedenergistics2:material:47>, <ore:crystalPureCertusQuartz>, <appliedenergistics2:fluix_block>], 
	[<appliedenergistics2:fluix_block>, <appliedenergistics2:material:59>, <contenttweaker:supercharged_signalum>, <appliedenergistics2:material:59>, <appliedenergistics2:fluix_block>], 
	[<appliedenergistics2:fluix_block>, <ore:crystalPureCertusQuartz>, <appliedenergistics2:material:47>, <ore:crystalPureCertusQuartz>, <appliedenergistics2:fluix_block>], 
	[null, <appliedenergistics2:fluix_block>, <appliedenergistics2:fluix_block>, <appliedenergistics2:fluix_block>, null]
]);
// 库存物品输入总线
mods.extendedcrafting.TableCrafting.addShaped(2,<mmce_complement:me_item_inventory_input_bus>, [
	[null, <nuclearcraft:fission_block>, <nuclearcraft:fission_block>, <nuclearcraft:fission_block>, null], 
	[<nuclearcraft:fission_block>, <modularmachinery:blockmeiteminputbus>, <appliedenergistics2:material:47>, <modularmachinery:blockmeiteminputbus>, <nuclearcraft:fission_block>], 
	[<nuclearcraft:fission_block>, <appliedenergistics2:material:47>, <contenttweaker:supercharged_signalum>, <appliedenergistics2:material:47>, <nuclearcraft:fission_block>], 
	[<nuclearcraft:fission_block>, <modularmachinery:blockmeiteminputbus>, <appliedenergistics2:material:47>, <modularmachinery:blockmeiteminputbus>, <nuclearcraft:fission_block>], 
	[null, <nuclearcraft:fission_block>, <nuclearcraft:fission_block>, <nuclearcraft:fission_block>, null]
]);
// 库存流体输入总线
mods.extendedcrafting.TableCrafting.addShaped(2,<mmce_complement:me_fluid_inventory_input_bus>, [
	[null, <nuclearcraft:fission_block>, <nuclearcraft:fission_block>, <nuclearcraft:fission_block>, null], 
	[<nuclearcraft:fission_block>, <mmce_complement:me_fluid_inventory_input_bus>, <appliedenergistics2:material:47>, <mmce_complement:me_fluid_inventory_input_bus>, <nuclearcraft:fission_block>], 
	[<nuclearcraft:fission_block>, <appliedenergistics2:material:47>, <contenttweaker:supercharged_signalum>, <appliedenergistics2:material:47>, <nuclearcraft:fission_block>], 
	[<nuclearcraft:fission_block>, <mmce_complement:me_fluid_inventory_input_bus>, <appliedenergistics2:material:47>, <mmce_complement:me_fluid_inventory_input_bus>, <nuclearcraft:fission_block>], 
	[null, <nuclearcraft:fission_block>, <nuclearcraft:fission_block>, <nuclearcraft:fission_block>, null]
]);
// 库存矿辞输入总线
mods.extendedcrafting.TableCrafting.addShaped(2,<mmce_complement:me_ore_dict_input_bus>, [
	[null, <actuallyadditions:block_crystal_empowered:4>, <actuallyadditions:block_crystal_empowered:4>, <actuallyadditions:block_crystal_empowered:4>, null], 
	[<actuallyadditions:block_crystal_empowered:4>, <modularmachinery:blockmeiteminputbus>, <appliedenergistics2:material:47>, <modularmachinery:blockmeiteminputbus>, <actuallyadditions:block_crystal_empowered:4>], 
	[<actuallyadditions:block_crystal_empowered:4>, <appliedenergistics2:material:47>, <minecraft:book>, <appliedenergistics2:material:47>, <actuallyadditions:block_crystal_empowered:4>], 
	[<actuallyadditions:block_crystal_empowered:4>, <modularmachinery:blockmeiteminputbus>, <appliedenergistics2:material:47>, <modularmachinery:blockmeiteminputbus>, <actuallyadditions:block_crystal_empowered:4>], 
	[null, <actuallyadditions:block_crystal_empowered:4>, <actuallyadditions:block_crystal_empowered:4>, <actuallyadditions:block_crystal_empowered:4>, null]
]);