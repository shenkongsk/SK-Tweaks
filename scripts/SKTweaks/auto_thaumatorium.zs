#loader crafttweaker reloadable
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.RecipeAdapterBuilder;
// import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;


MachineModifier.setInternalParallelism("auto_thaumatorium", 32);
<modularmachinery:auto_thaumatorium_controller>.addTooltip(format.gold("内置32并行！"));
RecipeAdapterBuilder.create("modularmachinery:auto_thaumatorium", "thaumcraft:crucible").build();

function Thaumatorium_Recipe_Builder(
    RecipeName as string,
    Inputs as crafttweaker.item.IIngredient[],
    Outputs as crafttweaker.item.IIngredient[],
    Aspects_Need as string[],
    Aspects_Amount as int[],
    EnergyInput as long,
    Timeinput as int
)as void{
    val MachineName = "auto_thaumatorium";
    scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK_Aspect(
        RecipeName + "_Aspect",
        MachineName,
        Inputs,
        Outputs,
        Timeinput,
        EnergyInput,
        Aspects_Need,
        Aspects_Amount
    );
    scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK_Essentia(
        RecipeName + "_Essentia",
        MachineName,
        Inputs,
        Outputs,
        Timeinput,
        EnergyInput,
        Aspects_Need,
        Aspects_Amount
    );
}
// ==================== 配方数组定义（已追加新配方） ====================
val Recipe_Inputs = [
    [<thaumcraft:seal:0>],
    [<thaumcraft:seal:0>],
    [<thaumcraft:seal:0>],
    [<thaumicaugmentation:material:5>],
    [<contenttweaker:impetus_crystal>],
    [<contenttweaker:impetus_gemstone>],
    [<thaumicwonders:primordial_grain>],
    [<aoa3:zhinx_dust>],
    [<contenttweaker:valtellina_ore>],
    [<thaumcraft:vishroom>],
    [<techreborn:scrapbox>],
    [<techreborn:scrapbox>],
    [<techreborn:scrapbox>],
    [<techreborn:scrapbox>],
    [<ore:ingotIchorium>],
    [<contenttweaker:ichorium_block>],
    [<ebwizardry:magic_crystal:0>],
    [<ebwizardry:magic_crystal:0>],
    [<contenttweaker:alchemical_sediment>],
    [<contenttweaker:compressed_alchemical_sediment>],
    [<contenttweaker:double_compressed_alchemical_sediment>],
    [<contenttweaker:triple_compressed_alchemical_sediment>],
    [<iceandfire:fire_dragon_flesh>],
    [<iceandfire:ice_dragon_flesh>],
    [<iceandfire:lightning_dragon_flesh>],
    [<techreborn:dynamiccell>.withTag({Fluid: {FluidName: "liquid_madness", Amount: 1000}})],
    [<techreborn:dynamiccell>.withTag({Fluid: {FluidName: "ghostly_matter", Amount: 1000}})],
    [<contenttweaker:core_of_mirroring>],
    [<contenttweaker:myrmitite_catalyst>],
    [<abyssalcraft:densecarboncluster>],
    [<contenttweaker:carbon_condensate>],
    [<bewitchment:opal>],
    [<minecraft:cauldron>],
    [<contenttweaker:depleted_arcane_fissile_alloy>],
    [<contenttweaker:screaming_blood_slime>],
    [<contenttweaker:lost_memory>],
    [<contenttweaker:recursion_of_gluttony>],
    [<minecraft:rotten_flesh>*4],
    [<minecraft:golden_apple:1>*4]
];

