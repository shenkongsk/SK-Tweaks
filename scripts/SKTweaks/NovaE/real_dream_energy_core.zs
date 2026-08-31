#loader crafttweaker reloadable
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.GeoMachineModel;
import mods.modularmachinery.ControllerModelAnimationEvent;
import crafttweaker.world.IBlockPos;
import mods.ctutils.utils.Math;
import native.java.math.BigInteger;
import mods.modularmachinery.MachineUpgradeHelper;
import mods.modularmachinery.MachineUpgradeBuilder;
// import novaeng.DreamEnergyCore;
// import novaeng.NovaEngUtils;
// 没有新星核心纯手搓了，性能问题的话，你完全可以用龙球）
// 虽然龙球只能存9.2E,不过我感觉完全够用了（数值没膨胀的时候）
// 再说你后期都这么卡了，还在意一个梦核的卡顿？



val MACHINE = "dream_energy_core";

MachineModifier.setMaxThreads(MACHINE,0);
MachineModifier.addCoreThread(MACHINE,FactoryRecipeThread.createCoreThread("梦之输入模块"));
MachineModifier.addCoreThread(MACHINE,FactoryRecipeThread.createCoreThread("梦之输出模块"));
MachineModifier.addCoreThread(MACHINE,FactoryRecipeThread.createCoreThread("梦之充能模块"));

// val maxenergy = 9223372036854775807 as long;
val energyin = 1000000 as long;
val energyout = 1000000 as long;
// 能量输入配方
RecipeBuilder.newBuilder("EnergyInput_Dream", MACHINE, 1)
    .addEnergyPerTickInput(energyin)
    // .addPreCheckHandler(function(event as RecipeCheckEvent) {
    //     val data = event.controller.customData;
    //     var energy = isNull(data) ? 0 as long : (isNull(data.energy) ? 0 as long : data.energy as long);
    //     // 读取 speed 值，默认为 1.0
    //     var speed = 1.0;
    //     if (!isNull(data)) {
    //         val speedVal = data.memberGet("speed");
    //         if (!isNull(speedVal)) speed = speedVal as double;
    //     }
    //     val actualInput = (energyin * speed) as long;
    //     if ((energy + actualInput) > maxenergy) {
    //         event.setFailed("能量存储已达极限！");
    //     }
    // })
    // .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
    //     var data = event.controller.customData;
    //     if (isNull(data)) data = {} as IData;
    //     var energy = isNull(data.energy) ? "0" as string  : data.energy as string;
    //     // 读取 speedIn 值，默认为 1.0
    //     var speedIn = 1.0;
    //     val speedInVal = data.memberGet("speedIn");
    //     if (!isNull(speedInVal)) speedIn = speedInVal as double;
    //     // 计算实际输入量
    //     val actualInput = BigInteger.valueOf(energyin * speedIn);
    //     val newEnergy = BigInteger(energy).add(actualInput);
    //     val newEnergy_bigint_str = newEnergy.toString();
    //     // 使用 IData 合并（推荐）
    //     val newData = data + ({ "energy": newEnergy_bigint_str } as IData);
    //     event.controller.customData = newData;
    // })
        .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        var data = event.controller.customData;
        if (isNull(data)) data = {} as IData;
        var energy = isNull(data.energy) ? "0" as string : data.energy as string;
        var speedIn = 1.0;
        val speedInVal = data.memberGet("speed_in");
        if (!isNull(speedInVal)) speedIn = speedInVal as double;
        // 缩放法计算实际输入量
        val actualInput = BigInteger.valueOf(energyin)
                .multiply(BigInteger.valueOf((speedIn * 1000) as long))
                .divide(BigInteger.valueOf(1000));
        val newEnergy = BigInteger(energy).add(actualInput);
        val newData = data + ({ "energy": newEnergy.toString() } as IData);
        event.controller.customData = newData;
    })
    .setParallelized(false)
    .setThreadName("梦之输入模块")
    .build();

