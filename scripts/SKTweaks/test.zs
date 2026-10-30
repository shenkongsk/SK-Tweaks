// #loader crafttweaker reloadable
// import mods.modularmachinery.MachineModifier;
// import mods.modularmachinery.RecipeAdapterBuilder;
// import mods.modularmachinery.RecipeModifierBuilder;
// import mods.modularmachinery.RecipeBuilder;
// import mods.modularmachinery.MMEvents;
// import mods.modularmachinery.ControllerGUIRenderEvent;
// import mods.modularmachinery.FactoryRecipeFinishEvent;
// import crafttweaker.item.IIngredient;
// import crafttweaker.liquid.ILiquidStack;
// import crafttweaker.oredict.IOreDictEntry;
// import crafttweaker.data.IData;
// import mods.ctutils.utils.Math;
// import crafttweaker.item.IItemStack;
// import mods.modularmachinery.RecipeCheckEvent;
// import mods.modularmachinery.FactoryRecipeThread;
// import crafttweaker.world.IFacing;
// import mods.modularmachinery.RecipeFinishEvent;
// import mods.modularmachinery.RecipeStartEvent;
// import mods.modularmachinery.FactoryRecipeStartEvent;
// import mods.modularmachinery.MachineController;
// import mods.contenttweaker.World;
// import mods.modularmachinery.IMachineController;
// import crafttweaker.world.IBlockPos;
// import crafttweaker.world.IWorld;
// import mods.modularmachinery.MachineStructureFormedEvent;


// var test_recipe_multi_sk = RecipeBuilder.newBuilder("test_recipe_multi_sk","test_machine",20);
// test_recipe_multi_sk
//     .addInput(<minecraft:stone>*1)
//     .addStartHandler(function(event as RecipeStartEvent) {
//         var ctrl = event.controller;
//         var data = ctrl.customData;
//         var pos = getOffsetPos(ctrl,-10,0,-8);
//         var world = ctrl.world;
//         world.setBlockState(<blockstate:contenttweaker:defined_block>, pos);
//     })
//     // .addOutputs(testpattern)
//     .build();
#loader crafttweaker reloadable

import native.slimeknights.tconstruct.library.TinkerRegistry;
import native.slimeknights.tconstruct.library.materials.Material;
import native.net.minecraftforge.fluids.Fluid;

// 获取所有已注册的匠魂材料 (Collection)
val allMaterials = TinkerRegistry.getAllMaterials();

// 转换为数组
val materialArray = allMaterials.toArray() as [Material];

print("========== Start scanning non-smeltery materials ==========");
var nonSmelteryCount = 0;

for i in 0 .. materialArray.length {
    val mat = materialArray[i];
    
    // 获取材料对应的熔融流体
    val fluid = mat.getFluid() as Fluid;
    
    // 如果流体为 null，说明该材料不能在冶炼炉中制作
    if (isNull(fluid)) {
        val identifier = mat.getIdentifier();
        print("[Non-Smeltery] Material ID: " + identifier);
        nonSmelteryCount += 1;
    }
}

