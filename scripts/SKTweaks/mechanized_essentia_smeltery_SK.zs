#loader crafttweaker reloadable
import mods.modularmachinery.RecipeBuilder;
import crafttweaker.item.IIngredient;


import native.com.blamejared.compat.thaumcraft.handlers.ThaumCraft;
import native.thaumcraft.api.ThaumcraftApiHelper;

import crafttweaker.item.IItemStack;
import thaumcraft.aspect.CTAspectStack;
<modularmachinery:mechanized_essentia_smeltery_controller>.addTooltip(format.gold("如果放置机械源质输出仓时显示 输入输出仓无效"));
<modularmachinery:mechanized_essentia_smeltery_controller>.addTooltip(format.gold("请将对应仓室接通ME网络"));

// 源质名称列表
val outputs = [
    "aer", "terra", "ignis", "aqua", "ordo",
    "perditio", "vacuos", "lux", "motus", "gelum",
    "vitreus", "metallum", "victus", "mortuus", "potentia",
    "permutatio", "praecantatio", "auram", "alkimia", "vitium",
    "tenebrae", "alienis", "volatus", "herba", "instrumentum",
    "fabrico", "machina", "vinculum", "spiritus", "cognitio",
    "sensus", "aversio", "praemunio", "desiderium", "exanimis",
    "bestia", "humanus", "coralos", "dreadia", "sol",
    "luna", "stellae", "diabolus", "fluctus", "sonus",
    "exitium", "caeles", "draco", "infernum", "ventus",
    "visum", "imperium", "mythus"
];

// 源质对象列表（顺序对应）
val inputs = [
    <aspect:aer>*1,
    <aspect:terra>*1,
    <aspect:ignis>*1,
    <aspect:aqua>*1,
    <aspect:ordo>*1,
    <aspect:perditio>*1,
    <aspect:vacuos>*1,
    <aspect:lux>*1,
    <aspect:motus>*1,
    <aspect:gelum>*1,
    <aspect:vitreus>*1,
    <aspect:metallum>*1,
    <aspect:victus>*1,
    <aspect:mortuus>*1,
    <aspect:potentia>*1,
    <aspect:permutatio>*1,
    <aspect:praecantatio>*1,
    <aspect:auram>*1,
    <aspect:alkimia>*1,
    <aspect:vitium>*1,
    <aspect:tenebrae>*1,
    <aspect:alienis>*1,
    <aspect:volatus>*1,
    <aspect:herba>*1,
    <aspect:instrumentum>*1,
    <aspect:fabrico>*1,
    <aspect:machina>*1,
    <aspect:vinculum>*1,
    <aspect:spiritus>*1,
    <aspect:cognitio>*1,
    <aspect:sensus>*1,
    <aspect:aversio>*1,
    <aspect:praemunio>*1,
    <aspect:desiderium>*1,
    <aspect:exanimis>*1,
    <aspect:bestia>*1,
    <aspect:humanus>*1,
    <aspect:coralos>*1,
    <aspect:dreadia>*1,
    <aspect:sol>*1,
    <aspect:luna>*1,
    <aspect:stellae>*1,
    <aspect:diabolus>*1,
    <aspect:fluctus>*1,
    <aspect:sonus>*1,
    <aspect:exitium>*1,
    <aspect:caeles>*1,
    <aspect:draco>*1,
    <aspect:infernum>*1,
    <aspect:ventus>*1,
    <aspect:visum>*1,
    <aspect:imperium>*1,
    <aspect:mythus>*1
];
function registerEssenceRecipe(
    recipeName as string,
    aspectName as string, 
    inputs as CTAspectStack 
) as void {
    var machine = "mechanized_essentia_smeltery";
    val builder = RecipeBuilder.newBuilder(recipeName, machine, 5);
    builder.addEssentiaOutput(aspectName, 1);
    builder.addItemInput(makeVisCrystal(inputs));
    builder.setMaxThreads(1);
    builder.build();
}

for i in 0 to inputs.length {
    var recipeName = "recipe_sk_essense_builder_" + i;
    registerEssenceRecipe(
        recipeName,
        outputs[i], 
        inputs[i]
    );
}