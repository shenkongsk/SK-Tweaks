// #loader crafttweaker reloadable

// import crafttweaker.data.IData;
// import crafttweaker.item.IIngredient;
// import mods.modularmachinery.RecipeBuilder;
// import mods.modularmachinery.RecipeCheckEvent;
// import mods.modularmachinery.FactoryRecipeStartEvent;
// import mods.modularmachinery.FactoryRecipeFinishEvent;
// import mods.modularmachinery.RecipeModifierBuilder;
// import mods.modularmachinery.MMEvents;
// import mods.modularmachinery.MachineTickEvent;
// import mods.modularmachinery.ControllerGUIRenderEvent;
// import mods.modularmachinery.IMachineController;
// import mods.modularmachinery.MachineModifier;
// import mods.modularmachinery.SmartInterfaceType;
// import mods.modularmachinery.FactoryRecipeThread;
// import mods.modularmachinery.FactoryRecipeTickEvent;
// import mods.modularmachinery.SmartInterfaceData;
// import mods.modularmachinery.GeoMachineModel;
// import mods.modularmachinery.ControllerModelAnimationEvent;
// import crafttweaker.world.IBlockPos;
// import mods.ctutils.utils.Math;
// // 导入 Big.zs
// import scripts.SKTweaks.lib.Big;


// // 注意：Big.zs 中已定义 Big_zs 和全局函数 Big，无需再导入 BigInteger

// val MACHINE = "dream_energy_core";

// // 线程配置
// MachineModifier.setMaxThreads(MACHINE, 0);
// MachineModifier.addCoreThread(MACHINE, FactoryRecipeThread.createCoreThread("能量输入"));
// MachineModifier.addCoreThread(MACHINE, FactoryRecipeThread.createCoreThread("能量输出"));

// // 常量定义（使用 Big_zs）
// val maxenergyStr = "99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999";
// val maxenergy = Big(BigInteger(maxenergyStr));   // 通过 Big 创建 Big_zs

// val energyin = 1000000 as long;
// val energyout = 1000000 as long;

// // 辅助函数：从字符串创建 Big_zs（安全）
// function bigFromString(str as string) as Big_zs {
//     if (isNull(str) || str == "") return Big(BigInteger("0"));
//     return Big(BigInteger(str));
// }

// // 辅助函数：从 customData 读取能量
// function getEnergyFromData(data as IData) as Big_zs {
//     if (isNull(data)) return Big(BigInteger("0"));
//     val energyStr = data.memberGet("energy") as string;
//     return bigFromString(energyStr);
// }

// // 辅助函数：将 Big_zs 写入 customData（存为字符串）
// function setEnergyToData(data as IData, value as Big_zs) as IData {
//     if (isNull(data)) data = {} as IData;
//     return data + ({ "energy": value.c.toString() } as IData);
// }

// // 能量输入配方
// RecipeBuilder.newBuilder("EnergyInput_Dream", MACHINE, 1)
//     .addEnergyPerTickInput(energyin)
//     .addPreCheckHandler(function(event as RecipeCheckEvent) {
//         val ctrl = event.controller;
//         var data = ctrl.customData;
//         if (isNull(data)) data = {} as IData;
//         val energy = getEnergyFromData(data);
//         // 读取 speed
//         var speed = 1.0;
//         val speedVal = data.memberGet("speed");
//         if (!isNull(speedVal)) speed = speedVal as double;
//         // 实际输入量（BigInteger）
//         val actualInput = BigInteger(((energyin as double) * speed) as long);
//         // 比较：energy.c.add(actualInput) > maxenergy.c
//         if (energy.c.add(actualInput).compareTo(maxenergy.c) > 0) {
//             event.setFailed("能量存储已达极限！");
//         }
//     })
//     .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
//         val ctrl = event.controller;
//         var data = ctrl.customData;
//         if (isNull(data)) data = {} as IData;
//         val energy = getEnergyFromData(data);
//         var speed = 1.0;
//         val speedVal = data.memberGet("speed");
//         if (!isNull(speedVal)) speed = speedVal as double;
//         val actualInput = BigInteger(((energyin as double) * speed) as long);
//         // 创建新的 Big_zs 对象
//         val newEnergy = Big(energy.c.add(actualInput));
//         ctrl.customData = setEnergyToData(data, newEnergy);
//     })
//     .setThreadName("能量输入")
//     .build();

