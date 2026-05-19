#loader crafttweaker reloadable

#priority 10000
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;

import mods.modularmachinery.IMachineController;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.ActiveMachineRecipe;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.MachineModifier;

import mods.modularmachinery.MMEvents;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;

import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
// 神秘时代相关
import native.com.blamejared.compat.thaumcraft.handlers.ThaumCraft;
import native.thaumcraft.api.ThaumcraftApiHelper;
import thaumcraft.aspect.CTAspectStack;
// 神秘时代相关
//==========================================================================通用函数==========================================================================
// function SK_Get_Aspects_Or_Essentia_Name(
//     Aspects_Or_Essentia_Name as string
// )as void{
//     return itemUtils.getItem("mysticalagriculture:" + name + "_essence");
// }








//==========================================================================配方注册函数==========================================================================
function Recipe_Builder_SK_Chance(
    recipeName as string,
    machineName as string,
    inputs as crafttweaker.item.IIngredient[],
    inputChances as double[],          // 可留空 []
    fluidInputs as crafttweaker.liquid.ILiquidStack[],
    fluidInputChances as double[],      // 可留空 []
    outputs as crafttweaker.item.IIngredient[],
    outputChances as double[],          // 可留空 []
    fluidOutputs as crafttweaker.liquid.ILiquidStack[],
    fluidOutputChances as double[],     // 可留空 []
    
    time as long,
    energyinput as long,
    energyOutput as long
) as void 
{
    val builder = RecipeBuilder.newBuilder(recipeName, machineName, time);
    builder.setMaxThreads(1);
    // 能量输入
    if (energyinput > 0) {
        builder.addEnergyPerTickInput(energyinput);
    }
    // 物品输入
    for i in 0 to inputs.length{
        val item = inputs[i];
        val chance = (inputChances.length > i) ? inputChances[i] : 1.0;
        builder.addItemInput(item).setChance(chance);
    }

    // 流体输入
    for i in 0 to fluidInputs.length{
        val fluid = fluidInputs[i];
        val chance = (fluidInputChances.length > i) ? fluidInputChances[i] : 1.0;
        builder.addFluidInput(fluid).setChance(chance);
    }

    // 物品输出
    for i in 0 to outputs.length{
        val item = outputs[i];
        val chance = (outputChances.length > i) ? outputChances[i] : 1.0;
        builder.addItemOutput(item).setChance(chance);
    }

    // 流体输出
    for i in 0 to fluidOutputs.length{
        val fluid = fluidOutputs[i];
        val chance = (fluidOutputChances.length > i) ? fluidOutputChances[i] : 1.0;
        builder.addFluidOutput(fluid).setChance(chance);
    }

    // 能量输出
    if (energyOutput > 0){
        builder.addEnergyPerTickOutput(energyOutput);
    }

    builder.build();
}
// 普通配方

