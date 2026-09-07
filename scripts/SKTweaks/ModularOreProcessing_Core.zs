#loader crafttweaker reloadable
#priority -10
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;
import mods.ctutils.utils.Math;
import crafttweaker.item.IItemStack;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeThread;
import crafttweaker.world.IFacing;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.RecipeStartEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.MachineController;
import mods.contenttweaker.World;
import mods.modularmachinery.IMachineController;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import mods.modularmachinery.MachineStructureFormedEvent;
import mods.modularmachinery.ActiveMachineRecipe;
function getController(name as string) as IItemStack {
    return itemUtils.getItem(name);
}
// ======================================集成矿石处理中心======================================
val MACHINE = "numeron_network";
MachineModifier.setInternalParallelism(MACHINE, 1);
MachineModifier.setMaxThreads(MACHINE, 64);
MachineModifier.addCoreThread(MACHINE, FactoryRecipeThread.createCoreThread("网络监控器"));
var offsets = [
    [-10,0,-8],
    [10,0,-8],
    [-16,0,11],
    [16,0,11],
    [0,0,23]
] as int[][];

// 升级：
// 一阶神话分形：能源输入x0.05 速度x20
// 二阶神话分形：允许副产物
// 三阶神话分形：并行x16 主产物产出x16
// 四阶神话分形：副产物产出x8
// 五阶神话分形：能源输入x0.05 速度x2 并行数x256

function NN_ParallelUpdate(ctrl as IMachineController, recipe as ActiveMachineRecipe) as void {
    val machineName = ctrl.formedMachineName;
    var Parallel =256; 
    if ((machineName == "modularmachinery:numeron_network")&&(Get_CustomData_int(ctrl.customData, "Extra_3_shell_connection",0) > 0)) {
        Parallel*=16;
    }
    if ((machineName == "modularmachinery:numeron_network")&&(Get_CustomData_int(ctrl.customData, "Extra_5_shell_connection",0) > 0)) {
        Parallel*=256;
    }
    recipe.maxParallelism = Parallel;
    return;
}

