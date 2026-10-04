// // 都怪aedddd写的MMCE Addition改了不消耗物品逻辑
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.MachineController;
import mods.modularmachinery.IMachineController;
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.item.IIngredient;
import native.java.math.BigInteger;
import mods.modularmachinery.RecipeStartEvent;
import mods.modularmachinery.RecipeFinishEvent;

val MACHINE = "solar_array";
MachineModifier.setInternalParallelism(MACHINE, 16);

// =====================================================================================================
// 升级定义
// =====================================================================================================
global SOLAR_UPGRADE_KEYS as string[] = [
    "upgrade_torch",
    "upgrade_bee",
    "upgrade_horologium",
    "upgrade_compressed_torch"
];

global SOLAR_UPGRADE_ITEMS as IIngredient[string] = {
    "upgrade_torch"            : <tce:tce_torch_lvl1>,
    "upgrade_bee"              : <gendustry:gene_sample>.withTag({species: "rootBees", chromosome: 0, allele: "careerbees.acceleration"}),
    "upgrade_horologium"       : <astralsorcery:itemtunedcelestialcrystal>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.horologium"}}),
    "upgrade_compressed_torch" : <tce:tce_compressed_torch_lvl1>
};

global SOLAR_UPGRADE_MULTIPLIERS as int[string] = {
    "upgrade_torch"            : 3,
    "upgrade_bee"              : 8,
    "upgrade_horologium"       : 5,
    "upgrade_compressed_torch" : 27
};

// =====================================================================================================
// 升级配方
// =====================================================================================================
function Upgrade_Recipe_Builder(upgradeKey as string) as void {
    val builder = RecipeBuilder.newBuilder("solar_upgrade_" + upgradeKey, "solar_array", 20);
    builder.addItemInput(SOLAR_UPGRADE_ITEMS[upgradeKey]);

    builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
        val data = event.controller.customData;
        if (Get_CustomData_bool(data, upgradeKey, false)) {
            event.setFailed("该升级已激活！");
        }
    });

    builder.addFinishHandler(function(event as RecipeFinishEvent) {
        val ctrl = event.controller;
        var data = ctrl.customData;
        if (isNull(data)) data = {} as IData;
        data.memberSet(upgradeKey, true as IData);
        ctrl.customData = data;
    });

    builder.addRecipeTooltip("§a安装太阳能阵列升级", "§b倍率：" + SOLAR_UPGRADE_MULTIPLIERS[upgradeKey] + "x", "§c连接到§a梦之§b能量核心§c时才生效！");
    builder.build();
}
Upgrade_Recipe_Builder("upgrade_torch");
Upgrade_Recipe_Builder("upgrade_bee");
Upgrade_Recipe_Builder("upgrade_horologium");
Upgrade_Recipe_Builder("upgrade_compressed_torch");

// =====================================================================================================
// 太阳能主配方
// =====================================================================================================
function solar_array_recipe_builder(
    recipeName as string,
    inputs as IIngredient[],
    energyOutput as int
) as void {
    val builder = RecipeBuilder.newBuilder(recipeName, "solar_array", 2000);
    val baseEnergy = energyOutput * 1; // 原来是2
    for item in inputs {
        builder.addItemInput(item).setChance(0.0).setParallelizeUnaffected(false);
    }

    builder.addEnergyPerTickOutput(baseEnergy);

    // 配方开始时记录基础能量值（以字符串形式保存 BigInteger）
    builder.addStartHandler(function(event as RecipeStartEvent) {
        val ctrl = event.controller;
        var data = ctrl.customData;
        if (isNull(data)) data = {} as IData;
        data.memberSet("currentBaseEnergy", (baseEnergy)as string as IData);
        ctrl.customData = data;

    });

    builder.addFinishHandler(function(event as RecipeFinishEvent) {
        val ctrl = event.controller;
        var data = ctrl.customData;
        if (!isNull(data)) {
            data.memberSet("currentBaseEnergy", "0" as IData);
            ctrl.customData = data;
        }
    });

    builder.build();
}

solar_array_recipe_builder("solar_pannel_0", [<techreborn:solar_panel>], 16);
solar_array_recipe_builder("solar_pannel_1", [<techreborn:solar_panel:1>], 128);
solar_array_recipe_builder("solar_pannel_2", [<techreborn:solar_panel:2>], 1024);
solar_array_recipe_builder("solar_pannel_3", [<techreborn:solar_panel:3>], 8192);
solar_array_recipe_builder("solar_pannel_4", [<techreborn:solar_panel:4>], 65536);
solar_array_recipe_builder("solar_pannel_5", [<techreborn:creative_solar_panel>], 786432);


function AddEnergyToDreamCore(decoreCtrl as IMachineController, amount as BigInteger) as void {
    var data = decoreCtrl.customData;
    if (isNull(data)) data = {} as IData;
    val current = BigInteger(Get_CustomData_string(data, "energy", "0"));
    val newEnergy = current.add(amount);   // BigInteger + BigInteger
    val newData = data + ({ "energy": newEnergy.toString() } as IData);
    decoreCtrl.customData = newData;
}