// 能量输出配方
RecipeBuilder.newBuilder("EnergyOutput_Dream", MACHINE, 1)
    .addEnergyPerTickOutput(energyout)
    // .addPreCheckHandler(function(event as RecipeCheckEvent) {
    //     val data = event.controller.customData;
    //     // var energy = isNull(data) ? 0 as long : (isNull(data.energy) ? 0 as long : data.energy as long);
    //     var energy = (isNull(data) || isNull(data.memberGet("energy"))) ? BigInteger("0") : BigInteger(data.memberGet("energy") as string);
    //     if (energy.compareTo(BigInteger.valueOf(energyout)) < 0) {
    //         event.setFailed("能量不够输出！");
    //     }
    // })
    // .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
    //     var data = event.controller.customData;
    //     if (isNull(data)) data = {} as IData;
    //     var energystr = isNull(data.energy) ? "0" as string : data.energy as string;
    //     var energy = BigInteger(energystr);
    //     var newEnergy = energy.subtract(BigInteger.valueOf(energyout));
    //     var newData = data + ({ "energy": newEnergy.toString() } as IData);
    //     event.controller.customData = newData;
    // })
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val data = event.controller.customData;
        var current = (isNull(data) || isNull(data.memberGet("energy"))) ? BigInteger("0") : BigInteger(data.memberGet("energy") as string);
        // 读取速度倍率
        var speedOut = 1.0;
        val speedOutVal = data.memberGet("speed_out");
        if (!isNull(speedOutVal)) speedOut = speedOutVal as double;
        // 计算实际需要扣减的量
        val required = BigInteger.valueOf(energyout)
                .multiply(BigInteger.valueOf((speedOut * 1000) as long))
                .divide(BigInteger.valueOf(1000));
        if (current.compareTo(required) < 0) {
            event.setFailed("能量不够输出");
        }
    })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        var data = event.controller.customData;
        if (isNull(data)) data = {} as IData;
        var energystr = isNull(data.energy) ? "0" as string : data.energy as string;
        var energy = BigInteger(energystr);
        var speedOut = 1.0;
        val speedOutVal = data.memberGet("speed_out");
        if (!isNull(speedOutVal)) speedOut = speedOutVal as double;
        val actualOutput = BigInteger.valueOf(energyout)
                .multiply(BigInteger.valueOf((speedOut * 1000) as long))
                .divide(BigInteger.valueOf(1000));
        var newEnergy = energy.subtract(actualOutput);
        var newData = data + ({ "energy": newEnergy.toString() } as IData);
        event.controller.customData = newData;
    })
    .setParallelized(false)
    .setThreadName("梦之输出模块")
    .build();

