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
//==========================================================================
// 通用配方构建函数（支持所有主流输入/输出类型）
//==========================================================================
/**
 * @param recipeName                        配方注册名
 * @param machineName                       机器注册名
 * @param time                              加工时间（tick）
 * @param itemInputs                        物品输入数组
 * @param itemInputChances                  物品输入概率数组（与 inputs 对应，缺省为 1.0）
 * @param fluidInputs                       流体输入数组
 * @param fluidInputChances                 流体输入概率数组
 * @param itemOutputs                       物品输出数组
 * @param itemOutputChances                 物品输出概率数组
 * @param fluidOutputs                      流体输出数组
 * @param fluidOutputChances                流体输出概率数组
 * @param energyInput                       每 tick 能量输入（0 表示无）
 * @param energyOutput                      每 tick 能量输出（0 表示无）
 * @param manaInputs                        魔力输入数组（单次）
 * @param manaOutputs                       魔力输出数组（单次）
 * @param starlightInputs                   星能输入数组（单次）
 * @param starlightOutputs                  星能输出数组（单次）
 * @param Input_Aspects_or_Essentia_Name    要素/源质输入数组（字符串格式，如 "ignis"）
 * @param Input_Aspects_or_Essentia_Amount  对应要素数量数组
 * @param Output_Aspects_or_Essentia_Name   要素/源质输出数组（字符串格式，如 "ignis"）
 * @param Output_Aspects_or_Essentia_Amount 对应要素数量数组
 * @param gasInputs                         气体输入数组（IGasStack，需安装 Mekanism）
 * @param gasInputChances                   气体输入概率数组
 * @param gasOutputs                        气体输出数组
 * @param gasOutputChances                  气体输出概率数组
 * @param radiationInput                    辐射输入（float）
 * @param radiationInput_Radis              辐射输入区块半径(int)
 * @param radiationOutput                   辐射输出（float）
 * @param radiationOutput_Radis             辐射输出区块半径(int)
 * @param visInput                          灵气输入（long）
 * @param fluxInput                         咒波输入（long）
 * @param visOutput                         灵气输出（long）
 * @param fluxOutput                        咒波输出（long）
 * @param isParallelized                    是否允许并行（true/false）
 * @param recipeTooltips                    工具提示字符串数组（可选）
 * @param MaxThreads                        一种配方占据的最大线程数
 */
// function Recipe_Builder_SK_Universal(
//     recipeName as string,
//     machineName as string,
//     time as long,
//     // 物品
//     itemInputs as crafttweaker.item.IIngredient[],
//     itemInputChances as double[],
//     itemOutputs as crafttweaker.item.IIngredient[],
//     itemOutputChances as double[],
//     // 流体
//     fluidInputs as crafttweaker.liquid.ILiquidStack[],
//     fluidInputChances as double[],
//     fluidOutputs as crafttweaker.liquid.ILiquidStack[],
//     fluidOutputChances as double[],
//     // 能量
//     energyInput as long,
//     energyOutput as long,
//     // // 魔力（植物魔法）
//     // manaInputs as int,
//     // manaInputs_bool as bool,  //中断时是否吞材料？ 目前写false
//     // manaOutputs as int[],
//     // manaOutputs_bool as bool[], //中断时是否吞材料？ 目前写false
//     // 星能（星辉魔法）
//     starlightInputs as long,
//     starlightOutputs as long,
//     // 神秘时代：要素或源质 (Aspect or Essentia)
//     Input_Aspects_or_Essentia_Name as string[],
//     Input_Aspects_or_Essentia_Amount as long[],
//     Output_Aspects_or_Essentia_Name as string[],
//     Output_Aspects_or_Essentia_Amount as long[],
//     // 气体（Mekanism）
//     // gasInputs as crafttweaker.gas.IGasStack[],
//     // gasInputChances as double[],
//     // gasOutputs as crafttweaker.gas.IGasStack[],
//     // gasOutputChances as double[],
//     // 辐射（核科技）
//     radiationInput as float,
//     radiationInput_Radis as int,
//     radiationOutput as float,
//     radiationOutput_Radis as int,
//     // 灵气与咒波（神秘时代）
//     visInput as long,
//     fluxInput as long,
//     visOutput as long,
//     fluxOutput as long,
//     // 其他设置
//     isParallelized as bool,
//     recipeTooltips as string[],
//     MaxThreads as int
// ) as void {
//     val builder = RecipeBuilder.newBuilder(recipeName, machineName, time);
    
