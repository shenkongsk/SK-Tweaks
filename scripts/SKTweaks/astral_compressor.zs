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
import mods.modularmachinery.ActiveMachineRecipe;
import crafttweaker.liquid.ILiquidStack;
import mods.modularmachinery.RecipeFinishEvent;
val MACHINE = "astral_compressor";

// // 从已经连接的梦核获取能量
// function  AC_Recipe_Builder(
//     RecipeName as string,
//     ItemInputs as IIngredient[],
//     FluidInputs as ILiquidStack[],
//     ItemOutputs as IIngredient[],
//     FluidOutputs as ILiquidStack[],
//     EnergyInput as BigInteger,
//     Time as int
// )as void {
//     val builder = RecipeBuilder.newBuilder("astral_compressor", RecipeName,Time);
//     for item in ItemInputs {
//         builder.addItemInput(item);
//     }
//     for fluid in FluidInputs {
//         builder.addFluidInput(fluid);
//     }
//     // PreCheck：检查梦核连接 + 能量是否够
//     builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
//         DE_Energy_PreCheck(event, EnergyInput);
//     });

//     builder.addFinishHandler(function(event as RecipeFinishEvent) {
//         val ctrl = event.controller;
//         // Consume_DE_Core_Energy(ctrl, EnergyInput);
//     });

//     builder.addRecipeTooltip(
//         "§b需要梦核能量：§6" + EnergyInput.toString(),
//         "§7时间：" + Time + " tick"
//     );

//     builder.build();
// }
// Recipe_DE_Builder_SK(
//     "testrecipe_sadasd",
//     "astral_compressor",
//     [
//         <minecraft:stone>
//     ],
//     [
//         <liquid:water> * 1000
//     ],
//     [
//         <minecraft:diamond>
//     ],
//     [
//         <liquid:lava> * 1000
//     ],
//     200,
//     BigInteger("1000000000000"),
//     BigInteger("0"),
//     ""
// );
// Recipe_DE_Builder_SK(
//     "testrecipe_sasdsdsddasd",
//     "astral_compressor",
//     [
//         <minecraft:bedrock>
//     ],
//     [
//         <liquid:water> * 1000
//     ],
//     [
//         <minecraft:diamond>
//     ],
//     [
//         <liquid:lava> * 10000
//     ],
//     200,
//     BigInteger("0"),
//     BigInteger("100000000"),
//     ""
// );