function formatNumber(value as long) as string {
    if (value < 1000) {
        return "" + value;
    } else if (value < 1000000) {
        return "" + (value / 1000) + "K";
    } else if (value < 1000000000) {
        return "" + ((value / 1000) as float / 1000) + "M";
    } else if (value < 1000000000000) {
        return "" + ((value / 1000000) as float / 1000) + "G";
    } else if (value < 1000000000000000) {
        return "" + ((value / 1000000000) as float / 1000) + "T";
    } else if (value < 1000000000000000000) {
        return "" + ((value / 1000000000000) as float / 1000) + "P";
    } else {
        return "" + ((value / 1000000000000000) as float / 1000) + "E";
    }
}
// ======================== 格式化 BigInteger（带单位，超 Y 用科学计数法） ========================
function formatBigNumber(value as BigInteger) as string {
    if (isNull(value)) return "0";
    if (value.compareTo(BigInteger.ZERO) == 0) return "0";
    if (value.compareTo(BigInteger.ZERO) < 0) return "-" + formatBigNumber(value.negate());
    if (isNull(value) || value.compareTo(BigInteger.ZERO) == 0) return "0";
    val units = ["", "K", "M", "G", "T", "P", "E", "Z", "Y"];
    var idx = 0;
    var absVal = value;
    while (absVal.compareTo(BigInteger.valueOf(1000)) >= 0 && idx < units.length - 1) {
        absVal = absVal.divide(BigInteger.valueOf(1000));
        idx = idx + 1;
    }
    // 超过 Y 用科学计数法
    if (idx == units.length - 1 && absVal.compareTo(BigInteger.valueOf(1000)) >= 0) {
        val str = value.toString();
        val len = str.length();
        val exponent = len - 1;
        var mantissa = str.substring(0, 1);
        if (len > 1) mantissa = mantissa + "." + str.substring(1, 2);
        else mantissa = mantissa + ".0";
        return mantissa + "E" + exponent;
    }
    // 正常带单位显示
    val remainder = value.mod(BigInteger.valueOf(1000));
    if (remainder.compareTo(BigInteger.ZERO) > 0) {
        val decimal = remainder.multiply(BigInteger.valueOf(10)).divide(BigInteger.valueOf(1000));
        return absVal.toString() + "." + decimal.toString() + units[idx];
    } else {
        return absVal.toString() + units[idx];
    }
}
// MMEvents.onControllerGUIRender(MACHINE,function(event as ControllerGUIRenderEvent){
//     val ctrl = event.controller;
//     val data = ctrl.customData;
//     // var energy = isNull(data.energy) ? 0 as long : (data.energy as long);
//     var energy = isNull(data.energy) ? "0" as string : (data.energy as string);
//     var info as string[] = [];
//     var energy_speed = isNull(data.speed) ? 1.0 : data.speed as double;
//     energy_speed *= energyin;
//     val energy_Bigint = BigInteger(energy);
//     info += "§a=======§b能量核心监控器§a=======";
//     info += "§6" + formatBigNumber(energy_Bigint) + "§e/" + "§6INFINITY";
//     info += "§b当前输入输出速度：§6" + formatNumber(energy_speed) + "RF/t";
//     event.extraInfo = info;
// });
MMEvents.onControllerGUIRender(MACHINE,function(event as ControllerGUIRenderEvent){
    val ctrl = event.controller;
    val data = ctrl.customData;
    var energy = isNull(data.energy) ? "0" as string : (data.energy as string);
    var energy_Bigint = BigInteger(energy);
    var speed_input = isNull(data.speed_in) ? 1.0 : data.speed_in as double;
    var speed_output = isNull(data.speed_out) ? 1.0 : data.speed_out as double;
    var energy_speed_in = speed_input * energyin;
    var energy_speed_out = speed_output * energyout;
    var working = ctrl.isWorking ? "§a● 工作中" : "§7○ 待机";

    var inputWorking = "§7○ 待机";
    var outputWorking = "§7○ 待机";
    var chargeWorking = "§7○ 待机";
    // ctrl.recipeThreadList[3].activeRecipe
    if(!isNull(ctrl.recipeThreadList[0].activeRecipe)){
        inputWorking = "§a● 工作中";    
    }
    if(!isNull(ctrl.recipeThreadList[1].activeRecipe)){
        outputWorking = "§a● 工作中";    
    }
    if(!isNull(ctrl.recipeThreadList[2].activeRecipe)){
        chargeWorking = "§a● 工作中";    
    }


    var info as string[] = [];
    
    // 标题行
    info += "§3║§6✦§b 梦之§a能量核心 §f| §7v2.0 ";
    // 所有者 & 状态
    var owner = isNull(data.owner) ? "未绑定" : data.owner as string;
    info += "§3║§b▸ §7结构：§r" + "§a已形成" ;
    info += "§3║§b▸ §7状态：§r" + working;
    
    // 能量数据
    info += "§3║§b▸ 存储电量：§6" + formatBigNumber(energy_Bigint);
    info += "§3║§b▸ 存储上限：§6∞ RF";
    
    // 输入/输出
    info += "§3║§a▸ 能量输入：§r" + inputWorking;
    info += "§3║§c▸ 能量输出：§r" + outputWorking;
    info += "§3║§d▸ 能量聚合：§r" + chargeWorking;
    info += "§3║§b▸ 当前输入：§6" + formatNumber(energy_speed_in) + " RF/t";
    info += "§3║§b▸ 当前输出：§6" + formatNumber(energy_speed_out) + " RF/t";
    
    // 模式 & 附加信息
    // var mode = ctrl.isWorking ? "§aASYNC" : "§7IDLE";
    // info += "§3║§b▸ 工作模式：§f" + mode;
    info += "§3║§b▸ CPU 负载：§6" + (ctrl.isWorking ? (Math.random() * 20 + 10) as int : 0) + "%";

    
    event.extraInfo = info;
});
//================================================模型================================================
GeoMachineModel.registerGeoMachineModel(MACHINE, // wi_dream_energy_core
    "modularmachinery:geo/dream_energy_core.geo.json", // geo模型文件路径
    "modularmachinery:textures/dream_energy_core.png", // 模型贴图路径
    "modularmachinery:animations/dream_energy_core.animation.json" // animation模型动画路径
);
MachineModifier.setMachineGeoModel(MACHINE, MACHINE);
MMEvents.onControllerModelAnimation(MACHINE, function(event as ControllerModelAnimationEvent) {
    event.addAnimation("test", true);
});
//================================================模型================================================
// 最小传输速度,按倍计。
// val minSpeed as float = DreamEnergyCore.setMinSpeed(0.01 as float);
val minSpeed =0.001 as double;
//最大传输速度,按倍计。
// val maxSpeed as int = DreamEnergyCore.setMaxSpeed(200000);
val maxSpeed= 1000000000000000.0 as double ;
//基础输入输出速度。能量输入输出速度计算方法为：defaultTransferAmount * speed,其中 speed 可由玩家控制。
// val defaultTransferAmount as long = DreamEnergyCore.setDefaultTransferAmount(100000000);
val defaultTransferAmount = 100000000 as long;

