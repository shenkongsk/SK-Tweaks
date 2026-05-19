#loader crafttweaker reloadable

import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;

import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;




val MACHINE = "draconic_mythical_infusion";
MachineModifier.setMaxThreads("draconic_mythical_infusion",0);
val threadA = FactoryRecipeThread.createCoreThread("§e觉醒聚合器I");
val threadB = FactoryRecipeThread.createCoreThread("§e觉醒聚合器II");
val threadC = FactoryRecipeThread.createCoreThread("§e觉醒聚合器III");
MachineModifier.addCoreThread(MACHINE, threadA);
MachineModifier.addCoreThread(MACHINE, threadB);
MachineModifier.addCoreThread(MACHINE, threadC);
MachineModifier.setInternalParallelism("draconic_mythical_infusion", 64);
<modularmachinery:draconic_mythical_infusion_factory_controller>.addTooltip(format.gold("内置额外64并行！"));
<modularmachinery:draconic_mythical_infusion_factory_controller>.addTooltip(format.gold("内置额外3线程！"));
<modularmachinery:draconic_mythical_infusion_factory_controller>.addTooltip(format.gold("3x3的龙研能量核心稳定器可能需手动放置"));

function Draconic_Fusion_Recipe_Builder(
    recipeName as string,

    inputs as crafttweaker.item.IIngredient[],
    fluidInputs as crafttweaker.liquid.ILiquidStack[],

    outputs as crafttweaker.item.IIngredient[],
    fluidOutputs as crafttweaker.liquid.ILiquidStack[],

    energyinput as long,
    timeinput as int
)as void{
    val Machine_Name = "draconic_mythical_infusion";
    val Time_Consume = (timeinput == 0) ? 500 : timeinput;
    val Energy_Per_Tick = energyinput/Time_Consume;
    scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
        recipeName,
        Machine_Name,
        inputs,
        fluidInputs,
        outputs,
        fluidOutputs,
        Time_Consume,
        Energy_Per_Tick,
        0
    );
}