// 我操这个脚本太雷霆了简直不像人能写出来的
val Recipe_Ore as IIngredient[][IIngredient[]]$orderly = {
    [<ore:oreGold>] : [<minecraft:gold_ingot>*8,<thermalfoundation:material:866>*2],
    [<ore:oreIron>] : [<minecraft:iron_ingot>*8,<thermalfoundation:material:133>*2],
    [<ore:oreCoal>] : [<minecraft:coal>*16,<thermalfoundation:material:768>*2],
    [<ore:oreCopper>] : [<thermalfoundation:material:128>*8,<minecraft:gold_ingot>*2],
    [<ore:oreZinc>] : [<techreborn:ingot:18>*8],
    [<ore:oreLapis>] : [<minecraft:dye:4>*32,<techreborn:dust:28>*4,<techreborn:dust:37>*2],
    [<ore:oreDiamond>] : [<minecraft:diamond>*8,<thermalfoundation:material:771>*2],
    [<ore:oreRedstone>] : [<minecraft:redstone>*16,<thermalfoundation:material:866>*2],
    [<ore:oreEmerald>] : [<minecraft:emerald>*8,<thermalfoundation:material:866>*2],
    [<ore:oreQuartz>] : [<minecraft:quartz>*16,<thermalfoundation:material:771>*2],
    [<ore:oreCoralium>] : [<abyssalcraft:coralium>*8,<abyssalcraft:coralium>*4],
    [<ore:oreAbyssalnite>] : [<abyssalcraft:abyingot>*8,<aoa3:runium_chunk>*2],
    [<ore:oreSaltpeter>] : [<thermalfoundation:material:772>*8,<thermalfoundation:material:771>*2],
    [<ore:oreTin>] : [<thermalfoundation:material:129>*8,<minecraft:iron_ingot>*2],
    [<ore:oreLiquifiedCoralium>] : [<abyssalcraft:cingot>*8],
    [<ore:oreQuartzBlack>] : [<actuallyadditions:item_misc:5>*8,<minecraft:iron_ingot>*2],
    [<ore:oreAquamarine>] : [<astralsorcery:itemcraftingcomponent>*8,<minecraft:gold_ingot>*2],
    [<ore:oreAstralStarmetal>] : [<astralsorcery:itemcraftingcomponent:1>*8,<minecraft:iron_ingot>*2],
    [<ore:oreOpal>] : [<bewitchment:opal>*8,<thermalfoundation:material:772>*2],
    [<ore:oreSilver>] : [<thermalfoundation:material:130>*8,<thermalfoundation:material:131>*2],
    [<ore:oreSalt>] : [<bewitchment:salt>*4,<thermalfoundation:material:131>*2],
    [<ore:oreAmethyst>] : [<biomesoplenty:gem>*8],
    [<ore:oreRuby>] : [<biomesoplenty:gem:1>*8,<techreborn:smalldust:43>*4],
    [<ore:orePeridot>] : [<biomesoplenty:gem:2>*8],
    [<ore:oreTopaz>] : [<biomesoplenty:gem:3>*8],
    [<ore:oreTanzanite>] : [<biomesoplenty:gem:4>*8],
    [<ore:oreMalachite>] : [<biomesoplenty:gem:5>*8],
    [<ore:oreSapphire>] : [<biomesoplenty:gem:6>*8],
    [<ore:oreAmber>] : [<biomesoplenty:gem:7>*8],
    [<ore:oreDraconium>] : [<draconicevolution:draconium_ingot>*8],
    [<ore:oreJade>] : [<erebus:materials:1>*8],
    [<ore:oreYellorium>] : [<bigreactors:ingotyellorium>*8,<bigreactors:ingotcyanite>*2],
    [<ore:oreApatite>] : [<forestry:apatite>*32,<techreborn:smalldust:37>*2],
    [<ore:oreAluminum>] : [<thermalfoundation:material:132>*8,<techreborn:dust:5>*2],
    [<ore:oreNickel>] : [<thermalfoundation:material:133>*8,<thermalfoundation:material:134>*2],
    [<ore:oreUranium>] : [<immersiveengineering:metal:5>*8,<techreborn:ingot:25>*2],
    [<ore:oreProsperity>] : [<mysticalagriculture:crafting:5>*16],
    [<ore:oreInferium>] : [<mysticalagriculture:crafting>*16],
    [<ore:oreThorium>] : [<nuclearcraft:ingot:3>*8,<techreborn:ingot:25>*2],
    [<ore:oreBoron>] : [<nuclearcraft:ingot:5>*8],
    [<nuclearcraft:ore:6>] : [<nuclearcraft:ingot:6>*8,<libvulpes:productdust>*2],
    [<ore:oreMagnesium>] : [<nuclearcraft:ingot:7>*8],
    [<ore:oreZinc>] : [<techreborn:ingot:18>*8],
    [<ore:oreGalena>] : [<techreborn:dust:23>*8],
    [<ore:oreIridium>] : [<thermalfoundation:material:135>*8,<thermalfoundation:material:134>*2],
    [<ore:oreBauxite>] : [<techreborn:dust:5>*8,<thermalfoundation:material:132>*2],
    [<ore:orePyrite>] : [<techreborn:dust:39>*8,<minecraft:iron_ingot>*2],
    [<ore:oreCinnabar>] : [<techreborn:dust:11>*8,<minecraft:iron_ingot>*2],
    [<ore:oreTungsten>] : [<techreborn:ingot:15>*8,<nuclearcraft:ingot:11>*2],
    [<ore:oreSodalite>] : [<techreborn:dust:48>*16,<thermalfoundation:material:132>*2],
    [<ore:oreZanite>] : [<aether_legacy:zanite_gemstone>*8],
    [<ore:oreValonite>] : [<thebetweenlands:items_misc:19>*8],
    [<ore:oreScabyst>] : [<thebetweenlands:items_misc:39>*16],
    [<ore:orePlatinum>] : [<thermalfoundation:material:134>*8,<thermalfoundation:material:135>*2],
    [<ore:oreMithril>] : [<thermalfoundation:material:136>*8,<minecraft:gold_ingot>*2],
    [<ore:oreClathrateOilSand>] : [<thermalfoundation:material:892>*16,<thermalfoundation:material:833>*2],
    [<ore:oreClathrateRedstone>] : [<thermalfoundation:material:893>*16,<thermalfoundation:material:866>*2],
    [<ore:oreClathrateGlowstone>] : [<thermalfoundation:material:894>*16,<thermalfoundation:material:771>*2],
    [<ore:oreClathrateEnder>] : [<thermalfoundation:material:895>*16,<thermalfoundation:material:134>*2],
    [<ore:oreCobalt>] : [<tconstruct:ingots>*8,<techreborn:dust:39>*2],
    [<ore:oreArdite>] : [<tconstruct:ingots:1>*8,<techreborn:dust:39>*2],
    [<ore:oreDilithium>] : [<libvulpes:productgem>*8],
    [<ore:oreTitanium>] : [<techreborn:ingot:14>*8,<contenttweaker:vanadium_dust>*4],
    [<ore:oreLead>] : [<thermalfoundation:material:131>*8],
    [<ore:oreSphalerite>] : [<techreborn:dust:50>*16,<techreborn:ingot:18>*8,<techreborn:smalldust:58>*2],
    [<ore:oreHolographic>] : [<contenttweaker:projector_gem>*8],
    [<ore:oreChargedCertusQuartz>] : [<appliedenergistics2:material:1>*8,<appliedenergistics2:material:2>*2],
    [<ore:oreCertusQuartz>] : [<appliedenergistics2:material>*8,<appliedenergistics2:material:2>*2],
    [<ore:oreDimensionalShard>] : [<rftools:dimensional_shard>*12],
    [<ore:oreTartarite>] : [<contenttweaker:material_part:59>*8],
    [<ore:oreLivingGold>] : [<contenttweaker:living_gold>*16],
    [<ore:oreFirestone>] : [<railcraft:firestone_raw>*8],
    [<ore:oreArlemite>] : [<divinerpg:arlemite_ingot>*12,<aoa3:runium_chunk>*3],
    [<ore:oreRealmite>] : [<divinerpg:realmite_ingot>*12,<aoa3:runium_chunk>*3],
    [<ore:oreRupee>] : [<divinerpg:rupee_ingot>*12,<aoa3:runium_chunk>*3],
    [<ore:oreNetherite>] : [<divinerpg:netherite_ingot>*12,<aoa3:runium_chunk>*3],
    [<ore:oreAscendedSapphire>] : [<aoa3:sapphire>*12,<thermalfoundation:material:134>*3],
    [<ore:oreAscendedAmethyst>] : [<aoa3:amethyst>*12,<thermalfoundation:material:134>*3],
    [<ore:oreAscendedJade>] : [<aoa3:jade>*12,<thermalfoundation:material:134>*3],
    [<ore:oreLimonite>] : [<aoa3:limonite_ingot>*12,<thermalfoundation:material:134>*3],
    [<ore:oreRosite>] : [<aoa3:rosite_ingot>*12,<thermalfoundation:material:134>*3],
    [<ore:oreEmberstone>] : [<aoa3:emberstone_ingot>*12,<nuclearcraft:compound:5>*3],
    [<ore:oreSednanite>] : [<contenttweaker:material_part:54>*16],
    [<ore:oreMyrmitite>] : [<contenttweaker:material_part:82>*16],
    [<ore:oreOgerite>] : [<contenttweaker:material_part:118>*16],
    [<ore:oreRhenium>] : [<contenttweaker:material_part:76>*16],
    [<ore:oreGarnet>] : [<bewitchment:garnet>*8]
};

