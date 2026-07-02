#loader crafttweaker reloadable
#priority 100000
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.ActiveMachineRecipe;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import crafttweaker.block.IBlockState;
import crafttweaker.world.IBlockPos;

import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import crafttweaker.item.IItemStack;
 
import crafttweaker.data.IData;

// function SK_Real_Parallels(
//     ctrl as IMachineController,
//     recipe as ActiveMachineRecipe
// ) as void {
//     val configs as IData= {
//         "modularmachinery:gravitational_collapser": {
//             "checkPositions": [[0, 4, 0], [0, 2, 0]],
//             "checkBlocks": ["minecraft:diamond_block", "minecraft:gold_block"],
//             "upgrades": [32, 64]
//         },
//         "machine_b": {
//             "checkPositions": [[0, 0, 1], [0, 0, -1]],
//             "checkBlocks": ["contenttweaker:mythic_coil_t4", "minecraft:iron_block"],
//             "upgrades": [16384, 32768]
//         }
//     };
//     val name = ctrl.formedMachineName;
    
//     // 使用 has 检查机器名是否存在
//     if (!(configs has name)) {
//         recipe.maxParallelism = 1;
//         return;
//     }
    
//     // 通过点号或 memberGet 获取配置
//     val cfg = configs.memberGet(name);

    
//     // 提取一维数组（直接 asList 转）
//     val blocks = cfg.checkBlocks.asList() as string[];
//     val upgrades = cfg.upgrades.asList() as int[];

//     // 提取二维数组（需分步）
//     val posOuter = cfg.checkPositions.asList();
//     var positions as int[][] = [];
//     for i in 0 to posOuter.length - 1 {
//         positions[i] = posOuter[i].asList() as int[];
//     }

//     val world = ctrl.world;
//     val pos = ctrl.pos;

//     var extra = 0;
//     for i in 0 to positions.length - 1 {
//         val offset = positions[i];
//         val checkPos = pos.add(offset[0], offset[1], offset[2]);
//         val block = world.getBlockState(checkPos).getBlock();
//         if (block.definition.id == blocks[i]) {
//             extra = upgrades[i];
//             break;
//         }
//     }

//     recipe.maxParallelism = 1 + extra;
// }
// function SK_Real_Parallels(
//     ctrl as IMachineController,
//     recipe as ActiveMachineRecipe
// ) as void {

//     print("========== SK_Real_Parallels called ==========");

//     val configs as IData = {
//         "modularmachinery:gravitational_collapser": {
//             "checkPositions": [[0, 4, 0], [0, 2, 0]],
//             "checkBlocks": ["minecraft:diamond_block", "minecraft:gold_block"],
//             "upgrades": [32, 64]
//         },
//         "modularmachinery:machine_daisy": {
//             "checkPositions": [[0, 2, 0], [0, 2, 0]],
//             "checkBlocks": ["contenttweaker:mythic_coil_t4", "minecraft:iron_block"],
//             "upgrades": [16384, 327680]
//         }
//     };

//     val name = ctrl.formedMachineName;
//     print("Machine name: " + name);

//     if (!(configs has name)) {
//         print("No config found for machine " + name + ", parallelism set to 1");
//         recipe.maxParallelism = 1;
//         return;
//     }

//     print("Found config for machine " + name);
//     // 下面调试信息消失

//     val cfg = configs.memberGet(name);
//     val blocks = cfg.memberGet("checkBlocks");//["contenttweaker:mythic_coil_t4", "minecraft:iron_block"],
//     val upgrades = cfg.memberGet("upgrades");//[16384, 327680]
//     // ================将posOuter转化为二位数组==================
//     val posOuter = cfg.memberGet("checkPositions");//[[0, 2, 0], [0, 2, 0]]
//     print("testSK_posOuter:" + posOuter);
//     val outerList = posOuter.asList();
//     var positions as int[][] = [];
//     for i in 0 to outerList.length{
//         positions[i] = outerList[i].asList() as int[];
//     }
//     //=========================================================
//     val world = ctrl.world;
//     val pos = ctrl.pos;
//     print("testSK:" + positions[0][0]);
//     print("testSK:" + positions[0][1]);
//     print("testSK:" + positions[1][0]);
//     print("testSK:" + positions[1][1]);
//     print("Controller position:" + posOuter);

//     var extra = 0;
//     for i in 0 to posOuter.length {
//         // val positions = posOuter[i];
//         val offset = positions[i];
//         val checkPos = pos.add(offset[0], offset[1], offset[2]);
//         val block = world.getBlockState(checkPos).getBlock();
//         val blockId = block.definition.id;

//         print("Checkpoint " + i + ": target block=" + blocks[i] + ", actual block=" + blockId + ", pos=" + checkPos.x + "," + checkPos.y + "," + checkPos.z);

//         if (blockId == blocks[i]) {
//             extra = upgrades[i];
//             print("Match found! Extra parallelism = " + extra);
//             break;
//         }
//     }

//     val finalParallel = 1 + extra;
//     print("Final parallelism: " + finalParallel);
//     recipe.maxParallelism = finalParallel;
//     print("========== SK_Real_Parallels finished ==========");
// }
// 脚本在
// val blocks = cfg.checkBlocks.asList() as string[];
// val upgrades = cfg.upgrades.asList() as int[];
// 出错了。别用