var Recipe_Inputs = [
    [<draconicevolution:crafting_injector:1>*1, <draconicevolution:wyvern_core>*2, <draconicevolution:draconic_block>*1, <contenttweaker:jeweled_runium>*4],
    [<minecraft:ender_eye>*1, <actuallyadditions:item_misc:19>*2, <minecraft:nether_star>*4],
    [<minecraft:ender_eye>*1, <contenttweaker:eden_core>*2, <minecraft:nether_star>*4],
    [<minecraft:ender_eye>*1, <contenttweaker:wildwood_core>*2, <minecraft:nether_star>*4],
    [<minecraft:ender_eye>*1, <contenttweaker:apalachia_core>*2, <minecraft:nether_star>*4],
    [<minecraft:ender_eye>*1, <contenttweaker:skythern_core>*2, <minecraft:nether_star>*4],
    [<minecraft:ender_eye>*1, <contenttweaker:mortum_core>*2, <minecraft:nether_star>*4],
    [<minecraft:nether_star>*1, <contenttweaker:rhenium_catalyst>*2, <iceandfire:dread_shard>*2],
    [<contenttweaker:realmstone>*1, <contenttweaker:myrmitite_catalyst>*2, <contenttweaker:tritium_chunk>*1, <nuclearcraft:americium:4>*1, <thebetweenlands:weeping_blue_petal>*2, <twilightforest:twilight_sapling:9>*2, <contenttweaker:candyland_artifact>*1],
    [<contenttweaker:realmstone>*1, <contenttweaker:myrmitite_catalyst>*2, <nuclearcraft:americium:4>*1, <contenttweaker:tritium_chunk>*1, <thebetweenlands:weeping_blue_petal>*2, <erebus:sapling_marshwood>*2, <contenttweaker:celeve_artifact>*1],
    [<contenttweaker:realmstone>*1, <contenttweaker:myrmitite_catalyst>*2, <nuclearcraft:americium:4>*1, <contenttweaker:tritium_chunk>*1, <twilightforest:twilight_sapling:9>*2, <erebus:sapling_marshwood>*2, <contenttweaker:gardencia_artifact>*1],
    [<contenttweaker:realmstone>*1, <contenttweaker:myrmitite_catalyst>*2, <nuclearcraft:americium:4>*1, <contenttweaker:tritium_chunk>*1, <twilightforest:twilight_sapling:9>*2, <divinerpg:frozen_sapling>*2, <contenttweaker:crystevia_artifact>*1],
    [<contenttweaker:realmstone>*1, <contenttweaker:myrmitite_catalyst>*2, <nuclearcraft:americium:4>*1, <contenttweaker:tritium_chunk>*1, <aether_legacy:golden_oak_sapling>*2, <erebus:sapling_marshwood>*2, <contenttweaker:haven_artifact>*1],
    [<contenttweaker:realmstone>*1, <contenttweaker:myrmitite_catalyst>*2, <nuclearcraft:americium:4>*1, <contenttweaker:tritium_chunk>*1, <aether_legacy:golden_oak_sapling>*2, <thebetweenlands:sapling_hearthgrove>*2, <contenttweaker:iromine_artifact>*1],
    [<contenttweaker:realmstone>*1, <contenttweaker:myrmitite_catalyst>*2, <nuclearcraft:americium:4>*1, <contenttweaker:tritium_chunk>*1, <erebus:sapling_mossbark>*2, <thebetweenlands:sapling_hearthgrove>*2, <contenttweaker:mysterium_artifact>*1],
    [<contenttweaker:realmstone>*1, <contenttweaker:myrmitite_catalyst>*2, <contenttweaker:tritium_chunk>*1, <nuclearcraft:americium:4>*1, <twilightforest:twilight_sapling:3>*2, <thebetweenlands:sapling_hearthgrove>*2, <contenttweaker:voxponds_artifact>*1],
    [<contenttweaker:realmstone>*1, <contenttweaker:mythic_machine_case>*2, <contenttweaker:universal_booster>*4, <contenttweaker:borean_artifact>*1, <extrabotany:blockshadowium>*1, <extrabotany:blockphotonium>*1],
    [<contenttweaker:realmstone>*1, <contenttweaker:mythic_machine_case>*2, <contenttweaker:universal_booster>*4, <contenttweaker:runandor_artifact>*1, <extrabotany:blockshadowium>*1, <extrabotany:blockphotonium>*1],
    [<contenttweaker:realmstone>*1, <contenttweaker:mythic_machine_case>*2, <contenttweaker:universal_booster>*4, <contenttweaker:lunalus_artifact>*1, <extrabotany:blockshadowium>*1, <extrabotany:blockphotonium>*1],
    [<contenttweaker:dark_soul_machine_chassis>*1, <bigreactors:mineralanglesite>*1, <bigreactors:mineralbenitoite>*1, <contenttweaker:mythic_excavation_engine>*2, <contenttweaker:refraction_focus_key>*2, <contenttweaker:instant_power_junction>*2, <contenttweaker:apalachia_core>*2],
    [<contenttweaker:dark_soul_machine_chassis>*1, <contenttweaker:cursed_sapphire>*2, <contenttweaker:mythic_excavation_engine>*2, <contenttweaker:refraction_focus_key>*2, <contenttweaker:instant_power_junction>*2, <contenttweaker:apalachia_core>*2],
    [<contenttweaker:dark_soul_machine_chassis>*1, <contenttweaker:mythic_excavation_engine>*4, <contenttweaker:refraction_focus_key>*3, <contenttweaker:instant_power_junction>*3, <contenttweaker:cursed_sapphire>*1, <contenttweaker:mythic_rare_earths_relativistic_condensate>*1],
    [<contenttweaker:unidentified_ingot>*1, <appliedenergistics2:material:38>*1, <ore:ingotBrightsteel>*1, <minecraft:diamond>*2, <contenttweaker:neodymium_magnetic_alloy>*2],
    [<contenttweaker:realmstone>*1, <avaritia:resource:1>*4, <contenttweaker:ancient_cavern_artifact>*1, <contenttweaker:unidentified_ingot>*3],
    [<contenttweaker:realmstone>*1, <avaritia:resource:1>*4, <contenttweaker:dustopia_artifact>*1, <contenttweaker:unidentified_ingot>*3],
    [<contenttweaker:realmstone>*1, <avaritia:resource:1>*4, <contenttweaker:greckon_artifact>*1, <contenttweaker:unidentified_ingot>*3],
    [<contenttweaker:realmstone>*1, <avaritia:resource:1>*4, <contenttweaker:immortallis_artifact>*1, <contenttweaker:unidentified_ingot>*3],
    [<contenttweaker:mythic_machine_case>*1, <avaritia:resource:4>*4, <contenttweaker:unidentified_plate>*2, <draconicevolution:draconic_block>*1, <thaumadditions:adaminite_block>*1],
    [<draconicevolution:draconic_core>*1, <minecraft:lapis_block>*4, <minecraft:diamond>*4],
    [<draconicevolution:draconium_ingot>*32, <minecraft:magma>*192],
    [<draconicevolution:draconium_ingot>*32, <minecraft:glowstone>*192],
    [<draconicevolution:draconium_block>*32, <minecraft:glowstone>*320],
    [<draconicevolution:draconium_block>*32, <minecraft:magma>*320],
    [<draconicevolution:draconium_ingot>*32, <minecraft:packed_ice>*192],
    [<draconicevolution:draconium_block>*32, <minecraft:packed_ice>*320],
    [<draconicevolution:chaos_shard:0>*1, <contenttweaker:apalachia_core>*2, <extrautils2:opinium:8>*2, <draconicevolution:draconic_block>*4],
    [<thermalfoundation:material:136>*1, <ore:dragonScaleItem>*2, <divinerpg:eden_heart>*2],
    [<thermalfoundation:material:136>*1, <ore:dragonScaleItem>*2, <divinerpg:wildwood_heart>*2],
    [<thermalfoundation:material:136>*1, <ore:dragonScaleItem>*2, <divinerpg:apalachia_heart>*2],
    [<thermalfoundation:material:136>*1, <ore:dragonScaleItem>*2, <divinerpg:skythern_heart>*2],
    [<thermalfoundation:material:136>*1, <ore:dragonScaleItem>*2, <divinerpg:mortum_heart>*2],
    [<avaritia:resource:4>*1, <contenttweaker:nethengeic_gem>*4],
    [<draconicevolution:chaos_shard:1>*1, <ore:ingotPromethium>*4],
    [<contenttweaker:everburning_seed>*1, <contenttweaker:recursive_convergence>*8],
    [<contenttweaker:aeldunari>*1, <iceandfire:dragonsteel_fire_ingot>*8],
    [<contenttweaker:aeldunari>*1, <iceandfire:dragonsteel_ice_ingot>*8],
    [<contenttweaker:aeldunari>*1, <iceandfire:dragonsteel_lightning_ingot>*8],
    [<contenttweaker:self_actualizing_warren_rift>*1, <contenttweaker:recursive_convergence>*4, <contenttweaker:singular_recursion>*4],
    [<contenttweaker:prophetic_paper>*1, <contenttweaker:essence_of_worthiness>*4],
    [<contenttweaker:harbinger_sentient_meatball>*1, <contenttweaker:possessed_fluix>*4, <draconicevolution:draconic_block>*4, <draconicevolution:chaotic_core>*2],
    [<contenttweaker:unidentified_ingot>*1, <appliedenergistics2:material:38>*1, <ore:ingotBrightsteel>*1, <contenttweaker:orichalcum_sliver>*2, <contenttweaker:neodymium_magnetic_alloy>*2],
    [<contenttweaker:unidentified_ingot>*1, <nae2:material:1>*1, <contenttweaker:brightsteel_alloy_ingot>*1, <ore:ingotBrightsteel>*1, <contenttweaker:orichalcum_sliver>*3, <contenttweaker:neodymium_magnetic_alloy>*4],
    [<contenttweaker:unidentified_ingot>*1, <nae2:material:2>*1, <contenttweaker:brightsteel_alloy_ingot>*1, <contenttweaker:hassium_alloy_ingot>*1, <contenttweaker:orichalcum_sliver>*3, <contenttweaker:neodymium_magnetic_alloy>*4],
    [<contenttweaker:unidentified_ingot>*1, <nae2:material:3>*1, <contenttweaker:brightseel_alloy_plate>*2, <contenttweaker:hassium_alloy_ingot>*2, <contenttweaker:orichalcum_sliver>*2, <contenttweaker:neodymium_magnetic_alloy>*3],
    [<contenttweaker:unidentified_ingot>*1, <nae2:material:4>*1, <contenttweaker:brightseel_alloy_plate>*2, <contenttweaker:hassium_alloy_ingot>*2, <contenttweaker:orichalcum_sliver>*2, <contenttweaker:defined_ingot>*1, <contenttweaker:neodymium_magnetic_alloy>*2],
    [<aoa3:rune_shrine:0>*1, <contenttweaker:stone_of_universal_balance>*3, <contenttweaker:cuendillar_plate>*3],
    [<contenttweaker:cuendillar_seal>*1, <contenttweaker:true_tongue_oath>*4, <contenttweaker:earthly_salvation>*2, <contenttweaker:ascended_fluix_crystal>*2, <contenttweaker:unleashed_triquetra>*4],
    [<contenttweaker:cuendillar_plate>*1, <contenttweaker:true_tongue_oath>*2, <contenttweaker:trinity_ingot>*2, <contenttweaker:unleashed_triquetra>*2],
    [<twilightforest:charm_of_keeping_3>*1, <contenttweaker:ichorium_void_stone>*4, <contenttweaker:meteoric_draconic_stone>*4],
    [<contenttweaker:fractal_stone>*1, <avaritiaitem:fractallite_halite_catalyst>*4, <contenttweaker:meteoric_draconic_stone>*4],
    [<contenttweaker:balanced_machine_casing>*1, <avaritiaitem:cosmic_balance>*4, <avaritiaitem:cosmic_halite_cluster>*4],
    [<contenttweaker:balanced_machine_casing>*1, <avaritiaitem:cosmic_balance>*4, <avaritiaitem:univocal_halite_cluster>*4],
    [<contenttweaker:cosmic_string>*1, <draconicevolution:chaotic_core>*4, <ore:ingotFractalliteHalite>*2, <contenttweaker:cuendillar_plate>*2],
    [<contenttweaker:core_of_halite_definition>*1, <draconicevolution:chaotic_core>*2, <contenttweaker:trinity_ingot>*2, <contenttweaker:freedomsteel_ingot>*4],
    [<contenttweaker:cuendillar_seal>*1, <contenttweaker:ingot_of_infinite_wishes>*4, <contenttweaker:freedom_definer>*2],
    [<contenttweaker:cuendillar_seal>*1, <contenttweaker:quasar_charged_gem>*8, <contenttweaker:wishful_definer>*2],
    [<contenttweaker:meatballium_reinforced_casing>*1, <contenttweaker:radiant_fissile_dust>*8],
    [<contenttweaker:defined_block>*1, <draconicevolution:chaos_shard:0>*6],
    [<contenttweaker:defined_draconium_block>*1, <contenttweaker:recursium_ingot>*2, <contenttweaker:chaos_wood>*1, <contenttweaker:order_wood>*1, <ore:ingotInfinity>*2],
    [<contenttweaker:balanced_draconium_block>*1, <contenttweaker:cuendillar_plate>*4, <avaritiaitem:fractallite_halite_catalyst>*2],
    [<contenttweaker:fractal_draconium_block>*1, <contenttweaker:ingot_of_infinite_wishes>*4, <contenttweaker:cuendillar_seal>*4],
    [<draconicevolution:crafting_injector:0>*1, <draconicevolution:wyvern_core>*3, <draconicevolution:draconic_core>*6, <draconicevolution:draconic_block>*1, <contenttweaker:cursed_sapphire>*2],
    [<draconicevolution:crafting_injector:0>*1, <contenttweaker:wyvern_fulcrum>*3, <contenttweaker:draconic_fulcrum>*6, <ore:ingotShyrestone>*1, <contenttweaker:cursed_sapphire>*2],
    [<draconicevolution:crafting_injector:0>*1, <contenttweaker:wyvern_fulcrum>*3, <contenttweaker:draconic_fulcrum>*6, <ore:ingotInfinity>*1, <contenttweaker:cursed_sapphire>*2],
    [<draconicevolution:crafting_injector:1>*1, <draconicevolution:wyvern_core>*6, <botania:storage:4>*1, <contenttweaker:corrupted_aragonite>*1, <contenttweaker:jeweled_runium>*4],
    [<draconicevolution:crafting_injector:1>*1, <contenttweaker:wyvern_fulcrum>*6, <ore:ingotInfinity>*1, <contenttweaker:corrupted_aragonite>*1, <contenttweaker:jeweled_runium>*4],
    [<draconicevolution:crafting_injector:1>*1, <contenttweaker:wyvern_fulcrum>*6, <contenttweaker:trinity_nugget>*1, <contenttweaker:corrupted_aragonite>*1, <contenttweaker:jeweled_runium>*4],
    [<draconicevolution:crafting_injector:2>*1, <draconicevolution:chaotic_core>*3, <minecraft:dragon_egg>*3, <rftools:infused_diamond>*4, <contenttweaker:opalescent_matter>*2],
    [<draconicevolution:crafting_injector:2>*1, <contenttweaker:chaotic_fulcrum>*3, <minecraft:dragon_egg>*3, <rftools:infused_diamond>*2, <contenttweaker:trinity_nugget>*2, <contenttweaker:opalescent_matter>*2],
    [<draconicevolution:crafting_injector:2>*1, <contenttweaker:chaotic_fulcrum>*4, <minecraft:dragon_egg>*2, <rftools:infused_diamond>*2, <contenttweaker:trinity_nugget>*2, <contenttweaker:dust_of_infinite_wishes>*2],
    [<contenttweaker:alchemical_condensate>*1, <draconicevolution:draconic_block>*1, <ore:ingotBloodInfusedIron>*1],
    [<contenttweaker:compressed_alchemical_condensate>*1, <draconicevolution:draconic_block>*2, <ore:ingotBloodInfusedIron>*1],
    [<contenttweaker:double_compressed_alchemical_condensate>*1, <draconicevolution:draconic_block>*3, <ore:ingotBloodInfusedIron>*1],
    [<contenttweaker:triple_compressed_alchemical_condensate>*1, <draconicevolution:draconic_block>*4, <ore:ingotBloodInfusedIron>*1],
    [<contenttweaker:quadruple_compressed_alchemical_condensate>*1, <draconicevolution:draconic_block>*5, <ore:ingotBloodInfusedIron>*1],
    [<contenttweaker:quintuple_compressed_alchemical_condensate>*1, <draconicevolution:draconic_block>*6, <ore:ingotBloodInfusedIron>*1],
    [<contenttweaker:sextuple_compressed_alchemical_condensate>*1, <draconicevolution:draconic_block>*7, <ore:ingotBloodInfusedIron>*1],
    [<draconicevolution:draconic_ingot>*4,<draconicevolution:chaotic_core>,<draconicevolution:reactor_part:3>,<draconicevolution:reactor_part:4>,<draconicevolution:draconic_energy_core>],
    [<aoa3:rune_shrine>*1,<contenttweaker:cuendillar_plate>*8,<contenttweaker:one_power_unleashed_emerald>*2]
];
var Recipe_Outputs = [
    [<draconicevolution:crafting_injector:2>*1],
    [<contenttweaker:divination_catalyst>*1],
    [<contenttweaker:divination_catalyst>*4],
    [<contenttweaker:divination_catalyst>*8],
    [<contenttweaker:divination_catalyst>*16],
    [<contenttweaker:divination_catalyst>*32],
    [<contenttweaker:divination_catalyst>*64],
    [<contenttweaker:myrmex_artifact>*1],
    [<aoa3:candyland_realmstone>*1],
    [<aoa3:celeve_realmstone>*1],
    [<aoa3:gardencia_realmstone>*1],
    [<aoa3:crystevia_realmstone>*1],
    [<aoa3:haven_realmstone>*1],
    [<aoa3:iromine_realmstone>*1],
    [<aoa3:mysterium_realmstone>*1],
    [<aoa3:vox_ponds_realmstone>*1],
    [<aoa3:borean_realmstone>*1],
    [<aoa3:runandor_realmstone>*1],
    [<aoa3:lunalus_realmstone>*1],
    [<contenttweaker:mythic_excavation_computer>*1],
    [<contenttweaker:mythic_excavation_computer>*3],
    [<contenttweaker:mythic_excavation_computer>*6],
    [<avaritia:resource:0>*1],
    [<aoa3:ancient_cavern_realmstone>*1],
    [<aoa3:dustopia_realmstone>*1],
    [<aoa3:greckon_realmstone>*1],
    [<aoa3:immortallis_realmstone>*1],
    [<contenttweaker:neutronium_bombarder>*1],
    [<draconicevolution:fusion_crafting_core>*1],
    [<iceandfire:dragonsteel_fire_ingot>*32],
    [<iceandfire:dragonsteel_lightning_ingot>*32],
    [<iceandfire:dragonsteel_lightning_block>*32],
    [<iceandfire:dragonsteel_fire_block>*32],
    [<iceandfire:dragonsteel_ice_ingot>*32],
    [<iceandfire:dragonsteel_ice_block>*32],
    [<draconicevolution:reactor_core>*1],
    [<contenttweaker:awakened_mithril>*4],
    [<contenttweaker:awakened_mithril>*8],
    [<contenttweaker:awakened_mithril>*16],
    [<contenttweaker:awakened_mithril>*32],
    [<contenttweaker:awakened_mithril>*64],
    [<contenttweaker:flerovium_matrix>*1],
    [<contenttweaker:promethium_shard>*1],
    [<contenttweaker:recursion_of_notbeinganoob>*1],
    [<iceandfire:fire_dragon_heart>*1],
    [<iceandfire:ice_dragon_heart>*1],
    [<iceandfire:lightning_dragon_heart>*1],
    [<contenttweaker:essence_of_worthiness>*1],
    [<contenttweaker:recursion_of_worthiness>*1],
    [<contenttweaker:chaotic_sentient_meatball>*1],
    [<avaritia:resource:0>*4],
    [<avaritia:resource:0>*12],
    [<avaritia:resource:0>*36],
    [<contenttweaker:diamond_matrix>*3],
    [<contenttweaker:diamond_matrix>*9],
    [<contenttweaker:cuendillar_seal>*1],
    [<contenttweaker:key_of_restored_balance>*1],
    [<contenttweaker:trinity_fabrial>*1],
    [<contenttweaker:charm_of_the_falling_tower>*1],
    [<contenttweaker:fractallite_halite_stone>*1],
    [<contenttweaker:catalyst_of_balance>*1],
    [<contenttweaker:catalyst_of_balance>*1],
    [<contenttweaker:cosmic_string_conduit>*1],
    [<contenttweaker:freedom_definer>*1],
    [<contenttweaker:wishful_definer>*1],
    [<contenttweaker:quasar_charged_core_of_definition>*1],
    [<contenttweaker:radiant_meatballium_reinforced_casing>*1],
    [<contenttweaker:defined_draconium_block>*1],
    [<contenttweaker:balanced_draconium_block>*1],
    [<contenttweaker:fractal_draconium_block>*1],
    [<contenttweaker:endlessly_wishing_draconium_block>*1],
    [<draconicevolution:crafting_injector:1>*4],
    [<draconicevolution:crafting_injector:1>*8],
    [<draconicevolution:crafting_injector:1>*16],
    [<draconicevolution:crafting_injector:2>*4],
    [<draconicevolution:crafting_injector:2>*8],
    [<draconicevolution:crafting_injector:2>*16],
    [<draconicevolution:crafting_injector:3>*4],
    [<draconicevolution:crafting_injector:3>*8],
    [<draconicevolution:crafting_injector:3>*16],
    [<contenttweaker:alchemical_innervation>*2],
    [<contenttweaker:compressed_alchemical_innervation>*2],
    [<contenttweaker:double_compressed_alchemical_innervation>*2],
    [<contenttweaker:triple_compressed_alchemical_innervation>*2],
    [<contenttweaker:quadruple_compressed_alchemical_innervation>*2],
    [<contenttweaker:quintuple_compressed_alchemical_innervation>*2],
    [<contenttweaker:sextuple_compressed_alchemical_innervation>*2],
    [<draconicevolution:reactor_component>*1],
    [<contenttweaker:cuendillar_seal>*4]
];
var Recipe_Energy as long[] = [
    256000 as long,     // 1. 注射器升级 (draconicevolution:crafting_injector,1,2)
    2560000 as long,     // 2. divination_catalyst
    2560000 as long,     // 3. divination_catalyst*4
    2560000 as long,     // 4. divination_catalyst*8
    2560000 as long,     // 5. divination_catalyst*16
    2560000 as long,     // 6. divination_catalyst*32
    2560000 as long,     // 7. divination_catalyst*64
    500000 as long,     // 8. myrmex_artifact
    1000000 as long,    // 9. candyland_realmstone
    1000000 as long,    // 10. celeve_realmstone
    1000000 as long,    // 11. gardencia_realmstone
    1000000 as long,    // 12. crystevia_realmstone
    1000000 as long,    // 13. haven_realmstone
    1000000 as long,    // 14. iromine_realmstone
    1000000 as long,    // 15. mysterium_realmstone
    1000000 as long,    // 16. vox_ponds_realmstone
    18000000 as long,   // 17. borean_realmstone
    18000000 as long,   // 18. runandor_realmstone
    18000000 as long,   // 19. lunalus_realmstone
    900000000 as long,  // 20. mythic_excavation_computer (基础)
    900000000 as long,  // 21. mythic_excavation_computer*3
    900000000 as long,  // 22. mythic_excavation_computer*6
    30000000 as long,    // 23. avaritia:resource,1,0
    50000000 as long,   // 24. ancient_cavern_realmstone
    50000000 as long,   // 25. dustopia_realmstone
    50000000 as long,   // 26. greckon_realmstone
    50000000 as long,   // 27. immortallis_realmstone
    100000000 as long,  // 28. neutronium_bombarder
    10000 as long,      // 29. fusion_crafting_core
    3200000 as long,     // 30. dragonsteel_fire_ingot
    3200000 as long,     // 31. dragonsteel_lightning_ingot
    3200000 as long,     // 32. dragonsteel_lightning_block
    3200000 as long,     // 33. dragonsteel_fire_block
    3200000 as long,     // 34. dragonsteel_ice_ingot
    3200000 as long,     // 35. dragonsteel_ice_block
    9000000 as long,    // 36. reactor_core
    100000 as long,     // 37. awakened_mithril*4
    100000 as long,     // 38. awakened_mithril*8
    100000 as long,     // 39. awakened_mithril*16
    100000 as long,     // 40. awakened_mithril*32
    100000 as long,     // 41. awakened_mithril*64
    1000000 as long,    // 42. flerovium_matrix
    400000000 as long,  // 43. promethium_shard
    512000000000000 as long, // 44. recursion_of_notbeinganoob
    1000000 as long,    // 45. fire_dragon_heart
    1000000 as long,    // 46. ice_dragon_heart
    1000000 as long,    // 47. lightning_dragon_heart
    512000000000000 as long, // 48. essence_of_worthiness
    256000000000000 as long, // 49. recursion_of_worthiness
    640000000000000 as long, // 50. chaotic_sentient_meatball
    30000000 as long,   // 51. avaritia:resource,4,0
    30000000 as long,   // 52. avaritia:resource,12,0
    30000000 as long,   // 53. avaritia:resource,36,0
    300000000 as long,   // 54. diamond_matrix*3
    300000000 as long,   // 55. diamond_matrix*9
    4800000000 as long,  // 56. cuendillar_seal
    768000000000000 as long, // 57. key_of_restored_balance
    38400000000 as long, // 58. trinity_fabrial
    16000000000 as long, // 59. charm_of_the_falling_tower
    160000000000 as long, // 60. fractallite_halite_stone
    160000000000 as long, // 61. catalyst_of_balance (cosmic_halite_cluster)
    160000000000 as long, // 62. catalyst_of_balance (univocal_halite_cluster)
    320000000000 as long, // 63. cosmic_string_conduit
    80000000000 as long, // 64. freedom_definer
    60000000000 as long, // 65. wishful_definer
    100000000000 as long, // 66. quasar_charged_core_of_definition
    80000000000 as long, // 67. radiant_meatballium_reinforced_casing
    60000000000 as long, // 68. defined_draconium_block
    60000000 as long,    // 69. balanced_draconium_block
    600000000 as long,   // 70. fractal_draconium_block
    8000000000 as long,  // 71. endlessly_wishing_draconium_block
    128000 as long,      // 72. crafting_injector,4,1
    256000 as long,      // 73. crafting_injector,8,1
    256000 as long,      // 74. crafting_injector,16,1
    128000 as long,      // 75. crafting_injector,4,2
    256000 as long,      // 76. crafting_injector,8,2
    256000 as long,      // 77. crafting_injector,16,2
    128000 as long,      // 78. crafting_injector,4,3
    256000 as long,      // 79. crafting_injector,8,3
    256000 as long,      // 80. crafting_injector,16,3
    2000 as long,        // 81. alchemical_innervation*2
    3000 as long,        // 82. compressed_alchemical_innervation*2
    4000 as long,        // 83. double_compressed_alchemical_innervation*2
    5000 as long,        // 84. triple_compressed_alchemical_innervation*2
    6000 as long,        // 85. quadruple_compressed_alchemical_innervation*2
    7000 as long,        // 86. quintuple_compressed_alchemical_innervation*2
    8000 as long,        // 87. sextuple_compressed_alchemical_innervation*2
    128000000 as long,    // 88. 反应堆稳定器
    8000000000 as long    // 89. cuendillar_seal*4
];
// 上三个列表长度一样，下面循环读取时一起读取
for i in 0 to Recipe_Inputs.length  {
    var recipeName = "dfr_auto_builder_" + i;
    var inputs = Recipe_Inputs[i];          // 输入物品数组（第一个是催化剂，其余为材料）
    var outputs = Recipe_Outputs[i];        // 输出物品数组（通常只有一个物品）
    var energy = Recipe_Energy[i];          // 能量消耗
    // var energy = 100;
    Draconic_Fusion_Recipe_Builder(
        recipeName,
        inputs,
        [],         // 无流体输入
        outputs,
        [],         // 无流体输出
        energy,
        0
    );
}
var Recipe_Custom = [
    [ [<contenttweaker:jade_egg>*64], [<aoa3:jade>*32] ],
    [ [<contenttweaker:amethyst_egg>*64], [<aoa3:amethyst>*32] ],
    [ [<contenttweaker:runium_egg>*64], [<aoa3:runium_chunk>*32] ],
    [ [<contenttweaker:sapphire_egg>*64], [<aoa3:sapphire>*32] ],
    [ [<contenttweaker:limonite_egg>*64], [<aoa3:limonite_ingot>*32] ],
    [ [<contenttweaker:rosite_egg>*64], [<aoa3:rosite_ingot>*32] ],
    [ [<contenttweaker:realmite_egg>*64], [<divinerpg:realmite_ingot>*32] ],
    [ [<contenttweaker:arlemite_egg>*64], [<divinerpg:arlemite_ingot>*32] ],
    [ [<contenttweaker:rupee_egg>*64], [<divinerpg:rupee_ingot>*32] ],
    [ [<contenttweaker:bloodgem_egg>*64], [<divinerpg:bloodgem>*32] ],
    [ [<contenttweaker:netherite_egg>*64], [<divinerpg:netherite_ingot>*32] ],
    [ [<contenttweaker:emberstone_egg>*64], [<aoa3:emberstone_ingot>*32] ],
    [ [<contenttweaker:amber_egg>*64], [<thaumcraft:amber>*32] ],
    [ [<thermalfoundation:fertilizer:1>*64], [<thermalfoundation:fertilizer:2>*64] ],
    [ [<thermalfoundation:material:645>*64], [<contenttweaker:charged_signalum>*64] ],
    [ [<extracells:fluidfiller>*64], [<contenttweaker:irradiated_filler>*64] ],
    [ [<appliedenergistics2:material>*64], [<appliedenergistics2:material:1>*64] ]
];

for i in 0 to Recipe_Custom.length{
    val recipe = Recipe_Custom[i];
    val inputs = recipe[0];
    val outputs = recipe[1];
    var energy = 100000;
    Draconic_Fusion_Recipe_Builder(
        "dfr_auto_thermal_builder_" + i,
        inputs,
        [],          // 无流体输入
        outputs,
        [],          // 无流体输出
        energy,
        1
    );
}

//  小型充能继承配方 时间加倍
RecipeAdapterBuilder.create("modularmachinery:small_draconic_mythical_infusion", "modularmachinery:draconic_mythical_infusion")
    .addModifier(RecipeModifierBuilder.create("modularmachinery:duration", "input", 10, 1, false).build())
    .addModifier(RecipeModifierBuilder.create("modularmachinery:energy", "input", 0.1, 1, false).build())
    .setMaxThreads(1)
    .build();
// 继承充能台
RecipeAdapterBuilder.create("modularmachinery:draconic_mythical_infusion", "modularmachinery:mythic_processor_empowerer")
    .addModifier(RecipeModifierBuilder.create("modularmachinery:duration", "input", 0.5, 1, true).build())
    .setMaxThreads(1)
    .build();
