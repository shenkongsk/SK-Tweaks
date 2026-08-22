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



val MACHINE = "dream_energy_core";

MachineModifier.setMaxThreads(MACHINE,0);//将工厂控制器自带的线程清空，避免出现一些bug
MachineModifier.addCoreThread(MACHINE,FactoryRecipeThread.createCoreThread("能量输入"));
MachineModifier.addCoreThread(MACHINE,FactoryRecipeThread.createCoreThread("能量输出"));
// MachineModifier.addCoreThread(MACHINE,FactoryRecipeThread.createCoreThread("能量聚合"));

val maxenergy = 9223372036854775807 as long;
val energyin = 1000000 as long;
val energyout = 1000000 as long;
// 能量输入配方
// RecipeBuilder.newBuilder("EnergyInput_Dream",MACHINE,1)
//     .addEnergyPerTickInput(energyin)
//     .addPreCheckHandler(function(event as RecipeCheckEvent){
//         val data = event.controller.customData;
//         var energy = isNull(data.energy) ? 0 as long : (data.energy as long);
//         if((energy + energyin) > maxenergy){
//             event.setFailed("能量存储已达极限！");//当已有能量加上输入能量会超过上限时则不会输入能量
//         }
//     })
//     .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent){
//         val data = event.controller.customData;
//         val map = data.asMap();
//         var energy = isNull(data.energy) ? 0 as long : (data.energy as long);
//         map["energy"] = energy + energyin;
//         event.controller.customData = data;
//     })
//     .setThreadName("能量输入")
//     .build();
RecipeBuilder.newBuilder("EnergyInput_Dream", MACHINE, 1)
    .addEnergyPerTickInput(energyin)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val data = event.controller.customData;
        var energy = isNull(data) ? 0 as long : (isNull(data.energy) ? 0 as long : data.energy as long);
        // 读取 speed 值，默认为 1.0
        var speed = 1.0;
        if (!isNull(data)) {
            val speedVal = data.memberGet("speed");
            if (!isNull(speedVal)) speed = speedVal as double;
        }
        val actualInput = (energyin * speed) as long;
        if ((energy + actualInput) > maxenergy) {
            event.setFailed("能量存储已达极限！");
        }
    })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        var data = event.controller.customData;
        if (isNull(data)) data = {} as IData;
        var energy = isNull(data.energy) ? 0 as long : data.energy as long;
        // 读取 speed 值，默认为 1.0
        var speed = 1.0;
        val speedVal = data.memberGet("speed");
        if (!isNull(speedVal)) speed = speedVal as double;
        // 计算实际输入量
        val actualInput = (energyin * speed) as long;
        val newEnergy = energy + actualInput;
        // 使用 IData 合并（推荐）
        val newData = data + ({ "energy": newEnergy } as IData);
        event.controller.customData = newData;
    })
    .setThreadName("能量输入")
    .build();

// 能量输出配方
RecipeBuilder.newBuilder("EnergyOutput_Dream", MACHINE, 1)
    .addEnergyPerTickOutput(energyout)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val data = event.controller.customData;
        var energy = isNull(data) ? 0 as long : (isNull(data.energy) ? 0 as long : data.energy as long);
        if (energy < energyout) {
            event.setFailed("能量不够输出！");
        }
    })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        var data = event.controller.customData;
        if (isNull(data)) data = {} as IData;
        var energy = isNull(data.energy) ? 0 as long : data.energy as long;
        val newEnergy = energy - energyout;
        val newData = data + ({ "energy": newEnergy } as IData);
        event.controller.customData = newData;
    })
    .setThreadName("能量输出")
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
MMEvents.onControllerGUIRender(MACHINE,function(event as ControllerGUIRenderEvent){
    val ctrl = event.controller;
    val data = ctrl.customData;
    var energy = isNull(data.energy) ? 0 as long : (data.energy as long);
    var info as string[] = [];
    var energy_speed = isNull(data.speed) ? 1.0 : data.speed as double;
    energy_speed *= energyin;
    info += "§a=======§b能量核心监控器§a=======";
    info += "§c" + formatNumber(energy) + "/" + formatNumber(maxenergy);
    info += "§b当前输入输出速度：§6" + formatNumber(energy_speed) + "RF/t";
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
val maxSpeed= 2000000000.0 as double ;
//基础输入输出速度。能量输入输出速度计算方法为：defaultTransferAmount * speed,其中 speed 可由玩家控制。
// val defaultTransferAmount as long = DreamEnergyCore.setDefaultTransferAmount(100000000);
val defaultTransferAmount = 100000000 as long;

// 智能数据接口数据类型定义
MachineModifier.addSmartInterfaceType(MACHINE,
    SmartInterfaceType.create("speed", 0)
        .setHeaderInfo("能量输入输出速度设置")
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

function writeSmartInterfaceDataToCustomData(event as MachineTickEvent, minSpeed as double, maxSpeed as double) {
    val ctrl = event.controller;
    var data = ctrl.customData;
    if (isNull(data)) data = {} as IData;
    val map = data.asMap();
    val nullable = ctrl.getSmartInterfaceData("speed");
    var speed = isNull(nullable) ? 1.0 : (nullable.value as double);

    // 限幅并同步更新 speed 变量
    if (speed < minSpeed) {
        speed = 1.0;
        if (!isNull(nullable)) nullable.value = 1.0;
    } else if (speed > maxSpeed) {
        speed = maxSpeed;
        if (!isNull(nullable)) nullable.value = maxSpeed;
    }

    map["speed"] = speed;
    ctrl.customData = data;
    // 如果不需要永久修饰符，可以注释掉下面两行
    ctrl.addPermanentModifier("receive", RecipeModifierBuilder.create("modularmachinery:energy", "input", speed, 1, false).build());
    ctrl.addPermanentModifier("extract", RecipeModifierBuilder.create("modularmachinery:energy", "output", speed, 1, false).build());
}