// ======================================GUI显示======================================
MMEvents.onControllerGUIRender(MACHINE,function(event as ControllerGUIRenderEvent){
    val ctrl = event.controller;
    val data = ctrl.customData;
    val world = ctrl.world;
    var info as string[] = [];
    var sub_info = "§a● 已成型";
    var energy_input = 1 as float;
    var Parallel = 256;
    info += "§3║§5✦§d 源数网络 §f| §7v1.0 ";
    info += "§3║§b▸ §7主结构：§r" + "§a已成型" ;
    // 附属模块
    if(Get_CustomData_bool(data,"Extra_1_shell",false)){
        if(Get_CustomData_int(data,"Extra_1_shell_connection",0)>0){
            sub_info = "§d● 已连接";
            energy_input *= 0.05;
        }
        info += "§3║§b▸ §e第一神话叠壳：§r" + sub_info ;
        sub_info = "§a● 已成型";
    }
    if(Get_CustomData_bool(data,"Extra_2_shell",false)){
        if(Get_CustomData_int(data,"Extra_2_shell_connection",0)>0){
            sub_info = "§d● 已连接";
        }
        info += "§3║§b▸ §e第二神话叠壳：§r" + sub_info ;
        sub_info = "§a● 已成型";
    }
    if(Get_CustomData_bool(data,"Extra_3_shell",false)){
        if(Get_CustomData_int(data,"Extra_3_shell_connection",0)>0){
            sub_info = "§d● 已连接";
            Parallel *= 16;
        }
        info += "§3║§b▸ §e第三神话叠壳：§r" + sub_info ;
        sub_info = "§a● 已成型";
    }
    if(Get_CustomData_bool(data,"Extra_4_shell",false)){
        if(Get_CustomData_int(data,"Extra_4_shell_connection",0)>0){
            sub_info = "§d● 已连接";
        }
        info += "§3║§b▸ §e第四神话叠壳：§r" + sub_info ;
        sub_info = "§a● 已成型";
    }
    if(Get_CustomData_bool(data,"Extra_5_shell",false)){
        if(Get_CustomData_int(data,"Extra_5_shell_connection",0)>0){
            sub_info = "§d● 已连接";
            energy_input *=0.05;
            Parallel *= 256;
        }
        info += "§3║§b▸ §e第五神话叠壳：§r" + sub_info ;
        sub_info = "§a● 已成型";
    }

    info += "§3║§b▸ §6能量升级：§r" + formatFloat(energy_input, 5) + "x" ;
    info += "§3║§b▸ §6并行处理：§r" + Parallel + "x"  ;
    if(Get_CustomData_int(data,"Extra_3_shell_connection",0)>0){
        info += "§3║§b▸ §6主产物：§r" + "16x" ;
    }
    if(Get_CustomData_int(data,"Extra_4_shell_connection",0)>0){
        info += "§3║§b▸ §6附产物：§r" + "8x" ;
    }
    event.extraInfo = info;
});


