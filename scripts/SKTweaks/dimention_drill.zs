#loader crafttweaker reloadable

import mods.immersiveengineering.Excavator;
import mods.jei.JEI;
import mods.randomtweaker.jei.IJeiPanel;
import mods.randomtweaker.jei.IJeiUtils;
import mods.randomtweaker.jei.IJeiRecipe;
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.event.PlayerRightClickItemEvent;
import crafttweaker.block.IBlockState;
import crafttweaker.world.IBlockPos;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifier;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.IngredientArrayBuilder;

import native.blusunrize.immersiveengineering.api.tool.ExcavatorHandler;
import native.blusunrize.immersiveengineering.api.tool.ExcavatorHandler.MineralMix;
import native.blusunrize.immersiveengineering.common.blocks.metal.TileEntitySampleDrill;
import native.flaxbeard.immersivepetroleum.api.crafting.PumpjackHandler;

val MACHINE = "dimension_drill";
val mainThread = FactoryRecipeThread.createCoreThread("矿脉钻头");
MachineModifier.addCoreThread(MACHINE, mainThread);
MachineModifier.setMaxThreads(MACHINE, 0);
MachineModifier.setInternalParallelism(MACHINE, 32);
<modularmachinery:dimension_drill_factory_controller>.addTooltip(format.gold("内置32并行！"));
<modularmachinery:dimension_drill_factory_controller>.addTooltip(format.gold("这个**玩意在主世界无法读取矿脉"));
<modularmachinery:dimension_drill_factory_controller>.addTooltip(format.red("配方运行过一次后才会显示矿脉名称"));
<ore:orePsi>.add(<contenttweaker:psichic_stone>);

function getOreFromVein(
    ctrl as IMachineController,
    dummyItem as IItemStack,
    multiplier as int
) as IItemStack 
{
    val world = ctrl.world;
    val nativeW = world.native;
    val data = ctrl.customData; 
    val pos = ctrl.pos;
    val targetChunkX = pos.x / 16;
    val targetChunkZ = pos.z / 16;

    val worldInfo = ExcavatorHandler.getMineralWorldInfo(nativeW, targetChunkX, targetChunkZ);
    if (worldInfo == null) return <minecraft:cobblestone>;

    val mineral = worldInfo.mineral;
    val override = worldInfo.mineralOverride;
    if (mineral == null && override == null) return <minecraft:cobblestone>*multiplier;

    val ores = (override != null ? override.ores : mineral.ores) as string[];
    val oreCount = ores.length;
    if (oreCount == 0) return <minecraft:cobblestone>*multiplier;

    val idx = world.random.nextInt(oreCount);
    val oreEntry = oreDict.get(ores[idx]);
    if (isNull(oreEntry)) return <minecraft:cobblestone>*multiplier;
    val oreArray = oreEntry.items as IItemStack[];
    if (oreArray.length > 0) {
        return oreArray[0]*multiplier;
    } else {
        return <minecraft:cobblestone>*multiplier;
    }
}
function Dimentional_Drill_Recipe_builder(
    tier as int,
    inputs as crafttweaker.item.IIngredient[],
    fluidInputs as crafttweaker.liquid.ILiquidStack[],
    multiplier as int
)as void
{
    var builder = RecipeBuilder.newBuilder("mine_ore_tier"+tier, "dimension_drill", tier*200);
    builder.addEnergyPerTickInput(tier*1000000);
    for i in 0 to fluidInputs.length{
        val fluid = fluidInputs[i];
        builder.addFluidInput(fluid);
    }
    for i in 0 to inputs.length{
        val item = inputs[i];
        builder.addItemInput(item).setChance(0.0);
    }
    for i in 0 to tier*tier {
        builder.addOutput(<immersiveengineering:metal_multiblock:11>.withTag({display: {Name: "§d§l矿脉挖掘", Lore: ["§6这台机器会根据§4§l沉浸矿脉§6生成产物", "§6如果没有矿脉，则生成圆石"]}})).addItemModifier(function(ctrl as IMachineController, item as IItemStack) as IItemStack {
            return getOreFromVein(ctrl, item, multiplier);
        });
    }
    //
    // 添加完成事件：保存矿脉名称到 customData
    builder.addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val world = ctrl.world;
        val nativeW = world.native;
        val pos = ctrl.pos;
        val chunkX = pos.x / 16;
        val chunkZ = pos.z / 16;
        val worldInfo = ExcavatorHandler.getMineralWorldInfo(nativeW, chunkX, chunkZ);
        if (worldInfo != null) {
            val mineral = worldInfo.mineral;
            val override = worldInfo.mineralOverride;
            val veinName = (override != null ? override.name : mineral.name) as string;
            var data = ctrl.customData;
            if (isNull(data)) data = {} as IData;
            var map = data.asMap();
            map["current_vein"] = veinName;
            ctrl.customData = data;
        }
    });
    //
    builder.setMaxThreads(1);
    builder.setParallelized(true);
    builder.build();
}
Dimentional_Drill_Recipe_builder(
    1,
    [],
    [<liquid:rosidian>*1],
    8
);
Dimentional_Drill_Recipe_builder(
    2,
    [],
    [<liquid:high_entropy_hyperdense_plasma>*1],
    64
);
Dimentional_Drill_Recipe_builder(
    3,
    [<avaritia:infinity_pickaxe>.withTag({display: {Lore: ["§d§o极・超限附魔§r"]}})],
    [],
    256
);

MMEvents.onControllerGUIRender(MACHINE, function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    if (isNull(ctrl)) return;
    var name = "无矿脉";
    val data = ctrl.customData;
    if (!isNull(data)) {
        val map = data.asMap();
        val currentVein = map["current_vein"] as string;
        if (!isNull(currentVein) && currentVein != "") name = currentVein;
    }
    event.extraInfo = ["§9当前区块矿脉: §a" + name];
});