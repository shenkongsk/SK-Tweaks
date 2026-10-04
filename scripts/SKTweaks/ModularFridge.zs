#loader crafttweaker reloadable
// "selector-tag": "coolant_input",
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
import crafttweaker.item.IItemStack;
import crafttweaker.world.IBlockPos;
import mods.ctutils.utils.Math;
import native.java.math.BigInteger;
import mods.modularmachinery.MachineUpgradeHelper;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.ActiveMachineRecipe;
import crafttweaker.liquid.ILiquidStack;

var MACHINE as string = "large_fridge";
MachineModifier.setMaxThreads(MACHINE,8);
MachineModifier.addCoreThread(MACHINE,FactoryRecipeThread.createCoreThread("冷却模块"));
<modularmachinery:large_fridge_factory_controller>.addTooltip(format.red("冷却液只能从后方输入！"));




function Fridge_Coolant_Fluid_Input(
    RecipeName as string,
    FluidInput as ILiquidStack,
    CoolantAmount as int
)as void {
    val builder = RecipeBuilder.newBuilder(RecipeName, "large_fridge", 2);
    builder.setMaxThreads(1);
    builder.addFluidInput(FluidInput).setTag("coolant_input");
    builder.addRecipeTooltip(
        "§b[冷却液输入]",
        "§r输入 §6"+FluidInput.displayName+"§r,",
        "§r为§b冷却模块§r提供§9 "+CoolantAmount+" §r点§b§l冷值"
        );
    builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
        val data = event.controller.customData;
        val actualInput = (Get_CustomData_long(data,"ColdCharge",0)+CoolantAmount);
        if (actualInput > 9223372036854775807) {
            event.setFailed("冷值存储已达极限！");
        }
    });
    builder.addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val New_Coolant = Get_CustomData_long(data,"ColdCharge",0) + CoolantAmount;
        val newData = data + ({ "ColdCharge": New_Coolant } as IData);
        ctrl.customData = newData;
    });
    builder.setThreadName("冷却模块");
    builder.build();
}
val FluidValues as int[ILiquidStack]$orderly = {
    <liquid:water>*100000   : 10,
    <liquid:hot_spring_water>*10000 : 200,
    <liquid:liquidhelium>*10000 : 1000,
    <liquid:cryotheum>*10000    : 2000,
    <liquid:supercooled_noble_gas_mix>*10000 : 25000,
    <liquid:sideral_life_essence>*10000 : 160000,
    <liquid:stormlight>*10000 : 720000,
    <liquid:whisper_of_thel>*10000 : 1024000,
    <liquid:matter_of_creative_inquiry>*1000 : 8192000,
};


for fluidInput, coolantAmount in FluidValues {
    Fridge_Coolant_Fluid_Input(
        "Coolant_Fluid_Recipe_" + fluidInput.definition.name,       // 不知道能不能正确注册
        fluidInput,
        coolantAmount
    );
}


function Fridge_Coolant_Item_Input(
    RecipeName as string,
    ItemInput as IIngredient,
    CoolantAmount as int,
    ItemOutput as IIngredient,
    FluidInput as ILiquidStack,
    FluidOutput as ILiquidStack
)as void {
    val builder = RecipeBuilder.newBuilder(RecipeName, "large_fridge", 2);
    builder.setMaxThreads(1);
    if (!isNull(ItemInput)) {
        builder.addItemInput(ItemInput);
    }
    if (!isNull(ItemOutput)) {
        builder.addItemOutput(ItemOutput);
    }
    if (!isNull(FluidInput)) {
        builder.addFluidInput(FluidInput);
    }
    if (!isNull(FluidOutput)) {
        builder.addFluidOutput(FluidOutput);
    }
    builder.addRecipeTooltip(
        "§9[冷却模块]",
        "需要§9 " + CoolantAmount + " §r点冷值"
        );
    builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
        val data = event.controller.customData;
        if ((Get_CustomData_long(data,"ColdCharge",0)) < (CoolantAmount)) {
            event.setFailed("冷值不够！");
        }
    });
    builder.addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        val New_Coolant = Get_CustomData_long(data,"ColdCharge",0) - CoolantAmount;
        val newData = data + ({ "ColdCharge": New_Coolant } as IData);
        ctrl.customData = newData;
    });
    builder.build();
}

val FridgeItemValues as IIngredient[IIngredient]$orderly = {
    <contenttweaker:material_part:129>*6400 : <contenttweaker:material_part:132>*6400,
    <contenttweaker:myrmex_coolant_cell>*64 : <contenttweaker:cryotheum_myrmex_coolant_cell>*64,
    <minecraft:packed_ice>*640 : <nuclearcraft:block_ice>*640
};
val Coolant_Amount = [
    160000,
    64000000,
    6400
];
var temp_i_never_second_used_no_no_no = 0;
for Inputs, Outputs in FridgeItemValues {
    Fridge_Coolant_Item_Input(
        "Coolant_Item_Recipe_" + temp_i_never_second_used_no_no_no,
        Inputs,
        Coolant_Amount[temp_i_never_second_used_no_no_no],
        Outputs,
        null,
        null
    );
    temp_i_never_second_used_no_no_no += 1;
}

val FridgeFluidValues as ILiquidStack[ILiquidStack]$orderly = {
    <liquid:fluidhelium>*80000 : <liquid:liquidhelium>*250,
    <liquid:fluidnitrogen>*80000 : <liquid:liquid_nitrogen>*250,
    <liquid:hot_fluorine>*10000 : <liquid:fluorine>*10000,
    <liquid:dense_plasma>*80000 : <liquid:triple_point_fluid>*1000
};
val Coolant_Amount_Liquid = [
    1000,
    1000,
    2000,
    150000
];
var temp_ii_never_second_used_no_no_no = 0;
for Inputs, Outputs in FridgeFluidValues {
    Fridge_Coolant_Item_Input(
        "Coolant_Fluid_Recipe_" + temp_ii_never_second_used_no_no_no,
        null,
        Coolant_Amount_Liquid[temp_ii_never_second_used_no_no_no],
        null,
        Inputs,
        Outputs
    );
    temp_ii_never_second_used_no_no_no += 1;
}













MMEvents.onControllerGUIRender(MACHINE, function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    if (isNull(ctrl)) return;
    val data = ctrl.customData;
    var Coolant = Get_CustomData_long(data, "ColdCharge", 0);
    var info as string[] = [];
    info += "§3║§6✦§b 稍微大一点的冰箱 §f| §7v1.0 ";
    info += "§3║§b▸§a 冷值 §f| §9" + Coolant;
    event.extraInfo = info;
});
