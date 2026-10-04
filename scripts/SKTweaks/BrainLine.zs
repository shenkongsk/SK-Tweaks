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
import mods.modularmachinery.ControllerModelAnimationEvent;
import crafttweaker.world.IBlockPos;
import mods.ctutils.utils.Math;
import native.java.math.BigInteger;
import mods.modularmachinery.MachineUpgradeHelper;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.ActiveMachineRecipe;
import crafttweaker.liquid.ILiquidStack;
val MACHINE = "infinite_seeker_brain_in_a_vat";
MachineModifier.addCoreThread(MACHINE, FactoryRecipeThread.createCoreThread("探究之脑"));
// MachineModifier.addCoreThread(MACHINE, FactoryRecipeThread.createCoreThread("探究之脑-本我"));
// MachineModifier.addCoreThread(MACHINE, FactoryRecipeThread.createCoreThread("探究之脑-自我"));
// MachineModifier.addCoreThread(MACHINE, FactoryRecipeThread.createCoreThread("探究之脑-超我"));
MachineModifier.addCoreThread(MACHINE, FactoryRecipeThread.createCoreThread("探究之脑-探究"));
for i in 1 to 11 {
    val threadName = "探究之脑-运算-" + i;
    val recipeName = "brain_whisper_" + i;
    MachineModifier.addCoreThread(MACHINE,
        FactoryRecipeThread.createCoreThread(threadName).addRecipe(recipeName)
    );
}
MachineModifier.setMaxThreads(MACHINE, 0);


RecipeBuilder.newBuilder("recursive_computing_matter_output", MACHINE, 60)
    .addItemInput(<contenttweaker:recursive_quantum>*1).setChance(0.01).setParallelizeUnaffected(true)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val data = event.controller.customData;
        val nutrient = Get_CustomData_int(data, "Brain_Nutrient", 0);
        if (nutrient < 50) {
            event.setFailed("大脑缺少养分！");
        }
    })
    .addFluidOutput(<liquid:recursive_computing_matter>*512)
    .addFluidModifier(function(controller, liquid) {
        val data = controller.customData;
        val nutrient = Get_CustomData_int(data, "Brain_Nutrient", 0);
        var actual_bonus as double;
        if (nutrient > 0) {
            actual_bonus = 80000.0 * (nutrient as double / 1000000.0);
        } else {
            actual_bonus = 1.0;
        }
        val totalAmount = (liquid.amount as int * actual_bonus) as int;
        var newData = data + ({ "Bonus": actual_bonus } as IData);
        controller.customData = newData;
        return <liquid:recursive_computing_matter> * totalAmount;
    })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        var data = event.controller.customData;
        val new_nutrient = Get_CustomData_int(data, "Brain_Nutrient", 0) - 50;
        var newData = data + ({ "Brain_Nutrient": new_nutrient } as IData);
        event.controller.customData = newData;
    })
    .addRecipeTooltip(
        "§f大脑§6§l养分§r越多",
        "§f产出越多",
        "§f默认产出：§c1x",
        "§f最大产出：§c80000.0x",
        "§f需要消耗：§c养分 §ex50"
    )
    .setMaxThreads(1)
    .setThreadName("探究之脑-探究")
    .build();


RecipeBuilder.newBuilder("brain_nutrient", MACHINE, 1)
    .addFluidInput(<liquid:asended_adenosinetriphosphate>*200)
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val data = event.controller.customData;
        val nutrient = Get_CustomData_int(data,"Brain_Nutrient",0);
        if((nutrient + 200) >= 1000000) {
            event.setFailed("养分已满！");
        }
    })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        var data = event.controller.customData;
        val new_nutrient = Get_CustomData_int(data,"Brain_Nutrient",0) + 200;
        var newData = data + ({ "Brain_Nutrient": new_nutrient } as IData);
        event.controller.customData = newData;
    })
    .setMaxThreads(1)
    .addRecipeTooltip("§f为大脑提供 §e200 §c养分")
    .setThreadName("探究之脑")
    .build();





