#loader crafttweaker reloadable

#priority 10000
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import crafttweaker.item.IItemStack;

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
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
// 神秘时代相关
import native.com.blamejared.compat.thaumcraft.handlers.ThaumCraft;
import native.thaumcraft.api.ThaumcraftApiHelper;
import thaumcraft.aspect.CTAspectStack;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
// global Get_CustomData_int as function(IData, string, int)int = function(data as IData, key as string, default as int) as int {
//==========================================================================配方注册函数==========================================================================
global Recipe_Builder_SK_Chance as function(
    string,
    string,
    IIngredient[],
    double[],
    ILiquidStack[],
    double[],
    IIngredient[],
    double[],
    ILiquidStack[],
    double[],
    long,long,long
)void = function(   
    recipeName as string,
    machineName as string,
    inputs as IIngredient[],
    inputChances as double[],          // 可留空 []
    fluidInputs as ILiquidStack[],
    fluidInputChances as double[],      // 可留空 []
    outputs as IIngredient[],
    outputChances as double[],          // 可留空 []
    fluidOutputs as ILiquidStack[],
    fluidOutputChances as double[],     // 可留空 []
    time as long,
    energyinput as long,
    energyOutput as long
)as void{
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
        if chance == 0.0 {
            builder.addItemInput(item).setChance(chance).setParallelizeUnaffected(true);
        } else {
            builder.addItemInput(item).setChance(chance);
        }
    }
    // 流体输入
    for i in 0 to fluidInputs.length{
        val fluid = fluidInputs[i];
        val chance = (fluidInputChances.length > i) ? fluidInputChances[i] : 1.0;
        if chance == 0.0{
            builder.addFluidInput(fluid).setChance(chance).setParallelizeUnaffected(true);
        }else{
            builder.addFluidInput(fluid).setChance(chance);
        }
        
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
};
global Recipe_Builder_SK as function(
    string,
    string,
    IIngredient[],
    ILiquidStack[],
    IIngredient[],
    ILiquidStack[],
    long,
    long,
    long
) void = function(
    recipeName as string,
    machineName as string,
    inputs as IIngredient[],
    fluidInputs as ILiquidStack[],
    outputs as IIngredient[],
    fluidOutputs as ILiquidStack[],
    time as long,
    energyInput as long,
    energyOutput as long
) as void {
    val builder = RecipeBuilder.newBuilder(recipeName, machineName, time);
    builder.setMaxThreads(1);
    if (energyInput > 0) {
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
    if (energyOutput > 0) {
        builder.addEnergyPerTickOutput(energyOutput);
    }
    builder.build();
};
global Recipe_Builder_SK_Chance_With_Mana as function(
    string,
    string,
    IIngredient[],
    double[],
    ILiquidStack[],
    double[],
    IIngredient[],
    double[],
    ILiquidStack[],
    double[],
    long,
    long,
    long
) void = function(
    recipeName as string,
    machineName as string,
    inputs as IIngredient[],
    inputChances as double[],
    fluidInputs as ILiquidStack[],
    fluidInputChances as double[],
    outputs as IIngredient[],
    outputChances as double[],
    fluidOutputs as ILiquidStack[],
    fluidOutputChances as double[],
    time as long,
    ManaInput as long,
    energyOutput as long
) as void {
    val builder = RecipeBuilder.newBuilder(recipeName, machineName, time);
    builder.setMaxThreads(1);
    if (ManaInput > 0) {
        builder.addManaInput(ManaInput, false);
    }
    // 物品输入
    for i in 0 to inputs.length {
        val item = inputs[i];
        val chance = (inputChances.length > i) ? inputChances[i] : 1.0;
        if (chance == 0.0) {
            builder.addItemInput(item).setChance(chance).setParallelizeUnaffected(true);
        } else {
            builder.addItemInput(item).setChance(chance);
        }
    }
    // 流体输入
    for i in 0 to fluidInputs.length {
        val fluid = fluidInputs[i];
        val chance = (fluidInputChances.length > i) ? fluidInputChances[i] : 1.0;
        if (chance == 0.0) {
            builder.addFluidInput(fluid).setChance(chance).setParallelizeUnaffected(true);
        } else {
            builder.addFluidInput(fluid).setChance(chance);
        }
    }
    // 物品输出
    for i in 0 to outputs.length {
        val item = outputs[i];
        val chance = (outputChances.length > i) ? outputChances[i] : 1.0;
        builder.addItemOutput(item).setChance(chance);
    }
    // 流体输出
    for i in 0 to fluidOutputs.length {
        val fluid = fluidOutputs[i];
        val chance = (fluidOutputChances.length > i) ? fluidOutputChances[i] : 1.0;
        builder.addFluidOutput(fluid).setChance(chance);
    }
    if (energyOutput > 0) {
        builder.addEnergyPerTickOutput(energyOutput);
    }
    builder.build();
};

// ====== 1. 使用 addAspectInput ======
global Recipe_Builder_SK_Aspect as function(
    string,          // recipeName
    string,          // machineName
    IIngredient[],   // inputs
    IIngredient[],   // outputs
    long,            // time
    long,            // energyInput
    string[],        // aspects
    int[]            // aspectAmounts
) void = function(
    recipeName as string,
    machineName as string,
    inputs as IIngredient[],
    outputs as IIngredient[],
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
    for i in 0 to aspects.length {
        builder.addAspectInput(aspects[i], aspectAmounts[i]);
    }
    builder.build();
};

// ====== 2. 使用 addEssentiaInput ======
global Recipe_Builder_SK_Essentia as function(
    string,          // recipeName
    string,          // machineName
    IIngredient[],   // inputs
    IIngredient[],   // outputs
    long,            // time
    long,            // energyInput
    string[],        // aspects
    int[]            // aspectAmounts
) void = function(
    recipeName as string,
    machineName as string,
    inputs as IIngredient[],
    outputs as IIngredient[],
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
    for i in 0 to aspects.length {
        builder.addEssentiaInput(aspects[i], aspectAmounts[i]);
    }
    builder.build();
};
global Sequenced_Assembler_Recipe_Builder as function(
    string,          // recipeName
    string,          // machineName
    string,          // ItemTagName
    string,          // FluidTagName
    IIngredient[],   // inputs
    ILiquidStack[],  // fluidInputs
    IIngredient[],   // outputs
    ILiquidStack[],  // fluidOutputs
    long,            // time
    long             // energyInput
) void = function(
    recipeName as string,
    machineName as string,
    ItemTagName as string,
    FluidTagName as string,
    inputs as IIngredient[],
    fluidInputs as ILiquidStack[],
    outputs as IIngredient[],
    fluidOutputs as ILiquidStack[],
    time as long,
    energyInput as long
) as void {
    val builder = RecipeBuilder.newBuilder(recipeName, machineName, time);
    var RealItemTagName = (ItemTagName == "") ? "sequenced_assembler_item_" : ItemTagName;
    var RealFluidTagName = (FluidTagName == "") ? "sequenced_assembler_fluid_" : FluidTagName;
    builder.setMaxThreads(1);
    if (energyInput > 0) {
        builder.addEnergyPerTickInput(energyInput);
    }
    for i, item in inputs {
        builder.addItemInput(item).setTag(RealItemTagName + (i + 1));
    }
    for i, fluid in fluidInputs {
        builder.addFluidInput(fluid).setTag(RealFluidTagName + (i + 1));
    }
    for item in outputs {
        builder.addItemOutput(item);
    }
    for fluid in fluidOutputs {
        builder.addFluidOutput(fluid);
    }
    builder.addRecipeTooltip("§c配方需要§6顺序输入§c！！§r");
    builder.setMaxThreads(1);
    builder.build();
};

//===========================================IData读取===========================================
// int
global Get_CustomData_int as function(IData, string, int)int = function(data as IData, key as string, default as int) as int {
    if (isNull(data)) return default;
    val value = data.memberGet(key);
    if (isNull(value)) return default;
    return value.asInt();
};
// long
global Get_CustomData_long as function(IData, string, long)long = function(data as IData, key as string, default as long) as long {
    if (isNull(data)) return default;
    val value = data.memberGet(key);
    if (isNull(value)) return default;
    return value.asLong();
};
// float
global Get_CustomData_float as function(IData, string, float)float = function(data as IData, key as string, default as float) as float {
    if (isNull(data)) return default;
    val value = data.memberGet(key);
    if (isNull(value)) return default;
    return value.asFloat();
};
// string
global Get_CustomData_string as function(IData, string, string)string = function(data as IData, key as string, default as string) as string {
    if (isNull(data)) return default;
    val value = data.memberGet(key);
    if (isNull(value)) return default;
    return value.asString();
};
// bool
global Get_CustomData_bool as function(IData, string, bool)bool = function(data as IData, key as string, default as bool) as bool {
    if (isNull(data)) return default;
    val value = data.memberGet(key);
    if (isNull(value)) return default;
    return value.asBool();
};
// double
global Get_CustomData_double as function(IData, string, double)double = function(data as IData, key as string, default as double) as double {
    if (isNull(data)) return default;
    val value = data.memberGet(key);
    if (isNull(value)) return default;
    return value.asDouble();
};

//===========================================IData读取===========================================
//===========================================IData写入===========================================
// int
global Write_CustomData_int as function(IData, string, int)IData = function(data as IData, key as string, value as int) as IData {
    var newData = data;
    if (isNull(newData)) newData = {} as IData;
    return newData + ({ key: value } as IData);
};
// long
global Write_CustomData_long as function(IData, string, long)IData = function(data as IData, key as string, value as long) as IData {
    var newData = data;
    if (isNull(newData)) newData = {} as IData;
    return newData + ({ key: value } as IData);
};
// float
global Write_CustomData_float as function(IData, string, float)IData = function(data as IData, key as string, value as float) as IData {
    var newData = data;
    if (isNull(newData)) newData = {} as IData;
    return newData + ({ key: value } as IData);
};
// string
global Write_CustomData_string as function(IData, string, string)IData = function(data as IData, key as string, value as string) as IData {
    var newData = data;
    if (isNull(newData)) newData = {} as IData;
    return newData + ({ key: value } as IData);
};
// double
global Write_CustomData_double as function(IData, string, double)IData = function(data as IData, key as string, value as double) as IData {
    var newData = data;
    if (isNull(newData)) newData = {} as IData;
    return newData + ({ key: value } as IData);
};
// bool
global Write_CustomData_bool as function(IData, string, bool)IData = function(data as IData, key as string, value as bool) as IData {
    var newData = data;
    if (isNull(newData)) newData = {} as IData;
    return newData + ({ key: value } as IData);
};
//===========================================IData写入===========================================
// 在公共库文件（如 aaa_function.zs）中添加此函数
global getOffsetPos as function(IMachineController, int, int, int)IBlockPos = function(
    ctrl as IMachineController,
    left as int,   // 左偏移（正=左，负=右）
    up as int,     // 上偏移（正=上，负=下）
    front as int   // 前偏移（正=前，负=后）
) as IBlockPos {
    val pos = ctrl.pos;
    val facing = ctrl.facing;

    // 左方向：绕 Y 轴逆时针旋转 90°（通过三次顺时针旋转实现）
    val leftDir = facing.rotateY().rotateY().rotateY();

    var result = pos;

    // 上下偏移
    if (up > 0) result = result.up(up);
    else if (up < 0) result = result.down(-up);

    // 左右偏移
    if (left > 0) result = result.getOffset(leftDir, -left);
    else if (left < 0) result = result.getOffset(leftDir.opposite, left);

    // 前后偏移
    if (front > 0) result = result.getOffset(facing.opposite, -front);
    else if (front < 0) result = result.getOffset(facing, front);

    return result;
};
// global getItemFromString as function(string)IItemStack = function(itemName as string) as IItemStack {
//     return itemUtils.getItem(itemName);
// };