//     // 并行化
//     builder.setParallelized(isParallelized);
//     builder.setMaxThreads(MaxThreads);
//     // 工具提示
//     for tooltip in recipeTooltips {
//         builder.addRecipeTooltip(tooltip);
//     }
    
//     // 能量输入/输出
//     if (energyInput > 0) {
//         builder.addEnergyPerTickInput(energyInput);
//     }
//     if (energyOutput > 0) {
//         builder.addEnergyPerTickOutput(energyOutput);
//     }
    
//     // 物品输入（带概率）
//     for i in 0 to itemInputs.length {
//         val item = itemInputs[i];
//         val chance = (i < itemInputChances.length) ? itemInputChances[i] : 1.0;
//         builder.addItemInput(item).setChance(chance);
//     }
//     // 物品输出（带概率）
//     for i in 0 to itemOutputs.length {
//         val item = itemOutputs[i];
//         val chance = (i < itemOutputChances.length) ? itemOutputChances[i] : 1.0;
//         builder.addItemOutput(item).setChance(chance);
//     }
    
//     // 流体输入/输出
//     for i in 0 to fluidInputs.length {
//         val fluid = fluidInputs[i];
//         val chance = (i < fluidInputChances.length) ? fluidInputChances[i] : 1.0;
//         builder.addFluidInput(fluid).setChance(chance);
//     }
//     for i in 0 to fluidOutputs.length {
//         val fluid = fluidOutputs[i];
//         val chance = (i < fluidOutputChances.length) ? fluidOutputChances[i] : 1.0;
//         builder.addFluidOutput(fluid).setChance(chance);
//     }
    
//     // 魔力（植物魔法）
//     if{manaInputs>0} {
//         builder.addManaInput(mana,manaInputs_bool);
//     }
//     // if{manaOutputs>0} {
//     //     builder.addManaOutput(mana,manaOutputs_bool);
//     // }
    
//     // 星能（星辉魔法）
//     for starlight in starlightInputs {
//         builder.addStarlightInput(starlight);
//     }
//     for starlight in starlightOutputs {
//         builder.addStarlightOutput(starlight);
//     }
    
//     // 神秘时代要素
//     for i in 0 to Input_Aspects_or_Essentia_Name.length {
//         if (i < Input_Aspects_or_Essentia_Amount.length) {
//             builder.addAspectInput(Input_Aspects_or_Essentia_Name[i], Input_Aspects_or_Essentia_Amount[i]);
//             builder.addEssentiaInput(Input_Aspects_or_Essentia_Name[i], Input_Aspects_or_Essentia_Amount[i]);
//         }
//     }
//     for i in 0 to Output_Aspects_or_Essentia_Name.length {
//         if (i < Output_Aspects_or_Essentia_Amount.length) {
//             builder.addAspectOutput(Output_Aspects_or_Essentia_Name[i], Output_Aspects_or_Essentia_Amount[i]);
//             builder.addEssentiaOutput(Output_Aspects_or_Essentia_Name[i], Output_Aspects_or_Essentia_Amount[i]);
//         }
//     }
//     // 气体（Mekanism）
//     // for i in 0 to gasInputs.length {
//     //     val gas = gasInputs[i];
//     //     val chance = (i < gasInputChances.length) ? gasInputChances[i] : 1.0;
//     //     builder.addGasInput(gas).setChance(chance);
//     // }
//     // for i in 0 to gasOutputs.length {
//     //     val gas = gasOutputs[i];
//     //     val chance = (i < gasOutputChances.length) ? gasOutputChances[i] : 1.0;
//     //     builder.addGasOutput(gas).setChance(chance);
//     // }
    
//     // 辐射（核科技）
//     if (radiationInput > 0) {
//         builder.addRadiationInput(radiationInput,radiationInput_Radis);
//     }
//     if (radiationOutput > 0) {
//         builder.addRadiationOutput(radiationOutput,radiationOutput_Radis);
//     }
    
//     // 灵气与咒波（神秘时代）
//     if (visInput > 0) {
//         builder.addVisInput(visInput);
//     }
//     if (fluxInput > 0) {
//         builder.addFluxInput(fluxInput);
//     }
//     if (visOutput > 0) {
//         builder.addVisOutput(visOutput);
//     }
//     if (fluxOutput > 0) {
//         builder.addFluxOutput(fluxOutput);
//     }
//     // 构建配方
//     builder.build();
// }
