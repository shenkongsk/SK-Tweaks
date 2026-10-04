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
import native.java.math.BigInteger;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import mods.modularmachinery.MachineController;
import mods.modularmachinery.RecipeFinishEvent;
// 神秘时代相关
import native.com.blamejared.compat.thaumcraft.handlers.ThaumCraft;
import native.thaumcraft.api.ThaumcraftApiHelper;
import thaumcraft.aspect.CTAspectStack;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import crafttweaker.world.IWorld;

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
// ==================================梦核相关=================================
global formatBigNumber_not_recursive as function(BigInteger) string = function(value as BigInteger) as string {
    if (isNull(value)) return "0";
    val zero = BigInteger("0");
    if (value.compareTo(zero) == 0) return "0";

    var isNeg = value.compareTo(zero) < 0;
    var v = value;
    if (isNeg) {
        v = zero.subtract(value);   // 代替 negate()
    }

    val thousand = BigInteger.valueOf(1000);
    val units = ["", "K", "M", "G", "T", "P", "E", "Z", "Y"];
    var idx = 0;
    var absVal = v;
    while (absVal.compareTo(thousand) >= 0 && idx < units.length - 1) {
        absVal = absVal.divide(thousand);
        idx = idx + 1;
    }

    val prefix = isNeg ? "-" : "";

    if (idx == units.length - 1 && absVal.compareTo(thousand) >= 0) {
        val str = v.toString();
        val len = str.length;
        val exponent = len - 1;
        var mantissa = str.substring(0, 1);
        if (len > 1) {
            mantissa = mantissa + "." + str.substring(1, 2);
        } else {
            mantissa = mantissa + ".0";
        }
        return prefix + mantissa + "E" + exponent;
    }

    if (idx == 0) {
        return prefix + absVal.toString();
    }

    var divisor = BigInteger("1");
    for i in 0 to (idx - 2) {
        divisor = divisor.multiply(thousand);
    }
    val scaled = v.divide(divisor);
    val fracPart = scaled.mod(thousand);

    if (fracPart.compareTo(zero) == 0) {
        return prefix + absVal.toString() + units[idx];
    }
    val decimal = fracPart.divide(BigInteger.valueOf(100));
    return prefix + absVal.toString() + "." + decimal.toString() + units[idx];
};

// 检查控制器是否存在
global Check_DE_Core_Exist as function(IMachineController)bool = function(ctrl as IMachineController) as bool {
    val data = ctrl.customData;
    if (isNull(data)) return false;
    val decoreX = data.memberGet("DECore_X");
    if (isNull(decoreX)) return false;
    val x = decoreX as int;
    val y = Get_CustomData_int(data, "DECore_Y", 0);
    val z = Get_CustomData_int(data, "DECore_Z", 0);
    val dim = Get_CustomData_int(data, "DECore_Dim", 0);
    val cworld = IWorld.getFromID(dim);
    val decoreCtrl = MachineController.getControllerAt(cworld, x, y, z);
    if (isNull(decoreCtrl)) {
        val cleared = data - "DECore_X" - "DECore_Y" - "DECore_Z" - "DECore_Dim";
        ctrl.customData = cleared;
        return false;
    }
    return true;
};

// 检查控制器能量够不够一次
global Get_DE_Energy as function(IMachineController)BigInteger = function(ctrl as IMachineController) as BigInteger {
    val data = ctrl.customData;
    if (isNull(data)) return  BigInteger("0");
    val decoreX = Get_CustomData_int(data, "DECore_X", 0);
    val decoreY = Get_CustomData_int(data, "DECore_Y", 0);
    val decoreZ = Get_CustomData_int(data, "DECore_Z", 0);
    val decoreDim = Get_CustomData_int(data, "DECore_Dim", 0);
    val cworld = IWorld.getFromID(decoreDim);
    val decoreCtrl = MachineController.getControllerAt(cworld, decoreX, decoreY, decoreZ);
    if (isNull(decoreCtrl)) return  BigInteger("0");
    val deData = decoreCtrl.customData;
    if (isNull(deData)) return  BigInteger("0");
    val energy = Get_CustomData_string(deData, "energy", "0");
    return BigInteger(energy);
};

// global DE_Energy_PreCheck as function(RecipeCheckEvent,BigInteger)bool = function(event as RecipeCheckEvent, EnergyInput as BigInteger) as bool {
//     val ctrl = event.controller;
//     if((Check_DE_Core_Exist(ctrl) == false)) {
//         event.setFailed("未连接梦之能量核心！");
//         return false;
//     }
//     if((Get_DE_Energy(ctrl).compareTo(EnergyInput) < 0)) {
//         event.setFailed("能量不足！");
//         return false;
//     }
//     return true;
// };