val Recipe_Outputs = [
    [<thaumcraft:seal:12>],
    [<thaumcraft:seal:8>],
    [<thaumcraft:seal:7>],
    [<thaumicaugmentation:material:5>*7],
    [<thaumicaugmentation:material:5>*15],
    [<thaumicaugmentation:material:5>*60],
    [<thaumicwonders:primordial_grain>*7],
    [<thaumcraft:bath_salts>*4],
    [<contenttweaker:imperfect_gem_of_the_cosmos>*8],
    [<contenttweaker:magic_mushroom>],
    [<contenttweaker:dreadia_gem>],
    [<contenttweaker:caeles_gem>],
    [<contenttweaker:vitium_gem>],
    [<contenttweaker:mythus_gem>],
    [<contenttweaker:ichorium_gem>],
    [<contenttweaker:ichorium_gem>*9],
    [<ebwizardry:magic_crystal:1>],
    [<ebwizardry:magic_crystal:2>],
    [<contenttweaker:alchemical_silt>*2],
    [<contenttweaker:compressed_alchemical_silt>*2],
    [<contenttweaker:double_compressed_alchemical_silt>*2],
    [<contenttweaker:triple_compressed_alchemical_silt>*2],
    [<iceandfire:fire_dragon_flesh>*5],
    [<iceandfire:ice_dragon_flesh>*5],
    [<iceandfire:lightning_dragon_flesh>*5],
    [<contenttweaker:madness_gem>],
    [<contenttweaker:inanimate_soul>],
    [<contenttweaker:core_of_mirroring>*3],
    [<contenttweaker:cursed_myrmitite_catalyst>],
    [<contenttweaker:tellurium_crystal>],
    [<contenttweaker:tellurium_crystal>*4],
    [<contenttweaker:antimony_crystal>],
    [<thaumcraft:crucible>],
    [<contenttweaker:arcane_fissile_dust>*4],
    [<contenttweaker:screaming_blood_slime>*24],
    [<contenttweaker:solidified_memory>],
    [<contenttweaker:recursion_of_gluttony>*2],
    [<thaumcraft:tallow>*4],
    [<thaumicwonders:panacea:1>*4]
];

val Recipe_Aspects = [
    ["instrumentum", "humanus"],
    ["bestia", "sensus"],
    ["herba", "vitreus"],
    ["potentia", "ordo", "vitium"],
    ["potentia", "ordo", "vitium"],
    ["potentia", "ordo", "vitium"],
    ["aer", "aqua", "ignis", "terra", "ordo", "perditio"],
    ["cognitio", "aer", "ordo", "victus"],
    ["caeles"],
    ["vitium"],
    ["dreadia"],
    ["caeles"],
    ["vitium"],
    ["mythus"],
    ["mortuus", "vitreus", "victus"],
    ["mortuus", "vitreus", "victus"],
    ["ignis"],
    ["vitreus"],
    ["terra"],
    ["terra"],
    ["terra"],
    ["terra"],
    ["draco"],
    ["draco"],
    ["draco"],
    ["exanimis"],
    ["spiritus"],
    ["sol", "luna", "stellae"],
    ["vitium"],
    ["dreadia"],
    ["dreadia"],
    ["auram"],
    ["metallum", "ordo", "aqua", "ignis"],
    ["potentia", "perditio"],
    ["victus"],
    ["caeles"],
    ["sensus", "desiderium", "vacuos", "humanus"],
    ["ignis"],
    ["victus","ordo","praemunio"]
];

val Recipe_Aspects_Amount = [
    [20, 10],
    [20, 10],
    [20, 10],
    [10, 20, 5],
    [10, 20, 5],
    [10, 20, 5],
    [5, 5, 5, 5, 5, 5],
    [20, 20, 20, 20],
    [3],
    [30],
    [5],
    [5],
    [5],
    [5],
    [15, 10, 10],
    [60, 40, 40],
    [20],
    [20],
    [1],
    [10],
    [100],
    [1000],
    [5],
    [5],
    [5],
    [1],
    [1],
    [5, 5, 5],
    [1],
    [15],
    [30],
    [15],
    [15, 10, 5, 5],
    [10, 5],
    [20],
    [1],
    [10, 10, 10, 10],
    [4],
    [20,20,20]
];

// ==================== 批量注册配方 ====================
for i in 0 to Recipe_Inputs.length {
    val inputs = Recipe_Inputs[i];
    val outputs = Recipe_Outputs[i];
    val aspects = Recipe_Aspects[i];
    val amounts = Recipe_Aspects_Amount[i];
    var energy = 100000;   // 每 tick 能量消耗（RF/t）
    var time = 100;        // 总加工时间（tick）

    Thaumatorium_Recipe_Builder(
        "auto_thaumatorium_recipe_" + i,
        inputs,
        outputs,
        aspects,
        amounts,
        energy,
        time
    );
}