// 将 float 保留指定位数小数（不四舍五入，直接截断）
function formatFloat(value as float, digits as int) as string {
    if (isNull(value)) return "0";
    val str = "" + value;
    val idx = str.indexOf(".");
    if (idx == -1) return str; // 整数
    // 截取到小数点后 digits 位
    val end = idx + digits + 1;
    if (end >= str.length) return str;
    return str.substring(0, end);
}

// ======================================附属模块======================================
val MACHINE_EXTRA_BASE ="mythic_fractal_core_";
// =========批量注册========
for i in 1 to 6{
    var machineName = MACHINE_EXTRA_BASE + i;
    var machineItem = getController("modularmachinery:mythic_fractal_core_"+i+"_factory_controller");
    MachineModifier.setMaxThreads(machineName, 0);
    // ======================tooltips======================

    machineItem.addTooltip(format.red("源数网络附属模块"));
    machineItem.addTooltip(format.red("机器朝向必须于主控制器一致才能正确成型！"));

    // ======================tooltips======================


    // ==============================================结构形成事件=============================================
    MMEvents.onStructureFormed(machineName, function(event as MachineStructureFormedEvent) {

        var ctrl = event.controller;
        var data = ctrl.customData;
        var world = ctrl.world;
        var target_pos = getOffsetPos(ctrl,offsets[i - 1][0],offsets[i - 1][1],offsets[i - 1][2]);
        // 神了为什么i-1会被识别成i -1，必须i - 1
        var main_controller = MachineController.getControllerAt(world, target_pos);
        main_controller.customData = main_controller.customData + ({ "Extra_" + i + "_shell": true } as IData);
    });
    // ==============================================结构形成事件=============================================

    MachineModifier.addCoreThread("mythic_fractal_core_" + i, FactoryRecipeThread.createCoreThread("网络维护单元"));
    var sub_Recipe_i = RecipeBuilder.newBuilder("numeron_connect_" + i, "mythic_fractal_core_" + i, 200);
    sub_Recipe_i
        .addEnergyPerTickInput(2000)
        .setMaxThreads(1)
        .setParallelized(false)
        .setThreadName("网络维护单元")
        .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
            val ctrl = event.controller;
            val data = ctrl.customData;
            val world = ctrl.world;
            val main_controller = MachineController.getControllerAt(world, getOffsetPos(ctrl,offsets[i - 1][0],offsets[i - 1][1],offsets[i - 1][2]));
            if(isNull(main_controller)) return;
            var Current_connetion = Get_CustomData_int(main_controller.customData,"Extra_" + i + "_shell_connection",0);
            if (Current_connetion < 0) {
                Current_connetion = 0;
            }
            var New_connetion = Current_connetion + 2;
            if (New_connetion > 10) {
                New_connetion = 10;
            }
            main_controller.customData = main_controller.customData + ({ "Extra_" + i + "_shell_connection": New_connetion } as IData);
        })
        .addRecipeTooltip("§d[网络连接维持]")
        .build();
}

