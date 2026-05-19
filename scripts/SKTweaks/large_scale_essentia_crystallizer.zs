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

val MACHINE = "large_scale_essentia_crystallizer";
MachineModifier.setMaxThreads(MACHINE, 53);
<modularmachinery:large_scale_essentia_crystallizer_factory_controller>.addTooltip(format.gold("内置额外53线程！"));




function Recipe_Builder_SK_Essentia_Crystallizer(
    recipeName as string,
    machineName as string,
    inputs as crafttweaker.item.IIngredient[],
    inputChances as double[],          // 可留空 []
    outputs as crafttweaker.item.IIngredient[],
    time as long
) as void 
{
    val builder = RecipeBuilder.newBuilder(recipeName, machineName, time);
    builder.setMaxThreads(1);
    builder.addItemInput(<minecraft:quartz>);
    // 物品输入
    for i in 0 to inputs.length{
        val item = inputs[i];
        val chance = (inputChances.length > i) ? inputChances[i] : 1.0;
        builder.addItemInput(item).setChance(chance);
    }
    builder.addEnergyPerTickInput(20000);
    // 物品输出
    for item in outputs {
        builder.addItemOutput(item);
    }


    builder.build();
}
val Pod_Input = [
    <thaumadditions:vis_pod>.withTag({Aspect: "aer"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "terra"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "ignis"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "aqua"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "ordo"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "perditio"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "vacuos"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "lux"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "motus"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "gelum"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "vitreus"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "metallum"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "victus"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "mortuus"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "potentia"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "permutatio"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "praecantatio"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "auram"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "alkimia"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "vitium"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "tenebrae"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "alienis"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "volatus"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "herba"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "instrumentum"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "fabrico"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "machina"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "vinculum"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "spiritus"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "cognitio"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "sensus"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "aversio"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "praemunio"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "desiderium"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "exanimis"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "bestia"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "humanus"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "coralos"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "dreadia"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "sol"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "luna"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "stellae"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "diabolus"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "fluctus"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "sonus"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "exitium"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "caeles"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "draco"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "infernum"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "ventus"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "visum"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "imperium"})*10,
    <thaumadditions:vis_pod>.withTag({Aspect: "mythus"})*10
];

val Crystal_Output = [
    makeVisCrystal(<aspect:aer> * 1) * 75,
    makeVisCrystal(<aspect:terra> * 1) * 75,
    makeVisCrystal(<aspect:ignis> * 1) * 75,
    makeVisCrystal(<aspect:aqua> * 1) * 75,
    makeVisCrystal(<aspect:ordo> * 1) * 75,
    makeVisCrystal(<aspect:perditio> * 1) * 75,
    makeVisCrystal(<aspect:vacuos> * 1) * 75,
    makeVisCrystal(<aspect:lux> * 1) * 75,
    makeVisCrystal(<aspect:motus> * 1) * 75,
    makeVisCrystal(<aspect:gelum> * 1) * 75,
    makeVisCrystal(<aspect:vitreus> * 1) * 75,
    makeVisCrystal(<aspect:metallum> * 1) * 75,
    makeVisCrystal(<aspect:victus> * 1) * 75,
    makeVisCrystal(<aspect:mortuus> * 1) * 75,
    makeVisCrystal(<aspect:potentia> * 1) * 75,
    makeVisCrystal(<aspect:permutatio> * 1) * 75,
    makeVisCrystal(<aspect:praecantatio> * 1) * 75,
    makeVisCrystal(<aspect:auram> * 1) * 75,
    makeVisCrystal(<aspect:alkimia> * 1) * 75,
    makeVisCrystal(<aspect:vitium> * 1) * 75,
    makeVisCrystal(<aspect:tenebrae> * 1) * 75,
    makeVisCrystal(<aspect:alienis> * 1) * 75,
    makeVisCrystal(<aspect:volatus> * 1) * 75,
    makeVisCrystal(<aspect:herba> * 1) * 75,
    makeVisCrystal(<aspect:instrumentum> * 1) * 75,
    makeVisCrystal(<aspect:fabrico> * 1) * 75,
    makeVisCrystal(<aspect:machina> * 1) * 75,
    makeVisCrystal(<aspect:vinculum> * 1) * 75,
    makeVisCrystal(<aspect:spiritus> * 1) * 75,
    makeVisCrystal(<aspect:cognitio> * 1) * 75,
    makeVisCrystal(<aspect:sensus> * 1) * 75,
    makeVisCrystal(<aspect:aversio> * 1) * 75,
    makeVisCrystal(<aspect:praemunio> * 1) * 75,
    makeVisCrystal(<aspect:desiderium> * 1) * 75,
    makeVisCrystal(<aspect:exanimis> * 1) * 75,
    makeVisCrystal(<aspect:bestia> * 1) * 75,
    makeVisCrystal(<aspect:humanus> * 1) * 75,
    makeVisCrystal(<aspect:coralos> * 1) * 75,
    makeVisCrystal(<aspect:dreadia> * 1) * 75,
    makeVisCrystal(<aspect:sol> * 1) * 75,
    makeVisCrystal(<aspect:luna> * 1) * 75,
    makeVisCrystal(<aspect:stellae> * 1) * 75,
    makeVisCrystal(<aspect:diabolus> * 1) * 75,
    makeVisCrystal(<aspect:fluctus> * 1) * 75,
    makeVisCrystal(<aspect:sonus> * 1) * 75,
    makeVisCrystal(<aspect:exitium> * 1) * 75,
    makeVisCrystal(<aspect:caeles> * 1) * 75,
    makeVisCrystal(<aspect:draco> * 1) * 75,
    makeVisCrystal(<aspect:infernum> * 1) * 75,
    makeVisCrystal(<aspect:ventus> * 1) * 75,
    makeVisCrystal(<aspect:visum> * 1) * 75,
    makeVisCrystal(<aspect:imperium> * 1) * 75,
    makeVisCrystal(<aspect:mythus> * 1) * 75
];

for i in 0 to Pod_Input.length {
    val recipeName = "e_crystallizer_sk_" + (i + 1);
    Recipe_Builder_SK_Essentia_Crystallizer(
        recipeName,
        "large_scale_essentia_crystallizer",
        [Pod_Input[i]],
        [1.0],
        [Crystal_Output[i]],
        20
    );
}