MMEvents.onMachinePostTick(MACHINE, function(event as MachineTickEvent) {
    val ctrl = event.controller;
    val world = ctrl.world;
    if (world.remote) return;

    val data = ctrl.customData;
    if (isNull(data)) return;

    val decoreX = data.memberGet("DECore_X");

    // ---- 维护压制修饰器 ----
    if (!isNull(decoreX)) {
        ctrl.addPermanentModifier("solar_dream_core_block",
            RecipeModifierBuilder
                .create("modularmachinery:energy", "output", 0.0F, 1, false)
                .build()
        );
    } else {
        ctrl.removePermanentModifier("solar_dream_core_block");
    }

    val activeRecipe = ctrl.activeRecipe;
    if (isNull(activeRecipe)) return;
    if (isNull(decoreX)) return;

    val baseEnergyBig = BigInteger(Get_CustomData_string(data, "currentBaseEnergy", "0"));
    if (baseEnergyBig.compareTo(BigInteger.ZERO) <= 0) return;


    var upgradeMul = 1;
    for key in SOLAR_UPGRADE_KEYS {
        if (Get_CustomData_bool(data, key, false)) {
            upgradeMul *= SOLAR_UPGRADE_MULTIPLIERS[key];
        }
    }


    var parallel = activeRecipe.parallelism;
    if (parallel <= 0) parallel = 1;

    val injection = baseEnergyBig
        .multiply(BigInteger.valueOf(upgradeMul as long))
        .multiply(BigInteger.valueOf(parallel as long));

    if (injection.compareTo(BigInteger.ZERO) <= 0) return;


    val x = decoreX as int;
    val y = Get_CustomData_int(data, "DECore_Y", 0);
    val z = Get_CustomData_int(data, "DECore_Z", 0);
    val dim = Get_CustomData_int(data, "DECore_Dim", 0);
    val cworld = IWorld.getFromID(dim);
    val decoreCtrl = MachineController.getControllerAt(cworld, x, y, z);

    if (isNull(decoreCtrl)) {
        val cleared = data - "DECore_X" - "DECore_Y" - "DECore_Z" - "DECore_Dim";
        ctrl.customData = cleared;
        return;
    }

    AddEnergyToDreamCore(decoreCtrl, injection);
});

<modularmachinery:solar_array_controller>.addTooltip("§6[可连接到§a梦之§b能量核心§6]");
<modularmachinery:solar_array_controller>.addTooltip(format.gold("可以放置太阳能发电机和加速配置"));
<modularmachinery:solar_array_controller>.addTooltip(format.gold("太阳能发电机发电量可叠加"));
<modularmachinery:solar_array_controller>.addTooltip(format.red("每tick发电过高可能不会工作！！"));
<modularmachinery:solar_array_controller>.addTooltip(format.red("每次重进，可能需要重新放入材料才会正确输出"));
<modularmachinery:solar_array_controller>.addTooltip(format.red("控制器拆了重放也可以"));


MMEvents.onControllerGUIRender(MACHINE, function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    if (isNull(ctrl)) return;
    val data = ctrl.customData;
    var info as string[] = [];
    info += "§3║§6✦§6 神话太阳能阵列 §f| §7v1.0";
    var baseEnergyStr = "0";
    if (!isNull(data)) {
        baseEnergyStr = Get_CustomData_string(data, "currentBaseEnergy", "0");
    }
    info += "§3║§b▸ 基础能量产出：§6" + baseEnergyStr + " §bRF/t";
    val decoreX = isNull(data) ? null : data.memberGet("DECore_X");
    val connected = !isNull(decoreX);
    if (connected) {
        info += "§3║§a▸ §a梦之§b能量核心§r：§a● 已连接";
        var upgradeMul = 1;
        for key in SOLAR_UPGRADE_KEYS {
            if (Get_CustomData_bool(data, key, false)) {
                upgradeMul *= SOLAR_UPGRADE_MULTIPLIERS[key];
            }
        }
        info += "§3║§b▸ 额外乘数：§6" + upgradeMul + "x";
        var parallel = 1;
        val activeRecipe = ctrl.activeRecipe;
        if (!isNull(activeRecipe)) {
            parallel = activeRecipe.parallelism;
            if (parallel <= 0) parallel = 1;
        }
        info += "§3║§b▸ 并行数：§6" + parallel;
        val baseEnergyBig = BigInteger(baseEnergyStr);
        val total = baseEnergyBig
            .multiply(BigInteger.valueOf(upgradeMul as long))
            .multiply(BigInteger.valueOf(parallel as long));
        info += "§3║§6▸ 总产出：§e" + total.toString() + " §bRF/t";
    } else {
        info += "§3║§c▸ §a梦之§b能量核心§r：§c○ 未连接";
    }
    event.extraInfo = info;
});