// 智能数据接口数据类型定义
MachineModifier.addSmartInterfaceType(MACHINE,
    SmartInterfaceType.create("speed_input", 0)
        .setHeaderInfo("能量输入速度设置")
        .setValueInfo("速度：§a%.2f 倍")
        // .setFooterInfo(
        //     "例：0.1 倍即为 " + NovaEngUtils.formatNumber((defaultTransferAmount as float * 0.1) as long) + "RF,10 倍即为 " + NovaEngUtils.formatNumber(defaultTransferAmount * 10) + "RF"
        // )
        .setFooterInfo("")
        .setJeiTooltip("速度范围：最低 §a%.2f 倍§f,最高 §a%.0f 倍", 2)
        // .setNotEqualMessage("输入输出速度过载或过低！")
);
MachineModifier.addSmartInterfaceType(MACHINE,
    SmartInterfaceType.create("speed_output", 1)
        .setHeaderInfo("能量输出速度设置")
        .setValueInfo("速度：§a%.2f 倍")
        // .setFooterInfo(
        //     "例：0.1 倍即为 " + NovaEngUtils.formatNumber((defaultTransferAmount as float * 0.1) as long) + "RF,10 倍即为 " + NovaEngUtils.formatNumber(defaultTransferAmount * 10) + "RF"
        // )
        .setFooterInfo("")
        .setJeiTooltip("速度范围：最低 §a%.2f 倍§f,最高 §a%.0f 倍", 2)
        // .setNotEqualMessage("输入输出速度过载或过低！")
);

// 写入智能数据接口信息
MMEvents.onMachinePostTick(MACHINE, function(event as MachineTickEvent) {
    writeSmartInterfaceDataToCustomData(event, minSpeed, maxSpeed);
});

// function writeSmartInterfaceDataToCustomData(event as MachineTickEvent, minSpeed as double, maxSpeed as double) {
//     val ctrl = event.controller;
//     var data = ctrl.customData;
//     if (isNull(data)) data = {} as IData;
//     val map = data.asMap();
//     val nullable = ctrl.getSmartInterfaceData("speed");
//     var speed = isNull(nullable) ? 1.0 : (nullable.value as double);

//     // 限幅并同步更新 speed 变量
//     if (speed < minSpeed) {
//         speed = 1.0;
//         if (!isNull(nullable)) nullable.value = 1.0;
//     } else if (speed > maxSpeed) {
//         speed = maxSpeed;
//         if (!isNull(nullable)) nullable.value = maxSpeed;
//     }

