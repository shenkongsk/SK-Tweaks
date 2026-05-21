#loader crafttweaker
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import crafttweaker.item.IItemStack;
import mods.modularmachinery.ControllerGUIRenderEvent;
import crafttweaker.data.IData;
import crafttweaker.event.PlayerRightClickItemEvent;
import crafttweaker.block.IBlockState;
import crafttweaker.world.IBlockPos;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifier;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.FactoryRecipeThread;


val MACHINE = "carpet_duplicator_1000";

function getcarpetfrommeta(metadata as int) as IItemStack {
    return (metadata >= 0 && metadata <= 15) ? <minecraft:carpet>.withDamage(metadata) : <minecraft:carpet>;
}
<modularmachinery:carpet_duplicator_1000_factory_controller>.addTooltip(format.red("为什么你需要这个？"));

MachineModifier.setMaxThreads(MACHINE, 0);
MachineModifier.addCoreThread(MACHINE, FactoryRecipeThread.createCoreThread("地毯复制核心"));
// ========== 1. 定义智能数据接口 ==========
// 颜色接口（整数 0~15）
MachineModifier.addSmartInterfaceType(MACHINE,
    SmartInterfaceType.create("Color", 0)
        .setHeaderInfo("羊毛颜色选择")
        .setValueInfo("当前颜色索引: §a%.0f")
        .setFooterInfo("0白 1橙 2品红 3淡蓝 4黄 5黄绿 6粉 7灰 8淡灰 9青 10紫 11蓝 12棕 13绿 14红 15黑")
        .setJeiTooltip("颜色索引范围 0-15", 2)
);

// 数量接口（长整数，例如 1~2147483647）
MachineModifier.addSmartInterfaceType(MACHINE,
    SmartInterfaceType.create("Count", 1)
        .setHeaderInfo("单次输出数量")
        .setValueInfo("当前数量: §a%.0f")
        .setFooterInfo("数量范围 1 ~ 2147483647")
        .setJeiTooltip("数量范围 1-2147483647", 2)
);

// ========== 2. 可选：将接口值同步到 customData（便于调试） ==========
MMEvents.onMachinePostTick(MACHINE, function(event as MachineTickEvent) {
    val ctrl = event.controller;
    // 颜色同步
    val colorData = ctrl.getSmartInterfaceData("Color");
    if (!isNull(colorData)) {
        var color = colorData.value as int;
        if (color < 0) color = 0;
        if (color > 15) color = 15;
        var data = ctrl.customData;
        if (isNull(data)) data = {} as IData;
        ctrl.customData = data + {color: color} as IData;
    }
    // 数量同步
    val countData = ctrl.getSmartInterfaceData("Count");
    if(!isNull(countData)){
        var count = countData.value as int;
        if (count < 1) count = 1;
        if (count > 2147483647) count = 2147483647;
        var data = ctrl.customData;
        if (isNull(data)) data = {} as IData;
        ctrl.customData = data + {count: count} as IData;
    }
});

// ========== 3. 配方 ==========
RecipeBuilder.newBuilder("wool_duplicator", MACHINE, 20)
    .addOutput(<minecraft:carpet:0>)
    .addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
        // 读取颜色接口值
        val colorData = ctrl.getSmartInterfaceData("Color");
        var color = 0;
        if (!isNull(colorData)) {
            color = colorData.value as int;
            if (color < 0) color = 0;
            if (color > 15) color = 15;
        }
        // 读取数量接口值
        val countData = ctrl.getSmartInterfaceData("Count");
        var count = 1;
        if (!isNull(countData)) {
            count = countData.value as int;
            if (count < 1) count = 1;
            if (count > 2147483647) count = 2147483647;
        }
        return (getcarpetfrommeta(color)*count);
    })
    .addEnergyPerTickInput(100000)
    .addRecipeTooltip("根据智能数据接口的值","输出指定颜色和数量的地毯")
    .build();

    // ========== 4. GUI 显示当前产出设置 ==========
// 颜色名称映射（0-15）
val colorNames = [
    "白色", "橙色", "品红色", "淡蓝色", "黄色", "黄绿色", "粉色", "灰色",
    "淡灰色", "青色", "紫色", "蓝色", "棕色", "绿色", "红色", "黑色"
];

MMEvents.onControllerGUIRender(MACHINE, function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    if (isNull(ctrl)) return;
    val data = ctrl.customData;
    var colorIdx = 0;
    var count = 1;
    if (!isNull(data)) {
        val map = data.asMap();                     // 先转为 Map
        val colorVal = map["color"];                // 获取 IData
        val countVal = map["count"];
        if (!isNull(colorVal)) colorIdx = colorVal as int;   // 直接 as int
        if (!isNull(countVal)) count = countVal as int;
    }
    // 范围保护
    if (colorIdx < 0) colorIdx = 0;
    if (colorIdx > 15) colorIdx = 15;
    if (count < 1) count = 1;
    val colorName = colorNames[colorIdx];
    val displayText = "§a目前输出：§f" + colorName + "地毯 §a× §f" + count;
    var extra = event.extraInfo;
    if (isNull(extra)) extra = [] as string[];
    extra += displayText;
    event.extraInfo = extra;
});