// 综合检查
global DE_Energy_PreCheck as function(RecipeCheckEvent, BigInteger) bool = function(event as RecipeCheckEvent, EnergyInput as BigInteger) as bool {
    val ctrl = event.controller as IMachineController;
    if (!Check_DE_Core_Exist(ctrl)) {
        event.setFailed("未连接梦之能量核心！");
        return false;
    }
    if (EnergyInput.compareTo(BigInteger("0")) <= 0) return true;

    val energy = Get_DE_Energy(ctrl);
    if (energy.compareTo(EnergyInput) < 0) {
        event.setFailed("能量不足！");
        return false;
    }

    val maxPossibleParallel = energy.divide(EnergyInput).longValue();

    val activeRecipe = event.activeRecipe;
    if (!isNull(activeRecipe)) {
        var machineParallel = activeRecipe.maxParallelism;
        if (machineParallel <= 0) machineParallel = 1;
        var finalParallel = maxPossibleParallel as int;
        if (finalParallel > machineParallel) finalParallel = machineParallel;
        activeRecipe.maxParallelism = finalParallel;
    }
    // 拿不到 activeRecipe 时，至少保证单次能量够，不阻止配方启动

    return true;
};

// 梦核能量IO
global DE_Energy_IO as function(IMachineController,BigInteger)void = function(ctrl as IMachineController,EnergyIO as BigInteger) as void {
    // 只能在配方完成时调用（一次性）
    // 不是每tick调用一次
    val data = ctrl.customData;
    if (isNull(data)) return;
    val decoreX = Get_CustomData_int(data, "DECore_X", 0);
    val decoreY = Get_CustomData_int(data, "DECore_Y", 0);
    val decoreZ = Get_CustomData_int(data, "DECore_Z", 0);
    val decoreDim = Get_CustomData_int(data, "DECore_Dim", 0);
    val cworld = IWorld.getFromID(decoreDim);
    val decoreCtrl = MachineController.getControllerAt(cworld, decoreX, decoreY, decoreZ);
    if (isNull(decoreCtrl)) return;
    val deData = decoreCtrl.customData;
    if (isNull(deData)) return;
    val energy = BigInteger(Get_CustomData_string(deData, "energy", "0"));
    val newEnergy = energy.add(EnergyIO);
    var newData = deData + ({ "energy": newEnergy.toString() } as IData);
    decoreCtrl.customData = newData;
};

// 梦核连接后的配方
global Recipe_DE_Builder_SK as function(
    string,
    string,
    IIngredient[],
    ILiquidStack[],
    IIngredient[],
    ILiquidStack[],
    long,
    BigInteger,
    BigInteger,
    string
) void = function(
    recipeName as string,
    machineName as string,
    inputs as IIngredient[],
    fluidInputs as ILiquidStack[],
    outputs as IIngredient[],
    fluidOutputs as ILiquidStack[],
    time as long,
    energyInput as BigInteger,
    energyOutput as BigInteger,
    ControllerType as string
) as void {
    val builder = RecipeBuilder.newBuilder(recipeName, machineName, time);
    var Energy_tooltip = "";
    if (energyInput.compareTo(BigInteger("0"))>0) {
        Energy_tooltip = "§e需要 RF：§6" + formatBigNumber_not_recursive(energyInput);
    }
    if (energyOutput.compareTo(BigInteger("0"))>0) {
        Energy_tooltip = "§eRF 输出：§6" + formatBigNumber_not_recursive(energyOutput);
    }
    builder.setMaxThreads(1);
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
    builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
        DE_Energy_PreCheck(event, energyInput);
    });
    if(ControllerType == "factory"){
        builder.addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
            var parallel = 1;
            val activeRecipe = event.activeRecipe;
            if (!isNull(activeRecipe)) {
                parallel = activeRecipe.parallelism;
                if (parallel <= 0) parallel = 1;
            }
            DE_Energy_IO(
                event.controller,
                (energyOutput.subtract(energyInput)).multiply(BigInteger.valueOf(parallel as long))
            );
        });
    }else{
        builder.addFinishHandler(function(event as RecipeFinishEvent) {
            var parallel = 1;
            val activeRecipe = event.activeRecipe;
            if (!isNull(activeRecipe)) {
                parallel = activeRecipe.parallelism;
                if (parallel <= 0) parallel = 1;
            }
            DE_Energy_IO(
                event.controller,
                (energyOutput.subtract(energyInput)).multiply(BigInteger.valueOf(parallel as long))
            );
        });
    }
    builder.addRecipeTooltip(
        "§a梦之§b能量核心§6连接:",
        Energy_tooltip
        );
    builder.build();
};