//     map["speed"] = speed;
//     ctrl.customData = data;
//     ctrl.addPermanentModifier("receive", RecipeModifierBuilder.create("modularmachinery:energy", "input", speed, 1, false).build());
//     ctrl.addPermanentModifier("extract", RecipeModifierBuilder.create("modularmachinery:energy", "output", speed, 1, false).build());
// }
function writeSmartInterfaceDataToCustomData(event as MachineTickEvent, minSpeed as double, maxSpeed as double) {
    val ctrl = event.controller;
    var data = ctrl.customData;
    if (isNull(data)) data = {} as IData;
    val map = data.asMap();

    // 输入速度
    val nullableIn = ctrl.getSmartInterfaceData("speed_input");
    var speedIn = isNull(nullableIn) ? 1.0 : (nullableIn.value as double);
    if (speedIn < minSpeed) { speedIn = minSpeed; nullableIn.value = minSpeed; }
    else if (speedIn > maxSpeed) { speedIn = maxSpeed; nullableIn.value = maxSpeed; }
    map["speed_in"] = speedIn;   // 统一键名

    // 输出速度
    val nullableOut = ctrl.getSmartInterfaceData("speed_output");
    var speedOut = isNull(nullableOut) ? 1.0 : (nullableOut.value as double);
    if (speedOut < minSpeed) { speedOut = minSpeed; nullableOut.value = minSpeed; }
    else if (speedOut > maxSpeed) { speedOut = maxSpeed; nullableOut.value = maxSpeed; }
    map["speed_out"] = speedOut; // 统一键名

    ctrl.customData = data;
    ctrl.addPermanentModifier("receive", RecipeModifierBuilder.create("modularmachinery:energy", "input", speedIn, 1, false).build());
    ctrl.addPermanentModifier("extract", RecipeModifierBuilder.create("modularmachinery:energy", "output", speedOut, 1, false).build());
}

function Dream_Core_Hyper_Charge(
    RecipeName as string,
    ItemInputs as IIngredient[],
    ItemOutputs as IIngredient[],
    EnergyInput as BigInteger,
    time as long
)as void{
    val builder = RecipeBuilder.newBuilder(RecipeName, "dream_energy_core", time);
    for item in ItemInputs {
        builder.addItemInput(item);
    }
    for item in ItemOutputs {
        builder.addItemOutput(item);
    }
    builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
        var data = event.controller.customData;
        var current = (isNull(data) || isNull(data.memberGet("energy"))) ? BigInteger("0") : BigInteger(data.memberGet("energy") as string);
        if (current.compareTo(EnergyInput) < 0) {
            event.setFailed("机器存储能量不足！");
        }
    });
    builder.addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        var data = event.controller.customData;
        if (isNull(data)) data = {} as IData;
        var current = (isNull(data) || isNull(data.memberGet("energy"))) ? BigInteger("0") : BigInteger(data.memberGet("energy") as string);
        val newEnergy = current.subtract(EnergyInput);
        val newData = data + ({ "energy": newEnergy.toString() } as IData);
        event.controller.customData = newData;
    });
    builder.setThreadName("梦之充能模块");
    builder.addRecipeTooltip("§c梦之充能模块：","§e需要RF：§6§l"+formatBigNumber(EnergyInput));
    builder.build();

}
var DCHC_Inputs = [
    [<contenttweaker:eye_of_harmony_power_unit>]
];
var DCHC_Outputs = [
    [<contenttweaker:eye_of_harmony_power_unit_hypercharged>]
];
var DCHC_Energy = [
    "10000000000000000"
];
var DCHC_Time = [
    2000
];
for i in 0 to DCHC_Inputs.length{
    Dream_Core_Hyper_Charge(
        "Dream_Core_Hyper_Charge_" + i,
        DCHC_Inputs[i],
        DCHC_Outputs[i],
        BigInteger(DCHC_Energy[i]),
        DCHC_Time[i]
    );
}