function Recipe_Builder_SK(
    recipeName as string,
    machineName as string,
    inputs as crafttweaker.item.IIngredient[],
    fluidInputs as crafttweaker.liquid.ILiquidStack[],
    outputs as crafttweaker.item.IIngredient[],
    fluidOutputs as crafttweaker.liquid.ILiquidStack[],
    time as long,
    energyInput as long,
    energyOutput as long
) as void 
{
    val builder = RecipeBuilder.newBuilder(recipeName, machineName, time);
    builder.setMaxThreads(1);
    if(energyInput > 0) {
        builder.addEnergyPerTickInput(energyInput);
    }
    for item in inputs {
        builder.addItemInput(item);
    }

    for fluid in fluidInputs {
        builder.addFluidInput(fluid);
    }

    for item in outputs {
        builder.addItemOutput(item);
    }

    for fluid in fluidOutputs {
        builder.addFluidOutput(fluid);
    }

    // 能量输出
    if(energyOutput > 0) {
        builder.addEnergyPerTickOutput(energyOutput);
    }

    builder.build();
}
//
function Recipe_Builder_SK_Chance_With_Mana(
    recipeName as string,
    machineName as string,
    inputs as crafttweaker.item.IIngredient[],
    inputChances as double[],          // 可留空 []
    fluidInputs as crafttweaker.liquid.ILiquidStack[],
    fluidInputChances as double[],      // 可留空 []
    outputs as crafttweaker.item.IIngredient[],
    outputChances as double[],          // 可留空 []
    fluidOutputs as crafttweaker.liquid.ILiquidStack[],
    fluidOutputChances as double[],     // 可留空 []+
    
    time as long,
    ManaInput as long,
    energyOutput as long
) as void 
{
    val builder = RecipeBuilder.newBuilder(recipeName, machineName, time);
    builder.setMaxThreads(1);
    // 魔力输入
    if (ManaInput > 0) {
        builder.addManaInput(ManaInput,false);
    }
    // 物品输入
    for i in 0 to inputs.length{
        val item = inputs[i];
        val chance = (inputChances.length > i) ? inputChances[i] : 1.0;
        builder.addItemInput(item).setChance(chance);
    }

    // 流体输入
    for i in 0 to fluidInputs.length{
        val fluid = fluidInputs[i];
        val chance = (fluidInputChances.length > i) ? fluidInputChances[i] : 1.0;
        builder.addFluidInput(fluid).setChance(chance);
    }

    // 物品输出
    for i in 0 to outputs.length{
        val item = outputs[i];
        val chance = (outputChances.length > i) ? outputChances[i] : 1.0;
        builder.addItemOutput(item).setChance(chance);
    }

    // 流体输出
    for i in 0 to fluidOutputs.length{
        val fluid = fluidOutputs[i];
        val chance = (fluidOutputChances.length > i) ? fluidOutputChances[i] : 1.0;
        builder.addFluidOutput(fluid).setChance(chance);
    }

    // 能量输出
    if (energyOutput > 0){
        builder.addEnergyPerTickOutput(energyOutput);
    }
    
    builder.build();
}

// 使用 addAspectInput 的函数（MMCE 原生），支持多要素
function Recipe_Builder_SK_Aspect(
    recipeName as string,
    machineName as string,
    inputs as crafttweaker.item.IIngredient[],
    outputs as crafttweaker.item.IIngredient[],
    time as long,
    energyInput as long,
    aspects as string[],
    aspectAmounts as int[]
) as void {
    val builder = RecipeBuilder.newBuilder(recipeName, machineName, time);
    builder.setMaxThreads(1);
    if (energyInput > 0) {
        builder.addEnergyPerTickInput(energyInput);
    }
    for item in inputs {
        builder.addItemInput(item);
    }
    for item in outputs {
        builder.addItemOutput(item);
    }
    for i in 0 to aspects.length{
        builder.addAspectInput(aspects[i], aspectAmounts[i]);
    }
    
    builder.build();
}

// 使用 addEssentiaInput 的函数（MMCE Addons）
function Recipe_Builder_SK_Essentia(
    recipeName as string,
    machineName as string,
    inputs as crafttweaker.item.IIngredient[],
    outputs as crafttweaker.item.IIngredient[],
    time as long,
    energyInput as long,
    aspects as string[],
    aspectAmounts as int[]
) as void {
    val builder = RecipeBuilder.newBuilder(recipeName, machineName, time);
    builder.setMaxThreads(1);
    if (energyInput > 0) {
        builder.addEnergyPerTickInput(energyInput);
    }
    for item in inputs {
        builder.addItemInput(item);
    }
    for item in outputs {
        builder.addItemOutput(item);
    }
    for i in 0 to aspects.length{
        builder.addEssentiaInput(aspects[i], aspectAmounts[i]);
    }
    
    builder.build();
}
// function Recipe_Builder_SK_Universal(
//     RecipeName as string,
//     MachineName as string,
//     TimeConsumed as long,
//     //========================物品输入========================
//     ItemInputs as crafttweaker.item.IIngredient[],
//     ItemInputs_Consume_Chance as double,
//     //========================流体输入========================
//     FluidInputs as crafttweaker.liquid.ILiquidStack[],
//     FluidInputs_Consume_Chance as double,
//     //========================物品输出========================
//     ItemOutputs as crafttweaker.item.IIngredient[],
//     ItemOutputs_Chance as double,
//     //========================流体输出========================
//     FluidOutputs as crafttweaker.liquid.ILiquidStack[],
//     FluidOutputs_Chance as double,
//     //========================能量============================
//     EnergyInput as long,
//     EnergyOutput as long,
//     //========================要素精华========================
//     Aspects_or_Essentia_Name as string,
//     Aspects_or_Essentia_Amount as long,
//     //========================魔力============================
//     manaInputs as long[],
//     manaInputPerTick as long,
//     manaOutputs as long[],
//     manaOutputPerTick as long,
//     //========================星能============================
//     starlightInputs as long[],
//     starlightInputPerTick as long,
//     starlightOutputs as long[],
//     starlightOutputPerTick as long,
//     //=======================灵气咒波==========================
//     visInput as long,
//     fluxInput as long,
//     visOutput as long,
//     fluxOutput as long,
//     //========================辐射=============================
//     radiationInput as float,
//     radiationOutput as float,

