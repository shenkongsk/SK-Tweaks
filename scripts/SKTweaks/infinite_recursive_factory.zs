#loader crafttweaker reloadable
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.ActiveMachineRecipe;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import crafttweaker.item.IItemStack;
 

function getcontroller_as_cata(name as string) as IItemStack {
    return itemUtils.getItem("modularmachinery:" + name + "_controller");
}
<modularmachinery:infinite_recursive_factory_factory_controller>.addTooltip(format.gold("机器结构中放置的并行控制器无效！"));
<modularmachinery:infinite_recursive_factory_factory_controller>.addTooltip(format.gold("自带256并行"));
<modularmachinery:infinite_recursive_factory_factory_controller>.addTooltip(format.gold("自带32主线程"));
<modularmachinery:infinite_recursive_factory_factory_controller>.addTooltip(format.red("并行数可升级！！"));
<modularmachinery:infinite_recursive_factory_factory_controller>.addTooltip(format.red("最高4194304并行"));
// ===================== 全局并行同步函数 =====================
// 二次魔改自Nyonio
// https://www.mcmod.cn/post/6160.html
function SK_SyncParallelUpgrade(ctrl as IMachineController, recipe as ActiveMachineRecipe) as void {
    // 只对指定的目标机器生效
    val machineName = ctrl.formedMachineName;
    if (machineName != "modularmachinery:infinite_recursive_factory") {
        return;
    }
    val data = ctrl.customData;
    val map = data.asMap();
    var upgrades = (isNull(map["parallelUpgrades"]) ? 0 : map["parallelUpgrades"]) as int;
    val baseParallel = 256;                                          // 默认256并行
    val extra = upgrades * 256;                                       // 每放入一个升级物品增加256并行
    var newParallel = baseParallel + extra;
    if (newParallel > 4194304) {                                     // 最大并行数量
        newParallel = 4194304;                                       // 这个并行数覆盖并行控制器
    }
    recipe.maxParallelism = newParallel;
}
 
// ===================== 线程配置 =====================
val MACHINE = "infinite_recursive_factory";                        //机器ID
 
// 设置最大线程数
MachineModifier.setMaxThreads(MACHINE, 0);
MachineModifier.addCoreThread(MACHINE, FactoryRecipeThread.createCoreThread("并行安装").addRecipe("parallel_upgrade"));
MachineModifier.addCoreThread(MACHINE, FactoryRecipeThread.createCoreThread("并行卸载").addRecipe("parallel_downgrade"));
// 为每个配方创建独立的核心线程
val romanNumerals = [
    "I", "II", "III", "IV", "V", "VI", "VII", "VIII",
    "IX", "X", "XI", "XII", "XIII", "XIV", "XV", "XVI",
    "XVII", "XVIII", "XIX", "XX", "XXI", "XXII", "XXIII", "XXIV",
    "XXV", "XXVI", "XXVII", "XXVIII", "XXIX", "XXX", "XXXI", "XXXII"
] as string[];

for roman in romanNumerals {
    val thread = FactoryRecipeThread.createCoreThread("§e工作线程-§b" + roman);
    MachineModifier.addCoreThread(MACHINE, thread);
}
 
// ===================== 配方定义 =====================
// RecipeBuilder.newBuilder("enrichedalloy", MACHINE, 20)
//     .addInput(<minecraft:iron_ingot> * 8)
//     .addInput(<minecraft:redstone> * 1)
//     .addEnergyPerTickInput(10240)
//     .addItemOutput(<minecraft:bedrock> * 8)
//     .addPreCheckHandler(function(event as RecipeCheckEvent) {        //关键：在配方开始前，动态读取最大并行数量
//         SK_SyncParallelUpgrade(event.controller, event.activeRecipe);
//     })
//     .build();
// ===================== 并行升级配方 =====================
RecipeBuilder.newBuilder("parallel_upgrade", MACHINE, 1)
    .setParallelized(false)
    .addItemInput(<avaritiaitem:cosmic_balance>*1)    //这里决定了消耗的物品和数量
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        var current = (isNull(map["parallelUpgrades"]) ? 0 : map["parallelUpgrades"]) as int;
        if (current >= 16383) {                                                             //这里决定了最多允许安装多少个  并行升级物品
            event.setFailed("已达到并行升级上限！无法继续升级。");
        }
    })
    .addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        var current = (isNull(map["parallelUpgrades"]) ? 0 : map["parallelUpgrades"]) as int;
        map["parallelUpgrades"] = current + 1;
        ctrl.customData = data;
    })
    .addRecipeTooltip("[并行安装]","消耗一个升级","为机器增加 256 层并行数量")
    .setThreadName("并行安装")
    .build();
// ===================== 并行升级配方 =====================