MMEvents.onControllerGUIRender(MACHINE,function(event as ControllerGUIRenderEvent){
    val ctrl = event.controller;
    val data = ctrl.customData;
    var nutrient = Get_CustomData_int(data,"Brain_Nutrient",0);
    // var nutrient_id = Get_CustomData_int(data,"Brain_Nutrient_Id",0);
    // var nutrient_ego = Get_CustomData_int(data,"Brain_Nutrient_Ego",0);
    // var nutrient_superego = Get_CustomData_int(data,"Brain_Nutrient_Superego",0);
    var info as string[] = [];
    var actual_bonus = Get_CustomData_double(data,"Bonus",1.0);
    // 标题行
    info += "§3║§6✦§b §9§l无尽探求之脑 §f| §7v1.0 ";
    info += "§3║§d▸ 养分： §e" + nutrient + " / 1000000";
    info += "§3║§b▸ 递归推演物质： §e" + Math.round(actual_bonus) as int + "x";
    info += "§3║§b▸ 瑟尔： §e" + Math.round(Get_CustomData_double(data,"Bonus_1",1.0)) as int + "x";
    info += "§3║§b▸ 阿克拉斯特·科瓦莱恩： §e" + Math.round(Get_CustomData_double(data,"Bonus_2",1.0)) as int + "x";
    info += "§3║§b▸ 维狄萨斯·安纳斯： §e" + Math.round(Get_CustomData_double(data,"Bonus_3",1.0)) as int + "x";
    info += "§3║§b▸ 欧姆托斯·费拉克： §e" + Math.round(Get_CustomData_double(data,"Bonus_4",1.0)) as int + "x";
    info += "§3║§b▸ 丹奈斯·鲁森： §e" + Math.round(Get_CustomData_double(data,"Bonus_5",1.0)) as int + "x";
    info += "§3║§b▸ 泰兰： §e" + Math.round(Get_CustomData_double(data,"Bonus_6",1.0)) as int + "x";
    info += "§3║§b▸ 库兰德·泰尔兰： §e" + Math.round(Get_CustomData_double(data,"Bonus_7",1.0)) as int + "x";
    info += "§3║§b▸ 库拉德·暗穆兰： §e" + Math.round(Get_CustomData_double(data,"Bonus_8",1.0)) as int + "x";
    info += "§3║§b▸ 库拉德·加莱： §e" + Math.round(Get_CustomData_double(data,"Bonus_9",1.0)) as int + "x";
    info += "§3║§b▸ 斯塔沃·德梅兰： §e" + Math.round(Get_CustomData_double(data,"Bonus_10",1.0)) as int + "x";
    event.extraInfo = info;
});

// 飞升ATP制作
Recipe_Builder_SK(
    "asended_adenosinetriphosphate_make",
    "creation_altar",
    [
        <contenttweaker:chocolate_cherry_truffle>*16,
        <contenttweaker:intense_meatball_pasta>*16,
        <contenttweaker:bento_xxxl>*64,
        <nuclearcraft:foursmore>*64,
    ],
    [
        <liquid:essence_of_sane_thoughts>*200,
        <liquid:recursive_iced_coffee>*200,
        <liquid:pure_dream_energy>*100
    ],
    [],
    [
        <liquid:asended_adenosinetriphosphate>*50
    ],
    20,
    16384000,
    0
);
Recipe_Builder_SK(
    "asended_adenosinetriphosphate_make_2",
    "creation_altar",
    [
        <extendedcrafting:singularity_custom:998>*64,
        <contenttweaker:chocolate_cherry_truffle>*64,
        <contenttweaker:intense_meatball_pasta>*64,
        <contenttweaker:bento_xxxl>*256,
        <nuclearcraft:foursmore>*256,
    ],
    [
        <liquid:essence_of_sane_thoughts>*200,
        <liquid:recursive_iced_coffee>*200,
        <liquid:pure_dream_energy>*1000,
        <liquid:black_hole_juice>*50
    ],
    [],
    [
        <liquid:asended_adenosinetriphosphate>*5000
    ],
    20,
    2147483647,
    0
);


