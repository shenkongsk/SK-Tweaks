// #loader mixin

// #mixin {targets: "hellfirepvp.modularmachinery.common.tile.TileController"}
// zenClass MixinUniversalAccelerator {

//     // 规则表：[匹配关键词, 加速百分比, 等级数（从1开始）]
//     // 加速百分比指速度提升的百分比（例如300 = 速度变为3倍）
//     val rules = [
//         // 普通火把 lv1~5，加速百分比：300, 600, 900, 1200, 1500
//         ["torch_lv",     300],
//         ["torch_lv",     600],
//         ["torch_lv",     900],
//         ["torch_lv",     1200],
//         ["torch_lv",     1500],
//         // 压缩火把 lv1~5，加速百分比：2700, 5400, 8100, 10800, 13500
//         ["compressed_torch_lv", 2700],
//         ["compressed_torch_lv", 5400],
//         ["compressed_torch_lv", 8100],
//         ["compressed_torch_lv", 10800],
//         ["compressed_torch_lv", 13500],
//         // 二重压缩火把 lv1~5，加速百分比：24300, 48600, 72900, 97200, 121500
//         ["d_compressed_torch_lv", 24300],
//         ["d_compressed_torch_lv", 48600],
//         ["d_compressed_torch_lv", 72900],
//         ["d_compressed_torch_lv", 97200],
//         ["d_compressed_torch_lv", 121500]
//     ];

//     // 从资源路径中提取等级数字（如 "torch_lv3" -> 3）
//     function extractLevel(path as string) as int {
//         // 找到最后一个数字
//         val match = regex.find(path, "\\d+");
//         if (match != null) {
//             return match.group(0).asInt();
//         }
//         return 0;
//     }

//     // 根据方块的资源路径返回时间乘数
//     function getTimeMultiplier(path as string) as double {
//         for i in 0 to rules.length - 1 {
//             val keyword = rules[i][0] as string;
//             val basePercent = rules[i][1] as int;
//             if (path.contains(keyword)) {
//                 val level = extractLevel(path);
//                 if (level >= 1 && level <= 5) {
//                     // 计算该等级的加速百分比：等级从1开始，每个等级对应的加速百分比 = basePercent * level
//                     val percent = basePercent * level;
//                     // 时间乘数 = 1 / (percent / 100) = 100 / percent
//                     return 100.0 / percent;
//                 }
//             }
//         }
//         return 1.0;  // 无加速
//     }

//     #mixin ModifyVariable 
//     #{
//     #    method: "update",
//     #    at: @At("HEAD"),
//     #    remap: false
//     #}
//     function onUpdate() as void {
//         val controller = this as TileController;  // 使用导入的类名
//         if (controller.getWorld() == null) return;
//         if (controller.getWorld().isRemote) return;
        
//         val activeRecipe = controller.getActiveRecipe();
//         if (activeRecipe == null) return;
        
//         val applier = activeRecipe.getModifierApplier();
//         var multiplier = 1.0;
        
//         val world = controller.getWorld();
//         val pos = controller.getPos();
//         outer: for dx in -3 to 3 {
//             for dy in -3 to 3 {
//                 for dz in -3 to 3 {
//                     val block = world.getBlockState(pos.add(dx, dy, dz)).getBlock();
//                     val regName = block.getRegistryName();
//                     if (regName == null) continue;
//                     if (regName.namespace != "tce") continue;
                    
//                     val path = regName.resourcePath;
//                     val rate = getTimeMultiplier(path);
//                     if (rate != 1.0) {
//                         multiplier = rate;
//                         break outer;
//                     }
//                 }
//             }
//         }
        
//         applier.inputMul = multiplier as float;
//     }
// }