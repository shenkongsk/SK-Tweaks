// #loader crafttweaker reloadable

// import mods.modularmachinery.RecipeBuilder;
// import crafttweaker.item.IItemStack;
// // 补全一些精华的配方



// // 辅助函数：根据名称生成种子
// function getSeed(name as string) as IItemStack {
//     return itemUtils.getItem("mysticalagriculture:" + name + "_seeds");
// }

// // 辅助函数：根据名称生成 essence
// function getEssence(name as string) as IItemStack {
//     return itemUtils.getItem("mysticalagriculture:" + name + "_essence");
// }
// // 只需要维护名称列表
// var Name = [
//     "end_steel"
// ];

// // 遍历名称列表，为每个名称生成配方
// for name in Name {
//     var inputItem = getSeed(name);
//     var outputItem = getEssence(name);
    
//     scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK_Chance(
//         "hypergrowth_sk_" + name,           // 配方名称（用名称代替索引）
//         "hypergrowth_insolator",            // 机器名称
//         [inputItem],                        // 输入物品数组
//         [0.0],                              // 输入物品概率
//         [<fluid:hot_spring_water>*100],     // 输入流体
//         [],                                 // 输入流体概率（空数组）
//         [outputItem*64],                       // 输出物品数组
//         [1.0],                              // 输出物品概率
//         [],                                 // 输出流体（空数组）
//         [],                                 // 输出流体概率（空数组）
//         10,                                 // 时间
//         0,                                  // 能量输入
//         0                                   // 能量输出
//     );
// }