// // 能量输出配方
// RecipeBuilder.newBuilder("EnergyOutput_Dream", MACHINE, 1)
//     .addEnergyPerTickOutput(energyout)
//     .addPreCheckHandler(function(event as RecipeCheckEvent) {
//         val ctrl = event.controller;
//         var data = ctrl.customData;
//         if (isNull(data)) data = {} as IData;
//         val energy = getEnergyFromData(data);
//         var speed = 1.0;
//         val speedVal = data.memberGet("speed");
//         if (!isNull(speedVal)) speed = speedVal as double;
//         val actualOutput = BigInteger(((energyout as double) * speed) as long);
//         if (energy.c.compareTo(actualOutput) < 0) {
//             event.setFailed("能量不够输出！");
//         }
//     })
//     .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
//         val ctrl = event.controller;
//         var data = ctrl.customData;
//         if (isNull(data)) data = {} as IData;
//         val energy = getEnergyFromData(data);
//         var speed = 1.0;
//         val speedVal = data.memberGet("speed");
//         if (!isNull(speedVal)) speed = speedVal as double;
//         val actualOutput = BigInteger(((energyout as double) * speed) as long);
//         val newEnergy = Big(energy.c.subtract(actualOutput));
//         ctrl.customData = setEnergyToData(data, newEnergy);
//     })
//     .setThreadName("能量输出")
//     .build();

// // 格式化函数（long 版本，用于速度显示）
// function formatNumber(value as long) as string {
//     if (value < 1000) {
//         return "" + value;
//     } else if (value < 1000000) {
//         return "" + (value / 1000) + "K";
//     } else if (value < 1000000000) {
//         return "" + ((value / 1000) as float / 1000) + "M";
//     } else if (value < 1000000000000) {
//         return "" + ((value / 1000000) as float / 1000) + "G";
//     } else if (value < 1000000000000000) {
//         return "" + ((value / 1000000000) as float / 1000) + "T";
//     } else if (value < 1000000000000000000) {
//         return "" + ((value / 1000000000000) as float / 1000) + "P";
//     } else {
//         return "" + ((value / 1000000000000000) as float / 1000) + "E";
//     }
// }

// // 格式化 Big_zs（完整数字）
// function formatBigNumber(value as Big_zs) as string {
//     return value.c.toString();
// }

// // GUI 显示
// MMEvents.onControllerGUIRender(MACHINE, function(event as ControllerGUIRenderEvent) {
//     val ctrl = event.controller;
//     val data = ctrl.customData;
//     val energy = getEnergyFromData(data);
//     var info = [] as string[];
//     var energy_speed = isNull(data.speed) ? 1.0 : data.speed as double;
//     energy_speed *= energyin;
//     info += "§a=======§b能量核心监控器§a=======";
//     info += "§c" + formatBigNumber(energy) + "/" + formatBigNumber(maxenergy);
//     info += "§b当前输入输出速度：§6" + formatNumber(energy_speed as long) + "RF/t";
//     event.extraInfo = info;
// });

// // 模型（可选）
// GeoMachineModel.registerGeoMachineModel(MACHINE,
//     "modularmachinery:geo/dream_energy_core.geo.json",
//     "modularmachinery:textures/dream_energy_core.png",
//     "modularmachinery:animations/dream_energy_core.animation.json"
// );
// MachineModifier.setMachineGeoModel(MACHINE, MACHINE);
// MMEvents.onControllerModelAnimation(MACHINE, function(event as ControllerModelAnimationEvent) {
//     event.addAnimation("test", true);
// });

// // 智能接口
// val minSpeed = 0.001 as double;
// val maxSpeed = 2000000000.0 as double;
// val defaultTransferAmount = 100000000 as long;

// MachineModifier.addSmartInterfaceType(MACHINE,
//     SmartInterfaceType.create("speed", 0)
//         .setHeaderInfo("能量输入输出速度设置")
//         .setValueInfo("速度：§a%.2f 倍")
//         .setFooterInfo("")
//         .setJeiTooltip("速度范围：最低 §a%.2f 倍§f,最高 §a%.0f 倍", 2)
// );

// MMEvents.onMachinePostTick(MACHINE, function(event as MachineTickEvent) {
//     writeSmartInterfaceDataToCustomData(event, minSpeed, maxSpeed);
// });

// function writeSmartInterfaceDataToCustomData(event as MachineTickEvent, minSpeed as double, maxSpeed as double) {
//     val ctrl = event.controller;
//     var data = ctrl.customData;
//     if (isNull(data)) data = {} as IData;
//     val map = data.asMap();
//     val nullable = ctrl.getSmartInterfaceData("speed");
//     var speed = isNull(nullable) ? 1.0 : (nullable.value as double);

//     if (speed < minSpeed) {
//         speed = 1.0;
//         if (!isNull(nullable)) nullable.value = 1.0;
//     } else if (speed > maxSpeed) {
//         speed = maxSpeed;
//         if (!isNull(nullable)) nullable.value = maxSpeed;
//     }

//     map["speed"] = speed;
//     ctrl.customData = data;
//     // 永久修饰符（仍使用 speed，不影响大数存储）
//     ctrl.addPermanentModifier("receive", RecipeModifierBuilder.create("modularmachinery:energy", "input", speed, 1, false).build());
//     ctrl.addPermanentModifier("extract", RecipeModifierBuilder.create("modularmachinery:energy", "output", speed, 1, false).build());
// }