// ===================== 并行降级配方 =====================
RecipeBuilder.newBuilder("parallel_downgrade", MACHINE, 1)
    .setParallelized(false)
    .addItemInput(<minecraft:paper> * 1)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        var current = (isNull(map["parallelUpgrades"]) ? 0 : map["parallelUpgrades"]) as int;
        if (current < 1) {
            event.setFailed("并行升级数量不足 1，无法降级！");
        }
    })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val map = data.asMap();
        var current = (isNull(map["parallelUpgrades"]) ? 0 : map["parallelUpgrades"]) as int;
        map["parallelUpgrades"] = current - 1;
        ctrl.customData = data;
    })
    .addItemOutput(<avaritiaitem:cosmic_balance>*1)
    .addRecipeTooltip("[并行卸载]","消耗一张纸","减少 256 并行数量","并返还一个升级")
    .setThreadName("并行卸载")
    .build();
// ===================== 并行降级配方 =====================

// ========================== 继承 ==========================
val Machine_to_be_adpted = [
    "mythic_processor_furnace",
    "mythic_processor_alloy_furnace",
    "mythic_processor_isotope_separator",
    "mythic_processor_rolling_machine",
    "mythic_processor_chemical_reactor",
    "mythic_processor_infuser",
    "mythic_processor_arkencrusher",
    "mythic_processor_compactor",
    "mythic_processor_melter",
    "mythic_processor_rock_crusher",
    "mythic_processor_centrifuge",
    "mythic_processor_blaster",
    "mythic_processor_crystallizer",
    "mythic_processor_fluid_enricher",
    "mythic_processor_grinder",
    "mythic_processor_pulverizer"
];
for i in 0 to Machine_to_be_adpted.length{
    RecipeAdapterBuilder.create("modularmachinery:infinite_recursive_factory", "modularmachinery:"+Machine_to_be_adpted[i])
        .addModifier(RecipeModifierBuilder.create("modularmachinery:duration", "input", 0.5, 1, false).build())
        .addModifier(RecipeModifierBuilder.create("modularmachinery:energy", "input", 8, 1, false).build())
        .addItemInput(getcontroller_as_cata(Machine_to_be_adpted[i])).setChance(0.0).setParallelizeUnaffected(true)
        .addCatalystInput(<contenttweaker:eye_of_harmony_power_unit>*1,
            ["§c和谐之眼能量单元§9--§a能量输入减少90%"],
            [
                RecipeModifierBuilder.create("modularmachinery:energy", "input", 0.1F, 1, false).build()
            ]
        ).setParallelizeUnaffected(true).setChance(0)
        // ===============================
        // 先addModifier ，再addItemIput
        // 不然强制转为父类，用不了子类方法
        // ===============================
        .addPreCheckHandler(function(event as RecipeCheckEvent) {
            SK_SyncParallelUpgrade(event.controller, event.activeRecipe);
        })
        .setMaxThreads(1)
        .build();
}
// 继承原版熔炉
RecipeAdapterBuilder.create("modularmachinery:infinite_recursive_factory", "minecraft:furnace")
    .addModifier(RecipeModifierBuilder.create("modularmachinery:item", "output", 2.0, 1, false).build())
    .addModifier(RecipeModifierBuilder.create("modularmachinery:item", "input", 2.0, 1, false).build())
    .addModifier(RecipeModifierBuilder.create("modularmachinery:energy", "input", 4096, 1, false).build())
    .addModifier(RecipeModifierBuilder.create("modularmachinery:duration", "input", 0.02, 1, false).build())
    .addItemInput(<minecraft:furnace>).setChance(0.0).setParallelizeUnaffected(true)
        .addCatalystInput(<contenttweaker:flame_of_actualization>,
            ["§c显化之焰§9--§a能量输入增加150%,速度提升100%"],
            [
                RecipeModifierBuilder.create("modularmachinery:energy", "input", 1.5F, 1, false).build(),
                RecipeModifierBuilder.create("modularmachinery:duration", "input", 0.5F, 1, false).build()
            ]
        ).setParallelizeUnaffected(true).setChance(0)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        SK_SyncParallelUpgrade(event.controller, event.activeRecipe);
    })
    .setMaxThreads(1)
    .build();
// ========================== 继承 ==========================

// ===================== GUI显示并行升级 =====================
MMEvents.onControllerGUIRender(MACHINE, function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    val data = ctrl.customData;
    val map = data.asMap();
    var upgrades = (isNull(map["parallelUpgrades"]) ? 0 : map["parallelUpgrades"]) as int;
    var maxParallel = 256 + upgrades * 256;
    if (maxParallel > 4194304) {
        maxParallel = 4194304;
    }
    var info as string[] = [];
    info += "§3=======/§9§l寰宇§3§l递归§b§l工厂§3/=======";
    info += "§e并行升级数量: §a" + upgrades;
    info += "§e当前最大并行数: §b" + maxParallel + "§r / 4194304";
    event.extraInfo = info;
});
// ===================== GUI显示并行升级 =====================