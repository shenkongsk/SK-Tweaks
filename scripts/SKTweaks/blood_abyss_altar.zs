#loader crafttweaker reloadable
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;

// import crafttweaker.item.IIngredient;
// import crafttweaker.liquid.ILiquidStack;


// ==================== 机器配置 ====================
val MACHINE = "blood_abyss_altar";
MachineModifier.setMaxThreads(MACHINE, 0); 
val threadA = FactoryRecipeThread.createCoreThread("§4转化线程I");
val threadB = FactoryRecipeThread.createCoreThread("§4转化线程II");
val threadC = FactoryRecipeThread.createCoreThread("§4转化线程III");
val threadD = FactoryRecipeThread.createCoreThread("§4转化线程IV");
val threadE = FactoryRecipeThread.createCoreThread("§4转化线程V");
val threadF = FactoryRecipeThread.createCoreThread("§4转化线程VI");
val threadG = FactoryRecipeThread.createCoreThread("§4转化线程VII");
val threadH = FactoryRecipeThread.createCoreThread("§4转化线程VIII");
val threadI = FactoryRecipeThread.createCoreThread("§4转化线程IX");
val threadJ = FactoryRecipeThread.createCoreThread("§4转化线程X");
MachineModifier.addCoreThread(MACHINE, threadA);
MachineModifier.addCoreThread(MACHINE, threadB);
MachineModifier.addCoreThread(MACHINE, threadC);
MachineModifier.addCoreThread(MACHINE, threadD);
MachineModifier.addCoreThread(MACHINE, threadE);
MachineModifier.addCoreThread(MACHINE, threadF);
MachineModifier.addCoreThread(MACHINE, threadG);
MachineModifier.addCoreThread(MACHINE, threadH);
MachineModifier.addCoreThread(MACHINE, threadI);
MachineModifier.addCoreThread(MACHINE, threadJ);
MachineModifier.setInternalParallelism("blood_abyss_altar", 1024);
<modularmachinery:blood_abyss_altar_factory_controller>.addTooltip(format.red("内置额外1024并行！"));
<modularmachinery:blood_abyss_altar_factory_controller>.addTooltip(format.red("内置10线程！"));
//blood_abyss_altar_factory_controller
function Blood_Alter_SK_Recipe_Builder(
    RecipeName as string,
    inputs as crafttweaker.item.IIngredient[],
    fluidInputs as crafttweaker.liquid.ILiquidStack[],
    outputs as crafttweaker.item.IIngredient[]
) as void {
    val Machine_Name = "blood_abyss_altar";
    val Process_Time = 100 as long;
    val Energy_Input = 2000000 as long;
    scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
        RecipeName,
        Machine_Name,
        inputs,
        fluidInputs,
        outputs,
        [],
        Process_Time,
        Energy_Input,
        0
    );
}
// ==================== 配方数组定义 ====================
var Recipe_Inputs_Item = [
    [<bloodmagic:blood_rune:7>],
    [<contenttweaker:deep_slate_catalyst>],
    [<contenttweaker:blank_slate_catalyst>],
    [<contenttweaker:reinforced_slate_catalyst>],
    [<contenttweaker:imbued_slate_catalyst>],
    [<contenttweaker:demonic_slate_catalyst>],
    [<advancedrocketry:aliensapling>],
    [<contenttweaker:dimensional_ingot>*10],
    [<ebwizardry:magic_crystal:0>],
    [<contenttweaker:stone_of_endless_hunger>],
    [<contenttweaker:stone_of_unbound_hunger>],
    [<contenttweaker:infinity_seed>],
    [<bewitchment:salt>*64],
    [<contenttweaker:fragment_of_unraveling>],
    [<iceandfire:dread_shard>],
    [<minecraft:stone>*256],
    [<bloodmagic:slate>*256],
    [<bloodmagic:slate:1>*256],
    [<bloodmagic:slate:2>*256],
    [<bloodmagic:slate:3>*256],
    [<ore:logWood>*256],
    [<minecraft:glowstone_dust>*64],
    [<bloodarsenal:base_item:3>*64],
    [<bloodmagic:lava_crystal>*64],
    
    // 屠龙者输入
    [<ore:gemMalachite>*64],
    [<ore:gemPeridot>*64],
    [<ore:gemTopaz>*64],
    [<ore:gemRuby>*64],
    [<ore:gemTanzanite>*64],
    [<minecraft:redstone>*64, <ore:dyeWhite>*64, <ore:gunpowder>*64, <minecraft:coal>*64],
    [<ore:ingotIron>*64, <bloodarsenal:base_item:2>*64, <bloodmagic:component:8>*64],
    [<ore:dustGlowstone>*64, <ore:dustRedstone>*64, <ore:nuggetGold>*64, <ore:gunpowder>*64],
    [<ore:gemDiamond>*64, <minecraft:dragon_breath>*64, <bloodarsenal:blood_infused_glowstone>*64],
    [<contenttweaker:xxeus_stone>*64, <contenttweaker:eldritch_will_crystal>*64, <divinerpg:mortum_heart>*64, <divinerpg:mortum_chunk>*64],
    [<contenttweaker:naquadah_chunk>*64, <contenttweaker:faultless_ichor>*64, <contenttweaker:concentrated_essence>*64, <bewitchment:demon_heart>*64],
    [<contenttweaker:naquadah_chunk>*2048, <contenttweaker:faultless_ichor>*2048, <contenttweaker:soul_of_kashan>*64, <bewitchment:demon_heart>*2048],
    [<contenttweaker:psichic_stone>*64, <ore:ingotElectrumFlux>*64, <extrautils2:magicapple>*64, <thaumicwonders:panacea:1>*64],
    [<contenttweaker:psichic_stone>*64, <ore:gemCrystalFlux>*64, <extrautils2:magicapple>*64, <thaumicwonders:panacea:1>*64],
    [<contenttweaker:ender_dolomite>*64, <ore:blockTungstensteel>*64, <ore:ballMelodicAlloy>*64, <divinerpg:apalachia_chunk>*64],
    [<bloodmagic:item_demon_crystal:0>*256],
    [<bloodmagic:item_demon_crystal:1>*256],
    [<bloodmagic:item_demon_crystal:2>*256],
    [<bloodmagic:item_demon_crystal:3>*256],
    [<bloodmagic:item_demon_crystal:4>*256],
    [<minecraft:sugar>*64, <minecraft:crafting_table>*64, <minecraft:dispenser>*64, <minecraft:brick_block>*64],
    [<minecraft:iron_bars>*64, <minecraft:ender_pearl>*64, <minecraft:glass_bottle>*64, <minecraft:end_stone>*64],
    [<thaumcraft:elemental_pick>*64, <avaritia:infinity_pickaxe>*64, <minecraft:iron_pickaxe>*64, <abyssalcraft:dreadiumpickaxe>*64],
    [<ore:treeSapling>*64, <ore:treeLeaves>*64, <minecraft:tallgrass:*>*64, <ore:foodCooked>*64],
    [<ore:sand>*64, <minecraft:fishing_rod>*64, <minecraft:ghast_tear>*64],
    [<minecraft:end_stone>*64, <minecraft:ender_pearl>*64, <minecraft:obsidian>*64, <minecraft:chest>*64],
    [<bloodmagic:component:0>*64, <minecraft:prismarine_shard>*64, <minecraft:glass_bottle>*64, <ore:fish>*64],
    [<bloodmagic:component:17>*64, <minecraft:ender_eye>*64, <minecraft:ender_chest>*64, <minecraft:end_crystal>*64],
    [<bloodarsenal:base_item:8>*64, <bloodmagic:decorative_brick:2>*64, <avaritia:block_resource:1>*64, <ore:ingotFractalliteHalite>*64],
    [<minecraft:sugar>*64],
    [<minecraft:redstone>*64, <ore:cobblestone>*64, <ore:blockCoal>*64],
    [<minecraft:ghast_tear>*64, <ore:feather>*64, <ore:feather>*64],
    [<minecraft:iron_pickaxe>*64, <minecraft:iron_axe>*64, <minecraft:iron_shovel>*64, <minecraft:gunpowder>*64],
    [<minecraft:bucket>*64, <minecraft:string>*64, <minecraft:string>*64, <minecraft:gunpowder>*64],
    [<ore:treeSapling>*64, <ore:treeSapling>*64, <ore:sugarcane>*64, <minecraft:sugar>*64],
    [<minecraft:obsidian>*64],
    [<ore:blockIron>*64, <ore:blockGold>*64, <ore:blockRedstone>*64, <bloodmagic:component:8>*64],
    [<ore:blockGlass>*64, <ore:blockGlass>*64, <minecraft:glowstone_dust>*64],
    [<bloodmagic:teleposer>*64, <minecraft:blaze_rod>*64],
    [<ore:glowstone>*64, <minecraft:torch>*64, <minecraft:redstone>*64, <minecraft:redstone>*64],
    [<ore:blockIron>*64, <minecraft:string>*64, <minecraft:gold_ingot>*64, <minecraft:gold_ingot>*64],
    [<ore:stone>*64, <minecraft:sugar>*64, <minecraft:cookie>*64, <minecraft:cookie>*64],
    [<ore:blockIron>*64, <ore:blockGold>*64, <minecraft:obsidian>*64, <ore:cobblestone>*64],
    [<ore:stone>*64, <minecraft:obsidian>*64, <minecraft:soul_sand>*64, <minecraft:soul_sand>*64],
    [<minecraft:ender_eye>*64, <minecraft:ender_pearl>*64, <minecraft:gold_ingot>*64, <minecraft:gold_ingot>*64],
    [<bloodmagic:teleposer>*64, <ore:glowstone>*64, <ore:blockRedstone>*64, <minecraft:gold_ingot>*64],
    [<bloodmagic:teleposer>*64, <ore:gemDiamond>*64, <minecraft:ender_pearl>*64, <minecraft:obsidian>*64],
    [<ore:chestWood>*64, <minecraft:leather>*64, <minecraft:string>*64, <minecraft:string>*64],
    [<bloodmagic:cutting_fluid>*64, <minecraft:flint>*64, <minecraft:flint>*64],
    [<minecraft:slime>*64, <minecraft:slime>*64, <minecraft:leather>*64, <minecraft:string>*64],
    [<minecraft:snowball>*64, <minecraft:snowball>*64, <minecraft:ice>*64, <minecraft:redstone>*64],
    [<ore:ingotIron>*64, <bloodarsenal:base_item:2>*64, <bloodmagic:component:8>*64, <contenttweaker:stone_of_life_essence>*64],
    [<ore:gemDiamond>*64, <minecraft:dragon_breath>*64, <bloodarsenal:blood_infused_glowstone>*64, <contenttweaker:stone_of_life_essence>*64],
    [<ore:sand>*64, <minecraft:packed_ice>*64, <minecraft:fishing_rod>*64, <minecraft:ghast_tear>*64],
    [<minecraft:packed_ice>*64, <tconstruct:firewood>*64, <contenttweaker:hydrogen_crystal>*256, <minecraft:obsidian>*64],
    [<minecraft:sugar>*64, <minecraft:packed_ice>*64, <minecraft:packed_ice>*64],
    [<minecraft:packed_ice>*64, <tconstruct:firewood>*64, <bloodmagic:teleposer>*64, <minecraft:blaze_rod>*64],
    [<ore:ingotLumium>*256, <ore:blockGlass>*64, <ore:blockGlass>*64, <minecraft:glowstone_dust>*64],
    [<tconstruct:firewood>*64, <minecraft:redstone>*64, <ore:cobblestone>*64, <ore:blockCoal>*64],
    [<contenttweaker:blank_slate_catalyst>*64, <aoa3:bloodstone>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:blank_slate_catalyst>*64, <aoa3:crystallite>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:blank_slate_catalyst>*64, <aoa3:shyregem>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:blank_slate_catalyst>*64, <contenttweaker:eternal_dragonfire_gem>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:reinforced_slate_catalyst>*64, <aoa3:bloodstone>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:reinforced_slate_catalyst>*64, <aoa3:crystallite>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:reinforced_slate_catalyst>*64, <aoa3:shyregem>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:reinforced_slate_catalyst>*64, <contenttweaker:eternal_dragonfire_gem>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:imbued_slate_catalyst>*64, <aoa3:bloodstone>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:imbued_slate_catalyst>*64, <aoa3:crystallite>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:imbued_slate_catalyst>*64, <aoa3:shyregem>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:imbued_slate_catalyst>*64, <contenttweaker:eternal_dragonfire_gem>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:demonic_slate_catalyst>*64, <aoa3:bloodstone>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:demonic_slate_catalyst>*64, <aoa3:crystallite>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:demonic_slate_catalyst>*64, <aoa3:shyregem>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:demonic_slate_catalyst>*64, <contenttweaker:eternal_dragonfire_gem>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:ethereal_slate_catalyst>*64, <aoa3:bloodstone>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:ethereal_slate_catalyst>*64, <aoa3:crystallite>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:ethereal_slate_catalyst>*64, <aoa3:shyregem>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:ethereal_slate_catalyst>*64, <contenttweaker:eternal_dragonfire_gem>*64, <ore:nuggetBloodmasterMetal>*64, <tombstone:crafting_ingredient:3>*64],
    [<contenttweaker:psichic_stone>*64, <ore:blockElectrumFlux>*64, <extrautils2:magicapple>*768, <thaumicwonders:panacea:1>*256],
    [<contenttweaker:xxeus_stone>*64, <contenttweaker:eldritch_will_crystal>*64, <divinerpg:mortum_heart>*64, <contenttweaker:warren_chunk>*256],
    [<contenttweaker:xxeus_stone>*64, <contenttweaker:eldritch_will_crystal>*64, <divinerpg:mortum_heart>*64, <contenttweaker:actualized_chunk>*768],
    [<abyssalcraft:stone:5>*1536, <ore:dustTartarite>*512, <contenttweaker:demon_stone>*512, <contenttweaker:cosmic_fracture>*64]
];
var Recipe_OutPuts_Item = [
    [<bloodmagic:decorative_brick:2>],
    [<contenttweaker:blank_slate_catalyst>],
    [<contenttweaker:reinforced_slate_catalyst>],
    [<contenttweaker:imbued_slate_catalyst>],
    [<contenttweaker:demonic_slate_catalyst>],
    [<contenttweaker:ethereal_slate_catalyst>],
    [<contenttweaker:infused_lightwood_sapling>],
    [<contenttweaker:blood_infused_dimensional_ingot>*10],
    [<ebwizardry:magic_crystal:6>],
    [<contenttweaker:slate_of_endless_hunger>],
    [<contenttweaker:slate_of_endless_hunger>],
    [<contenttweaker:innerved_infinity_seed>],
    [<contenttweaker:lanthanum_salt>*64],
    [<contenttweaker:unstable_fragment_of_unraveling>],
    [<contenttweaker:forgotten_will>],
    //
    [<bloodmagic:slate>*256],
    [<bloodmagic:slate:1>*256],
    [<bloodmagic:slate:2>*256],
    [<bloodmagic:slate:3>*256],
    [<bloodmagic:slate:4>*256],
    [<bloodarsenal:blood_infused_wooden_log>*256],
    [<bloodarsenal:base_item:2>*64],
    [<bloodarsenal:base_item:4>*64],
    [<bloodmagic:activation_crystal>*64],
    // 屠龙者输出
    [<bloodmagic:item_demon_crystal:0>*64],
    [<bloodmagic:item_demon_crystal:1>*64],
    [<bloodmagic:item_demon_crystal:2>*64],
    [<bloodmagic:item_demon_crystal:3>*64],
    [<bloodmagic:item_demon_crystal:4>*64],
    [<bloodmagic:arcane_ashes>*64],
    [<bloodarsenal:base_item:3>*64],
    [<bloodmagic:component:8>*64],
    [<bloodarsenal:blood_diamond:0>*64],
    [<contenttweaker:shyre_crystal>*64],
    [<contenttweaker:willful_naquadah_chunk>*64],
    [<contenttweaker:willful_naquadah_chunk>*2048],
    [<contenttweaker:psimetal>*128],
    [<contenttweaker:psigem>*128],
    [<contenttweaker:crystallized_tungstensteel>*64],
    [<bloodmagic:demon_crystal:0>*64],
    [<bloodmagic:demon_crystal:1>*64],
    [<bloodmagic:demon_crystal:2>*64],
    [<bloodmagic:demon_crystal:3>*64],
    [<bloodmagic:demon_crystal:4>*64],
    [<animus:component:0>*64],
    [<animus:component:1>*64],
    [<animus:component:2>*64],
    [<animus:component:3>*64],
    [<animus:component:4>*64],
    [<animus:component:5>*64],
    [<bloodarsenal:base_item:6>*64],
    [<bloodarsenal:base_item:7>*64],
    [<bloodarsenal:base_item:9>*64],
    [<bloodmagic:component:0>*64],
    [<bloodmagic:component:1>*64],
    [<bloodmagic:component:2>*64],
    [<bloodmagic:component:3>*64],
    [<bloodmagic:component:4>*64],
    [<bloodmagic:component:5>*64],
    [<bloodmagic:component:6>*64],
    [<bloodarsenal:base_item:8>*64],
    [<bloodmagic:component:7>*64],
    [<bloodmagic:component:9>*64],
    [<bloodmagic:component:11>*64],
    [<bloodmagic:component:12>*64],
    [<bloodmagic:component:13>*64],
    [<bloodmagic:component:14>*64],
    [<bloodmagic:component:15>*64],
    [<bloodmagic:component:16>*64],
    [<bloodmagic:component:17>*64],
    [<bloodmagic:component:18>*64],
    [<bloodmagic:component:27>*64],
    [<bloodmagic:component:30>*64],
    [<bloodmagic:component:31>*64],
    [<bloodmagic:component:32>*64],
    [<bloodarsenal:base_item:3>*64],    // multihellfire46 输出
    [<bloodarsenal:blood_diamond:0>*64], // multihellfire47 输出
    [<animus:component:4>*64],           // multihellfire48 输出
    [<bloodmagic:component:6>*64],       // multihellfire49 输出
    [<bloodmagic:component:0>*64],       // multihellfire50 输出
    [<bloodmagic:component:9>*64],       // multihellfire51 输出
    [<bloodmagic:component:7>*64],       // multihellfire52 输出
    [<bloodmagic:component:1>*64],       // multihellfire53 输出
    [<bloodmagic:slate:0>*256],
    [<bloodmagic:slate:0>*1024],
    [<bloodmagic:slate:0>*4096],
    [<bloodmagic:slate:0>*16384],
    [<bloodmagic:slate:1>*256],
    [<bloodmagic:slate:1>*1024],
    [<bloodmagic:slate:1>*4096],
    [<bloodmagic:slate:1>*16384],
    [<bloodmagic:slate:2>*256],
    [<bloodmagic:slate:2>*1024],
    [<bloodmagic:slate:2>*4096],
    [<bloodmagic:slate:2>*16384],
    [<bloodmagic:slate:3>*256],
    [<bloodmagic:slate:3>*1024],
    [<bloodmagic:slate:3>*4096],
    [<bloodmagic:slate:3>*16384],
    [<bloodmagic:slate:4>*256],
    [<bloodmagic:slate:4>*1024],
    [<bloodmagic:slate:4>*4096],
    [<bloodmagic:slate:4>*16384],
    [<contenttweaker:psimetal>*1152],
    [<contenttweaker:shyre_crystal>*256],
    [<contenttweaker:shyre_crystal>*768],
    [<contenttweaker:tartarite_ore>*1536]
];
var Recipe_Inputs_Fluid = [
    [<liquid:lifeessence>*100000],   // 对应 decorative_brick
    [<liquid:lifeessence>*100],      // blank_slate_catalyst
    [<liquid:lifeessence>*200],      // reinforced_slate_catalyst
    [<liquid:lifeessence>*500],      // imbued_slate_catalyst
    [<liquid:lifeessence>*1500],     // demonic_slate_catalyst
    [<liquid:lifeessence>*3000],     // ethereal_slate_catalyst
    [<liquid:lifeessence>*100000],    // infused_lightwood_sapling
    [<liquid:lifeessence>*100000],   // blood_infused_dimensional_ingot
    [<liquid:lifeessence>*200],      // magic_crystal:6
    [<liquid:lifeessence>*1000000],  // slate_of_endless_hunger (stone_of_endless_hunger)
    [<liquid:lifeessence>*100000],   // slate_of_endless_hunger (stone_of_unbound_hunger)
    [<liquid:lifeessence>*20],       // innerved_infinity_seed
    [<liquid:lifeessence>*640],       // lanthanum_salt
    [<liquid:lifeessence>*1000000],  // unstable_fragment_of_unraveling
    [<liquid:lifeessence>*2000000],   // forgotten_will
    //
    [<liquid:lifeessence>*256000],
    [<liquid:lifeessence>*512000],
    [<liquid:lifeessence>*1280000],
    [<liquid:lifeessence>*7680000],
    [<liquid:lifeessence>*512000],
    [<liquid:lifeessence>*128000],
    [<liquid:lifeessence>*160000],
    [<liquid:lifeessence>*320000],
    [<liquid:lifeessence>*640000],
    // 屠龙者液体输入
    [], // multihellfiredupe1 无流体
    [], // dupe2
    [], // dupe3
    [], // dupe4
    [], // dupe5
    [], // multihellfire1
    [<fluid:lifeessence>*64000], // multihellfire2
    [], // multihellfire3
    [<fluid:lifeessence>*64000], // multihellfire4
    [], // multihellfire5
    [], // multihellfire6
    [], // multihellfire6bett
    [], // multihellfire7
    [], // multihellfire8
    [], // multihellfire9
    [], // multihellfire10
    [], // multihellfire11
    [], // multihellfire12
    [], // multihellfire13
    [], // multihellfire14
    [], // multihellfire15
    [], // multihellfire16
    [], // multihellfire17
    [], // multihellfire18
    [<fluid:water>*64000], // multihellfire19
    [], // multihellfire20
    [], // multihellfire21
    [], // multihellfire22
    [], // multihellfire23
    [<fluid:water>*64000, <fluid:water>*64000], // multihellfire24（两个流体输入）
    [<fluid:lava>*64000], // multihellfire25
    [], // multihellfire26
    [], // multihellfire27
    [], // multihellfire28
    [], // multihellfire29
    [<fluid:water>*64000, <fluid:lava>*64000, <fluid:hydrogen>*64000], // multihellfire30
    [], // multihellfire31
    [<fluid:glowstone>*64000], // multihellfire32
    [<fluid:water>*64000, <fluid:lava>*64000], // multihellfire33
    [], // multihellfire34
    [], // multihellfire35
    [], // multihellfire36
    [], // multihellfire37
    [], // multihellfire38
    [], // multihellfire39
    [], // multihellfire40
    [], // multihellfire41
    [], // multihellfire42
    [], // multihellfire43
    [], // multihellfire44
    [], // multihellfire45
    [], // multihellfire46
    [], // multihellfire47
    [], // multihellfire48
    [], // multihellfire49
    [], // multihellfire50
    [], // multihellfire51
    [], // multihellfire52
    [], // multihellfire53
    [], // multihellfire54
    [], // multihellfire54a
    [], // multihellfire54b
    [], // multihellfire54c
    [], // multihellfire55
    [], // multihellfire55a
    [], // multihellfire55b
    [], // multihellfire55c
    [], // multihellfire56
    [], // multihellfire56a
    [], // multihellfire56b
    [], // multihellfire56c
    [], // multihellfire57
    [], // multihellfire57a
    [], // multihellfire57b
    [], // multihellfire57c
    [], // multihellfire58
    [], // multihellfire58a
    [], // multihellfire58b
    [], // multihellfire58c
    [], // multihellfire59
    [], // multihellfire60
    [], // multihellfire61
    []  // multihellfire62
];
for i in 0 to Recipe_Inputs_Item.length {
    val inputs_item = Recipe_Inputs_Item[i];
    val outputs_item = Recipe_OutPuts_Item[i];
    val inputs_fluid = Recipe_Inputs_Fluid[i];
    Blood_Alter_SK_Recipe_Builder(
        "SK_blood_altar_recipe_" + i,
        inputs_item,
        inputs_fluid,
        outputs_item
    );
}



// 小型血之祭坛
RecipeAdapterBuilder.create("modularmachinery:small_blood_abyss_altar", "modularmachinery:blood_abyss_altar")
    .addModifier(RecipeModifierBuilder.create("modularmachinery:duration", "input", 10, 1, false).build())
    .addModifier(RecipeModifierBuilder.create("modularmachinery:energy", "input", 0.1, 1, false).build())
    .setMaxThreads(1)
    .build();