// ==================================================矿处配方==================================================
var recipeCounter = 1;
for inputs, outputs in Recipe_Ore {
    val builder = RecipeBuilder.newBuilder("ore_processing_" + recipeCounter, MACHINE, 200);
    builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
        NN_ParallelUpdate(event.controller, event.activeRecipe);
    });
    builder.addItemInputs(inputs).setTag("ore_prossing_input");
    val mainOutput = outputs[0];
    builder.addItemOutput(mainOutput)
            .addItemModifier(function(ctrl, item) as IItemStack {
                if (Get_CustomData_int(ctrl.customData,"Extra_3_shell_connection",0) > 0) {
                    return item*16;
                }else{
                    return item;
                }
            })
            .setTag("ore_prossing_output");
    builder.addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
        if((Get_CustomData_int(event.controller.customData,"Extra_1_shell_connection",0)>0)||(Get_CustomData_int(event.controller.customData,"Extra_5_shell_connection",0)>0)){
            val thread = event.factoryRecipeThread;
            var Speed_Modier = 0.05;
            var Energy_Modier = 0.05;
            if(Get_CustomData_int(event.controller.customData,"Extra_5_shell_connection",0)>0){
                Speed_Modier /= 2;
                Energy_Modier /= 20;
            }
            val speedModifier = RecipeModifierBuilder
                .create("modularmachinery:duration", "input", Speed_Modier, 1, false)
                .build();
            val energyModifier = RecipeModifierBuilder
                .create("modularmachinery:energy", "input", Energy_Modier, 1, false)
                .build();
            thread.addPermanentModifier("speed_upgrade", speedModifier);
            thread.addPermanentModifier("energy_upgrade", energyModifier);
        }else{
            return;
        }
    });
    // 后续输出：需要升级才能产出
    for i in 1 to outputs.length {
        val byproduct = outputs[i];
        builder.addItemOutput(byproduct)
               .addItemModifier(function(ctrl, item) as IItemStack {
                var modifier = 1;
                   if (Get_CustomData_int(ctrl.customData,"Extra_2_shell_connection",0) > 0) {
                        if(Get_CustomData_int(ctrl.customData,"Extra_4_shell_connection",0) > 0){
                            modifier = 8;
                        }
                       return item*modifier;
                   }
                   return null;
               })
               .setTag("ore_prossing_output")
               .setPreViewNBT({display:{Lore:["§e需要升级：§b副产出升级"]}} as IData);
    }

    builder.addEnergyPerTickInput(1000000);
    builder.setMaxThreads(1);
    builder.build();
    recipeCounter += 1;
}
// ==================================================矿处配方==================================================




// ==================================================处理连接==================================================
val builder = RecipeBuilder.newBuilder("ore_processing_connection", MACHINE, 6000);
builder
    .addEnergyPerTickInput(10000)
    .setParallelized(false)
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        // 配方完成时触发
        val ctrl = event.controller;
        var data = ctrl.customData;
        val world = ctrl.world;
        for i in 1 to 6{
            var Current_connetion = Get_CustomData_int(data,"Extra_" + i + "_shell_connection",0);
            if Current_connetion > 0 {
                Current_connetion = Current_connetion - 1;
                data = data + ({ "Extra_" + i + "_shell_connection": Current_connetion } as IData);
            }else{
                data = data + ({ "Extra_" + i + "_shell_connection": 0 } as IData);
            }
            // ctrl.customData = data;
        }
        ctrl.customData = data;
    })
    .addRecipeTooltip("§d[网络连接维持]")
    .setMaxThreads(1)
    .setThreadName("网络监控器")
    .build();

// ==================================================处理连接==================================================