print("========== Scan complete ==========");
print("Found " + nonSmelteryCount + " non-smeltery materials.");
/*
 [Non-Smeltery] Material ID: nagascale
 [Non-Smeltery] Material ID: steeleaf
 [Non-Smeltery] Material ID: raven_feather
 [Non-Smeltery] Material ID: _internal_render1
 [Non-Smeltery] Material ID: _internal_render2
 [Non-Smeltery] Material ID: _internal_render3
 [Non-Smeltery] Material ID: _internal_render4
 [Non-Smeltery] Material ID: _internal_renderstring
 [Non-Smeltery] Material ID: wood
 [Non-Smeltery] Material ID: stone
 [Non-Smeltery] Material ID: flint
 [Non-Smeltery] Material ID: cactus
 [Non-Smeltery] Material ID: bone
 [Non-Smeltery] Material ID: obsidian
 [Non-Smeltery] Material ID: prismarine
 [Non-Smeltery] Material ID: endstone
 [Non-Smeltery] Material ID: paper
 [Non-Smeltery] Material ID: sponge
 [Non-Smeltery] Material ID: firewood
 [Non-Smeltery] Material ID: slime
 [Non-Smeltery] Material ID: blueslime
 [Non-Smeltery] Material ID: magmaslime
 [Non-Smeltery] Material ID: netherrack
 [Non-Smeltery] Material ID: bloodbone
 [Non-Smeltery] Material ID: string
 [Non-Smeltery] Material ID: slimevine_blue
 [Non-Smeltery] Material ID: slimevine_purple
 [Non-Smeltery] Material ID: vine
 [Non-Smeltery] Material ID: blaze
 [Non-Smeltery] Material ID: reed
 [Non-Smeltery] Material ID: ice
 [Non-Smeltery] Material ID: endrod
 [Non-Smeltery] Material ID: feather
 [Non-Smeltery] Material ID: slimeleaf_blue
 [Non-Smeltery] Material ID: slimeleaf_orange
 [Non-Smeltery] Material ID: slimeleaf_purple
 [Non-Smeltery] Material ID: leaf
 [Non-Smeltery] Material ID: treatedwood
 [Non-Smeltery] Material ID: hemp
 [Non-Smeltery] Material ID: limonite_rod
 [Non-Smeltery] Material ID: torn_cloth
 [Non-Smeltery] Material ID: blood_infused_wood
 [Non-Smeltery] Material ID: abyssal_flesh
 [Non-Smeltery] Material ID: kaiyu
 [Non-Smeltery] Material ID: stone_endless_hunger
 [Non-Smeltery] Material ID: infused_dread_shard
 [Non-Smeltery] Material ID: neutronium
 [Non-Smeltery] Material ID: rebalanced_dark_matter
 [Non-Smeltery] Material ID: cosmic_balance
 [Non-Smeltery] Material ID: bloodwood
 [Non-Smeltery] Material ID: aesir_wood
 [Non-Smeltery] Material ID: yggdrasil_wood
 [Non-Smeltery] Material ID: hard_bone
 [Non-Smeltery] Material ID: crimson_warren_remains
 [Non-Smeltery] Material ID: omnibenevolent
 [Non-Smeltery] Material ID: extrabotany:ingotshadowium
 [Non-Smeltery] Material ID: extrabotany:ingotorichalcos
 [Non-Smeltery] Material ID: xu_magical_wood
 [Non-Smeltery] Material ID: mod_lavacow.moltenbeef
 [Non-Smeltery] Material ID: mod_lavacow.chitin
 [Non-Smeltery] Material ID: mod_lavacow.vespa_carapace
 [Non-Smeltery] Material ID: mod_lavacow.scythe_claw
 [Non-Smeltery] Material ID: mod_lavacow.ectoplasm
 [Non-Smeltery] Material ID: mod_lavacow.holy_sludge
 [Non-Smeltery] Material ID: mod_lavacow.ancient_amber
 [Non-Smeltery] Material ID: mod_lavacow.curseweave_fabric
 [Non-Smeltery] Material ID: mod_lavacow.hyphae
 [Non-Smeltery] Material ID: mod_lavacow.mossy_stick
 [Non-Smeltery] Material ID: mod_lavacow.cactus_thorn
 [Non-Smeltery] Material ID: mod_lavacow.poison_stinger
 [Non-Smeltery] Material ID: mod_lavacow.black_feather
 [Non-Smeltery] Material ID: dragonbone
 [Non-Smeltery] Material ID: desert_myrmex
 [Non-Smeltery] Material ID: jungle_myrmex
 [Non-Smeltery] Material ID: stymph_feather
 [Non-Smeltery] Material ID: amphithere_feather
 [Non-Smeltery] Material ID: weezer
 [Non-Smeltery] Material ID: ma.prosperity
 [Non-Smeltery] Material ID: boron_nitride
 [Non-Smeltery] Material ID: integrationforegoing.plastic
 [Non-Smeltery] Material ID: integrationforegoing.pink_slime
 [Non-Smeltery] Material ID: integrationforegoing.reinforced_pink_slime
 [Non-Smeltery] Material ID: gaia
 [Non-Smeltery] Material ID: quartzenrichediron
 [Non-Smeltery] Material ID: psigem
 [Non-Smeltery] Material ID: redmatter
 [Non-Smeltery] Material ID: ruby
 [Non-Smeltery] Material ID: sapphire
 [Non-Smeltery] Material ID: peridot
 [Non-Smeltery] Material ID: yellowgarnet
 [Non-Smeltery] Material ID: redgarnet
 [Non-Smeltery] Material ID: rubber
 [Non-Smeltery] Material ID: tnt
 [Non-Smeltery] Material ID: sapphire_aoa
 [Non-Smeltery] Material ID: jade
 [Non-Smeltery] Material ID: malachite_gem
 [Non-Smeltery] Material ID: amber
 [Non-Smeltery] Material ID: topaz
 [Non-Smeltery] Material ID: tanzanite
 [Non-Smeltery] Material ID: amethyst
 [Non-Smeltery] Material ID: blackquartz_plustic
 [Non-Smeltery] Material ID: void_actadd_plustic
 [Non-Smeltery] Material ID: enori_actadd_plustic
 [Non-Smeltery] Material ID: palis_actadd_plustic
 [Non-Smeltery] Material ID: emeradic_actadd_plustic
 [Non-Smeltery] Material ID: diamatine_actadd_plustic
 [Non-Smeltery] Material ID: certusquartz_plustic
 [Non-Smeltery] Material ID: fluixcrystal_plustic
 [Non-Smeltery] Material ID: mica
 [Non-Smeltery] Material ID: litherite
 [Non-Smeltery] Material ID: erodium
 [Non-Smeltery] Material ID: kyronite
 [Non-Smeltery] Material ID: pladium
 [Non-Smeltery] Material ID: ionite
 [Non-Smeltery] Material ID: aethium
 [Non-Smeltery] Material ID: livingwood_plustic
 [Non-Smeltery] Material ID: wyvern_plustic
 [Non-Smeltery] Material ID: awakened_plustic
 [Non-Smeltery] Material ID: chaotic_plustic
 [Non-Smeltery] Material ID: flamestring_plustic
 [Non-Smeltery] Material ID: fusewood_plustic
 [Non-Smeltery] Material ID: ghostwood_plustic
 [Non-Smeltery] Material ID: darkwood_plustic
 [Non-Smeltery] Material ID: pink_slime
*/