// )
//==========================================================================配方注册函数==========================================================================
/*
{
    // 使用 RecipeBuilder 创建配方基础
    val builder = RecipeBuilder.newBuilder(recipeName, machineName, time);

    // 设置并行化和JEI提示
    builder.setParallelized(isParallelized);
    for tooltip in recipeTooltips {
        builder.addRecipeTooltip(tooltip);
    }

    // 添加物品输入/输出
    for i, input in itemInputs {
        if i < itemInputChances.length && itemInputChances[i] > 0) {
            builder.addItemInput(input).setChance(itemInputChances[i]);
        } else {
            builder.addItemInput(input);
        }
    }
    for i, output in itemOutputs {
        if i < itemOutputChances.length && itemOutputChances[i] > 0) {
            builder.addItemOutput(output).setChance(itemOutputChances[i]);
        } else {
            builder.addItemOutput(output);
        }
    }

    // 添加流体输入/输出 (逻辑同物品)
    // ... (此处省略流体部分的实现代码，逻辑同物品) ...

    // 添加气体输入/输出
    for input in gasInputs {
        builder.addGasInput(input);
    }
    for output in gasOutputs {
        builder.addGasOutput(output);
    }

    // 添加能量输入/输出 (FE)
    if energyInput > 0) { builder.addEnergyInput(energyInput); }
    if energyInputPerTick > 0) { builder.addEnergyPerTickInput(energyInputPerTick); }
    if energyOutput > 0) { builder.addEnergyOutput(energyOutput); }
    if energyOutputPerTick > 0) { builder.addEnergyPerTickOutput(energyOutputPerTick); }

    // 添加植物魔法魔力
    for mana in manaInputs { builder.addManaInput(mana); }
    if manaInputPerTick > 0) { builder.addManaPerTickInput(manaInputPerTick); }
    for mana in manaOutputs { builder.addManaOutput(mana); }
    if manaOutputPerTick > 0) { builder.addManaPerTickOutput(manaOutputPerTick); }

    // 添加星辉魔法星能
    for starlight in starlightInputs { builder.addStarlightInput(starlight); }
    if starlightInputPerTick > 0) { builder.addStarlightPerTickInput(starlightInputPerTick); }
    for starlight in starlightOutputs { builder.addStarlightOutput(starlight); }
    if starlightOutputPerTick > 0) { builder.addStarlightPerTickOutput(starlightOutputPerTick); }


    // 添加神秘时代源质
    for i, aspect in aspectInputs {
        if i < aspectInputChances.length && aspectInputChances[i] > 0) {
            builder.addAspectInput(aspect).setChance(aspectInputChances[i]);
        } else {
            builder.addAspectInput(aspect);
        }
    }
    for i, aspect in aspectOutputs {
        if i < aspectOutputChances.length && aspectOutputChances[i] > 0) {
            builder.addAspectOutput(aspect).setChance(aspectOutputChances[i]);
        } else {
            builder.addAspectOutput(aspect);
        }
    }

    // 添加核科技辐射
    if radiationInput > 0) { builder.addRadiationInput(radiationInput); }
    if radiationOutput > 0) { builder.addRadiationOutput(radiationOutput); }

    // 添加神秘时代灵气与咒波
    if visInput > 0) { builder.addVisInput(visInput); }
    if fluxInput > 0) { builder.addFluxInput(fluxInput); }
    if visOutput > 0) { builder.addVisOutput(visOutput); }
    if fluxOutput > 0) { builder.addFluxOutput(fluxOutput); }

    // 构建配方
    builder.build();
}
*/