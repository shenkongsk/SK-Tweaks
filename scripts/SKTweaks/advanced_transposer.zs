#loader crafttweaker reloadable
#priority 1
import mods.modularmachinery.Sync;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineController;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.RecipeModifierBuilder;

import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import mods.modularmachinery.RecipeAdapterBuilder;


// // RecipeBuilder.newBuilder("fluid_bottling", "me_fluid_bottler", 5)
// //     // 输入1000mB的流体（这里以liquid_pe为例，实际支持任何流体）
// //     .addInput(<liquid:liquid_pe> * 1000)
// //     // 输入1个空桶
// //     .addInput(<minecraft:bucket>)
// //     // 输出一个占位用的空桶，后续通过 Modifier 修改它的NBT
// //     .addOutput(<minecraft:bucket>)
// //     .addItemModifier(function(ctrl as IMachineController, oldItem as IItemStack) as IItemStack {
// //         // 1. 获取输入的流体类型
// //         // 2. 构造盛装流体的桶的NBT
// //         // Forge的标准流体桶NBT格式: {FluidName: "xxx", Amount: 1000}
// //     })
// //     .addRecipeTooltip("输入1000mB流体+空桶", "输出对应流体的桶", "自动读取输入流体类型")
// //     .build();
// function FluidTransposer(
//     Fluid_Storage as IItemStack,
//     Fluid as ILiquidStack
// )as any[] {
//     var C_ID = Fluid_Storage.definition.id;
//     var FluidAmount;
//     // 1.原版桶
//     if(C_ID == "minecraft:bucket"){
//         FluidAmount = 1000; 
//         return[
//             <forge:bucketfilled>.withTag({
//                 "FluidName": Fluid.name,
//                 "Amount": FluidAmount
//             }),
//             FluidAmount
//         ];
//     // 2.OB蓄水槽
//     }else if(C_ID == "openblocks:tank"){
//         FluidAmount = 16000;
//         return[
//             <openblocks:tank>.withTag({
//                 "tank": {
//                     "FluidName": Fluid.name,
//                     "Amount": FluidAmount
//                 }
//             }),
//             FluidAmount
//         ];
//     }
//     return [<minecraft:bucket>,1000]; //如果输入的不符合上述条件，则输出空桶
// }
// FluidTransposer(<minecraft:bucket>, <liquid:liquid_pe>);

// //[<forge:bucketfilled>.withTag({FluidName: "liquid_pe", Amount: 1000}),1000]