function BrainLine_Recipe_Builder(
    recipeName as string,
    ItemInputs as IIngredient[],
    FluidInputs as ILiquidStack[],
    FluidOutput as ILiquidStack,
    NutrientCost as int,
    // Nutrient_Id_Cost as int,
    // Nutrient_Ego_Cost as int,
    // Nutrient_Superego_Cost as int,
    MaxBonus as double,
    ThreadName as string,
    time as int
) as void {
    val builder = RecipeBuilder.newBuilder(recipeName, "infinite_seeker_brain_in_a_vat", time);
    for item in ItemInputs {
        builder.addItemInput(item);
    }
    for fluid in FluidInputs {
        builder.addFluidInput(fluid);
    }
    builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
        val data = event.controller.customData;
        val nutrient = Get_CustomData_int(data, "Brain_Nutrient", 0);
        if (nutrient < NutrientCost) {
            event.setFailed("大脑缺少养分！");
        }
    });
    builder.addFluidOutput(FluidOutput).addFluidModifier(function(controller, liquid) {
        val data = controller.customData;
        val nutrient = Get_CustomData_int(data, "Brain_Nutrient", 0);
        var actual_bonus = 1.0;
        if (nutrient > 0) {
            actual_bonus = MaxBonus * (nutrient as double / 1000000.0);
            if (actual_bonus < 1.0) actual_bonus = 1.0;   // 保证不低于 1x
        } else {
            actual_bonus = 1.0;
        }
        val totalAmount = (liquid.amount as int * actual_bonus) as int;
        

        val newData = data + ({ ("Bonus_" + ThreadName): actual_bonus } as IData);
        controller.customData = newData;
        
        return FluidOutput * totalAmount;
    });
    builder.addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        var data = event.controller.customData;
        val new_nutrient = Get_CustomData_int(data, "Brain_Nutrient", 0) - NutrientCost;
        var newData = data + ({ "Brain_Nutrient": new_nutrient } as IData);
        event.controller.customData = newData;
    });
    builder.addRecipeTooltip(
        "§f大脑§6§l养分§r越多",
        "§f产出越多",
        "§f默认产出：§c1x",
        "§f最大产出：§c" + MaxBonus + "x",
        "§f需要消耗：§c养分 §ex" + NutrientCost
    );
    builder.setThreadName("探究之脑-运算-" + ThreadName);
    builder.setMaxThreads(1);
    builder.build();
}
// BrainLine_Recipe_Builder(
//     "recursive_computing_matter_output",         // 配方注册名
//     [<contenttweaker:recursive_quantum> * 1],    // 物品输入：1 个递归量子
//     [],                                          // 流体输入：无
//     <liquid:recursive_computing_matter> * 512,   // 基础流体输出：512 mB
//     100,                                         // 每次运行消耗 100 点养分
//     80000.0,                                     // 最大倍率 80000x（当养分满 1,000,000 时）
//     0,                                           // 线程名：0
//     60                                           // 配方时间：60 tick
// );
val ItemInputs = [
    [<contenttweaker:thaumic_citrus>*64,<contenttweaker:terrestrial_catalyst>*64],
    [<extratrees:food:40>*64,<contenttweaker:alchemical_crystal>*64],
    [<tconstruct:materials:16>*64,<contenttweaker:sacred_cinders_fruit>*64],
    [<aoa3:bubble_berries>*64,<erebus:materials:1>*64],
    [<bewitchment:garnet>*64,<aoa3:heart_fruit>*64],
    [<aoa3:holly_top_petals>*64,<aoa3:bloodstone>*64],
    [<divinerpg:tomato>*64,<astralsorcery:itemcraftingcomponent>*64],
    [<divinerpg:marsine>*64,<biomesoplenty:gem>*64],
    [<divinerpg:white_mushroom>*64,<thaumcraft:amber>*64],
    [<minecraft:diamond>*64,<divinerpg:moonbulb>*64]
];
val FluidInputs = [
    [<liquid:recursive_computing_matter>*100000],
    [<liquid:whisper_of_thel>*50000],
    [<liquid:whisper_of_ahkrast_korvalain>*50000],
    [<liquid:whisper_of_verdith_anath>*50000],
    [<liquid:whisper_of_omtose_phellack>*5000],
    [<liquid:whisper_of_donaeth_rusen>*5000],
    [<liquid:whisper_of_tellan>*5000],
    [<liquid:whisper_of_kurald_thyrllan>*5000],
    [<liquid:whisper_of_kurald_emurlahn>*500],
    [<liquid:whisper_of_kurald_galain>*500]
];
val FluidOutput = [
    <liquid:whisper_of_thel>*1000000,
    <liquid:whisper_of_ahkrast_korvalain>*100000,
    <liquid:whisper_of_verdith_anath>*100000,
    <liquid:whisper_of_omtose_phellack>*100000,
    <liquid:whisper_of_donaeth_rusen>*10000,
    <liquid:whisper_of_tellan>*10000,
    <liquid:whisper_of_kurald_thyrllan>*1000,
    <liquid:whisper_of_kurald_emurlahn>*1000,
    <liquid:whisper_of_kurald_galain>*100,
    <liquid:whisper_of_starvald_demelain>*100
];
val NutrientCost = [
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    1000,
    1200,
    2000
];
val MaxBonuses = [
    8000.0,
    6000.0,
    4000.0,
    2000.0,
    1000.0,
    500.0,
    250.0,
    200.0,
    150.0,
    100.0
];

for i in 0 to ItemInputs.length {
    BrainLine_Recipe_Builder(
        "brain_whisper_" + ( i + 1 ),
        ItemInputs[i],
        FluidInputs[i],
        FluidOutput[i],
        NutrientCost[i],
        // 0,0,0,
        MaxBonuses[i],
        ( i + 1 ) as string,
        10
    );
}
