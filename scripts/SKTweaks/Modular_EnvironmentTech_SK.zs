#loader crafttweaker reloadable
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

val MACHINE = "deep_void_excavator";
val threadA = FactoryRecipeThread.createCoreThread("升级核心");
MachineModifier.addCoreThread(MACHINE, threadA);
val threadB = FactoryRecipeThread.createCoreThread("深度采掘核心");
MachineModifier.addCoreThread(MACHINE, threadB);
MachineModifier.setMaxThreads(MACHINE, 0);

val oreMinerOutputs as IData[] = [
    {color: 15, weight: 800, id: "OD:oreCoal"},
    {color: 0, weight: 700, id: "OD:oreIron"},
    {color: 0, weight: 500, id: "OD:oreQuartz"},
    {color: 14, weight: 500, id: "OD:oreRedstone"},
    {color: 11, weight: 343, id: "OD:oreLapis"},
    {color: 4, weight: 311, id: "OD:oreGold"},
    {color: 9, weight: 218, id: "OD:oreDiamond"},
    {color: 5, weight: 156, id: "OD:oreEmerald"},
    {color: 4, weight: 234, id: "OD:glowstone"},
    {color: 1, weight: 584, id: "OD:oreCopper"},
    {color: 7, weight: 602, id: "OD:oreTin"},
    {color: 8, weight: 381, id: "OD:oreSilver"},
    {color: 10, weight: 500, id: "OD:oreLead"},
    {color: 0, weight: 422, id: "OD:oreAluminum"},
    {color: 13, weight: 140, id: "OD:oreUranium"},
    {color: 4, weight: 156, id: "OD:oreYellorite"},
    {color: 3, weight: 187, id: "OD:oreCertusQuartz"},
    {color: 3, weight: 109, id: "OD:oreChargedCertusQuartz"},
    {color: 12, weight: 190, id: "OD:oreCinnabar"},
    {color: 1, weight: 184, id: "OD:oreAmber"},
    {color: 7, weight: 232, id: "OD:oreNickel"},
    {color: 3, weight: 150, id: "OD:orePlatinum"},
    {color: 3, weight: 169, id: "OD:oreMithril"},
    {color: 15, weight: 128, id: "OD:oreClathrateOilSand"},
    {color: 15, weight: 120, id: "OD:oreClathrateOilShale"},
    {color: 13, weight: 118, id: "OD:oreClathrateEnder"},
    {color: 4, weight: 145, id: "OD:oreClathrateGlowstone"},
    {color: 14, weight: 137, id: "OD:oreClathrateRedstone"},
    {color: 4, weight: 222, id: "OD:oreSulfur"},
    {color: 0, weight: 244, id: "OD:oreNiter"},
    {color: 14, weight: 113, id: "OD:oreFirestone"},
    {color: 11, weight: 163, id: "OD:oreCobalt"},
    {color: 1, weight: 159, id: "OD:oreArdite"},
    {color: 3, weight: 200, id: "OD:oreApatite"},
    {color: 10, weight: 142, id: "draconicevolution:draconium_ore"},
    {color: 15, weight: 190, id: "OD:oreGraphite"},
    {color: 15, weight: 290, id: "OD:oreQuartzBlack"},
    {color: 0, weight: 233, id: "OD:oreMagnesium"},
    {color: 0, weight: 201, id: "OD:oreLithium"},
    {color: 15, weight: 222, id: "OD:oreThorium"},
    {color: 8, weight: 199, id: "OD:oreBoron"},
    {color: 12, weight: 177, id: "deepresonance:resonating_ore"},
    {color: 6, weight: 186, id: "OD:oreZinc"},
    {color: 15, weight: 192, id: "OD:oreTungsten"},
    {color: 3, weight: 251, id: "OD:oreOsmium"},
    {color: 0, weight: 160, id: "OD:oreSalt"},
    {color: 0, weight: 127, id: "rftools:dimensional_shard_ore"},
    {color: 13, weight: 190, id: "OD:oreInferium"},
    {color: 8, weight: 155, id: "OD:oreProsperity"},
    {color: 11, weight: 414, id: "OD:oreElectrotine"},
    {color: 5, weight: 223, id: "OD:oreBrainstone"},
    {color: 0, weight: 111, id: "thaumcraft:crystal_ordo"},
    {color: 4, weight: 111, id: "thaumcraft:crystal_aer"},
    {color: 1, weight: 111, id: "thaumcraft:crystal_ignis"},
    {color: 15, weight: 111, id: "thaumcraft:crystal_perditio"},
    {color: 10, weight: 111, id: "thaumcraft:crystal_vitium"},
    {color: 11, weight: 111, id: "thaumcraft:crystal_aqua"},
    {color: 13, weight: 111, id: "thaumcraft:crystal_terra"},
    {color: 5, weight: 223, id: "OD:oreBrainstone"},
    {color: 0, weight: 223, id: "OD:oreTitaniumIron"},
    {color: 10, weight: 333, id: "OD:oreSilicon"},
    {color: 0, weight: 95, id: "astralsorcery:blockcustomore:0"},
    {color: 14, weight: 200, id: "OD:oreRuby"},
    {color: 13, weight: 200, id: "OD:orePeridot"},
    {color: 1, weight: 200, id: "OD:oreTopaz"},
    {color: 10, weight: 200, id: "OD:oreTanzanite"},
    {color: 9, weight: 200, id: "OD:oreMalachite"},
    {color: 11, weight: 200, id: "OD:oreSapphire"},
    {color: 1, weight: 200, id: "OD:oreGarnet"},
    {color: 4, weight: 200, id: "OD:oreHeliodore"},
    {color: 13, weight: 200, id: "OD:oreBeryl"},
    {color: 13, weight: 200, id: "OD:oreIndicolite"},
    {color: 11, weight: 200, id: "OD:oreAquamarine"},
    {color: 10, weight: 200, id: "OD:oreIolite"},
    {color: 10, weight: 200, id: "OD:oreAmethyst"},
    {color: 6, weight: 200, id: "OD:oreAgate"},
    {color: 6, weight: 200, id: "OD:oreMorganite"},
    {color: 15, weight: 200, id: "OD:oreOnyx"},
    {color: 0, weight: 200, id: "OD:oreOpal"},
    {color: 14, weight: 200, id: "OD:oreCarnelian"},
    {color: 12, weight: 200, id: "OD:oreSpinel"},
    {color: 12, weight: 200, id: "OD:oreCitrine"},
    {color: 4, weight: 200, id: "OD:oreJasper"},
    {color: 4, weight: 200, id: "OD:oreGoldenBeryl"},
    {color: 13, weight: 200, id: "OD:oreMoldavite"},
    {color: 9, weight: 200, id: "OD:oreTurquoise"},
    {color: 9, weight: 200, id: "OD:oreMoonstone"},
    {color: 11, weight: 200, id: "OD:oreBlueTopaz"},
    {color: 10, weight: 200, id: "OD:oreVioletSapphire"},
    {color: 10, weight: 200, id: "OD:oreLepidolite"},
    {color: 10, weight: 200, id: "OD:oreAmetrine"},
    {color: 15, weight: 200, id: "OD:oreBlackDiamond"},
    {color: 0, weight: 200, id: "OD:oreAlexandrite"},
    {color: 0, weight: 200, id: "OD:oreChaos"},
    {color: 13, weight: 200, id: "OD:oreEnderEssence"},
    {color: 16, weight: 400, id: "environmentaltech:litherite_crystal"},
    {color: 16, weight: 400, id: "environmentaltech:erodium_crystal"},
    {color: 16, weight: 400, id: "environmentaltech:kyronite_crystal"},
    {color: 16, weight: 300, id: "environmentaltech:pladium_crystal"},
    {color: 16, weight: 200, id: "environmentaltech:ionite_crystal"},
    {color: 16, weight: 200, id: "environmentaltech:aethium_crystal"},
    {color: 15, weight: 200, id: "environmentaltech:lonsdaleite_crystal"},
    {color: 14, weight: 200, id: "OD:oreBopRuby"},
    {color: 11, weight: 200, id: "OD:oreBopSapphire"},
    {color: 13, weight: 200, id: "OD:oreBopPeridot"},
    {color: 10, weight: 200, id: "OD:oreBopAmethyst"}
];

// ========== 植物采集器（Botanic） ==========
val botanicMinerOutputs as IData[] = [
    {color: 17, weight: 24, id: "OD:logWood"},
    {color: 18, weight: 4, id: "OD:treeSapling"},
    {color: 18, weight: 4, id: "ic2:sapling"},
    {color: 19, weight: 48, id: "OD:treeLeaves"},
    {color: 20, weight: 8, id: "minecraft:yellow_flower:0"},
    {color: 20, weight: 8, id: "minecraft:red_flower:0"},
    {color: 20, weight: 8, id: "minecraft:red_flower:1"},
    {color: 20, weight: 8, id: "minecraft:red_flower:2"},
    {color: 20, weight: 8, id: "minecraft:red_flower:3"},
    {color: 20, weight: 8, id: "minecraft:red_flower:4"},
    {color: 20, weight: 8, id: "minecraft:red_flower:5"},
    {color: 20, weight: 8, id: "minecraft:red_flower:6"},
    {color: 20, weight: 8, id: "minecraft:red_flower:7"},
    {color: 20, weight: 8, id: "minecraft:red_flower:8"},
    {color: 20, weight: 8, id: "minecraft:double_plant:0"},
    {color: 20, weight: 8, id: "minecraft:double_plant:1"},
    {color: 20, weight: 8, id: "minecraft:double_plant:4"},
    {color: 20, weight: 8, id: "minecraft:double_plant:5"},
    {color: 21, weight: 6, id: "minecraft:carrot:0"},
    {color: 21, weight: 6, id: "minecraft:potato:0"},
    {color: 21, weight: 2, id: "minecraft:poisonous_potato:0"},
    {color: 21, weight: 6, id: "minecraft:beetroot:0"},
    {color: 21, weight: 3, id: "minecraft:pumpkin:0"},
    {color: 21, weight: 1, id: "minecraft:lit_pumpkin:0"},
    {color: 21, weight: 2, id: "minecraft:melon_block:0"},
    {color: 21, weight: 4, id: "minecraft:melon:0"},
    {color: 21, weight: 3, id: "minecraft:chorus_fruit:0"},
    {color: 21, weight: 6, id: "minecraft:apple:0"},
    {color: 21, weight: 7, id: "minecraft:wheat:0"},
    {color: 21, weight: 6, id: "minecraft:reeds:0"},
    {color: 22, weight: 4, id: "minecraft:red_mushroom:0"},
    {color: 22, weight: 4, id: "minecraft:brown_mushroom:0"},
    {color: 23, weight: 1, id: "minecraft:chorus_flower:0"},
    {color: 23, weight: 3, id: "minecraft:wheat_seeds:0"},
    {color: 23, weight: 2, id: "minecraft:pumpkin_seeds:0"},
    {color: 23, weight: 3, id: "minecraft:melon_seeds:0"},
    {color: 23, weight: 6, id: "minecraft:cactus:0"},
    {color: 23, weight: 3, id: "minecraft:beetroot_seeds:0"},
    {color: 23, weight: 3, id: "minecraft:nether_wart:0"},
    {color: 13, weight: 3, id: "minecraft:tallgrass:1"},
    {color: 13, weight: 3, id: "minecraft:tallgrass:2"},
    {color: 12, weight: 3, id: "minecraft:deadbush:0"},
    {color: 13, weight: 3, id: "minecraft:vine:0"},
    {color: 13, weight: 3, id: "minecraft:waterlily:0"},
    {color: 13, weight: 8, id: "minecraft:double_plant:2"},
    {color: 13, weight: 8, id: "minecraft:double_plant:3"},
    {color: 20, weight: 8, id: "OD:mysticFlower"}
];

// ========== 资源采集器（Resource） ==========
val resourceMinerOutputs as IData[] = [
    {color: 7, weight: 32, id: "minecraft:stone:0"},
    {color: 6, weight: 30, id: "minecraft:stone:1"},
    {color: 0, weight: 30, id: "minecraft:stone:3"},
    {color: 7, weight: 30, id: "minecraft:stone:5"},
    {color: 8, weight: 30, id: "minecraft:gravel"},
    {color: 13, weight: 10, id: "minecraft:grass"},
    {color: 12, weight: 20, id: "minecraft:dirt:0"},
    {color: 12, weight: 10, id: "minecraft:dirt:2"},
    {color: 4, weight: 30, id: "minecraft:sand:0"},
    {color: 14, weight: 24, id: "minecraft:sand:1"},
    {color: 4, weight: 10, id: "minecraft:sandstone:0"},
    {color: 14, weight: 10, id: "minecraft:red_sandstone:0"},
    {color: 7, weight: 28, id: "minecraft:cobblestone"},
    {color: 13, weight: 10, id: "minecraft:mossy_cobblestone"},
    {color: 10, weight: 9, id: "minecraft:obsidian"},
    {color: 8, weight: 12, id: "minecraft:clay"},
    {color: 14, weight: 28, id: "minecraft:netherrack"},
    {color: 12, weight: 16, id: "minecraft:soul_sand"},
    {color: 10, weight: 8, id: "minecraft:mycelium"},
    {color: 4, weight: 13, id: "minecraft:end_stone:0"},
    {color: 1, weight: 12, id: "minecraft:hardened_clay"},
    {color: 0, weight: 2, id: "minecraft:stained_hardened_clay:0"},
    {color: 1, weight: 2, id: "minecraft:stained_hardened_clay:1"},
    {color: 2, weight: 2, id: "minecraft:stained_hardened_clay:2"},
    {color: 3, weight: 2, id: "minecraft:stained_hardened_clay:3"},
    {color: 4, weight: 2, id: "minecraft:stained_hardened_clay:4"},
    {color: 5, weight: 2, id: "minecraft:stained_hardened_clay:5"},
    {color: 6, weight: 2, id: "minecraft:stained_hardened_clay:6"},
    {color: 7, weight: 2, id: "minecraft:stained_hardened_clay:7"},
    {color: 8, weight: 2, id: "minecraft:stained_hardened_clay:8"},
    {color: 9, weight: 2, id: "minecraft:stained_hardened_clay:9"},
    {color: 10, weight: 2, id: "minecraft:stained_hardened_clay:10"},
    {color: 11, weight: 2, id: "minecraft:stained_hardened_clay:11"},
    {color: 12, weight: 2, id: "minecraft:stained_hardened_clay:12"},
    {color: 13, weight: 2, id: "minecraft:stained_hardened_clay:13"},
    {color: 14, weight: 2, id: "minecraft:stained_hardened_clay:14"},
    {color: 15, weight: 2, id: "minecraft:stained_hardened_clay:15"},
    {color: 4, weight: 28, id: "minecraft:sponge"},
    {color: 0, weight: 12, id: "environmentalmaterials:alabaster:0"},
    {color: 1, weight: 6, id: "environmentalmaterials:alabaster:1"},
    {color: 2, weight: 6, id: "environmentalmaterials:alabaster:2"},
    {color: 3, weight: 6, id: "environmentalmaterials:alabaster:3"},
    {color: 4, weight: 6, id: "environmentalmaterials:alabaster:4"},
    {color: 5, weight: 6, id: "environmentalmaterials:alabaster:5"},
    {color: 6, weight: 6, id: "environmentalmaterials:alabaster:6"},
    {color: 7, weight: 6, id: "environmentalmaterials:alabaster:7"},
    {color: 8, weight: 6, id: "environmentalmaterials:alabaster:8"},
    {color: 9, weight: 6, id: "environmentalmaterials:alabaster:9"},
    {color: 10, weight: 6, id: "environmentalmaterials:alabaster:10"},
    {color: 11, weight: 6, id: "environmentalmaterials:alabaster:11"},
    {color: 12, weight: 6, id: "environmentalmaterials:alabaster:12"},
    {color: 13, weight: 6, id: "environmentalmaterials:alabaster:13"},
    {color: 14, weight: 6, id: "environmentalmaterials:alabaster:14"},
    {color: 15, weight: 6, id: "environmentalmaterials:alabaster:15"},
    {color: 0, weight: 4, id: "quark:crystal:0"},
    {color: 14, weight: 4, id: "quark:crystal:1"},
    {color: 1, weight: 4, id: "quark:crystal:2"},
    {color: 4, weight: 4, id: "quark:crystal:3"},
    {color: 5, weight: 4, id: "quark:crystal:4"},
    {color: 9, weight: 4, id: "quark:crystal:5"},
    {color: 11, weight: 4, id: "quark:crystal:6"},
    {color: 10, weight: 4, id: "quark:crystal:7"},
    {color: 15, weight: 30, id: "environmentalmaterials:basalt"},
    {color: 7, weight: 20, id: "environmentalmaterials:hardened_stone"},
    {color: 4, weight: 30, id: "OD:stoneLimestone"},
    {color: 0, weight: 30, id: "OD:stoneMarble"},
    {color: 12, weight: 20, id: "chisel:brownstone"},
    {color: 3, weight: 8, id: "minecraft:ice"},
    {color: 3, weight: 8, id: "minecraft:packed_ice"},
    {color: 3, weight: 8, id: "immersivehempcraft:hemcraft_hardened"},
    {color: 12, weight: 15, id: "biomesoplenty:dirt"},
    {color: 13, weight: 20, id: "thebetweenlands:betweenstone"},
    {color: 13, weight: 5, id: "thebetweenlands:generic_stone"},
    {color: 13, weight: 15, id: "thebetweenlands:pitstone"},
    {color: 8, weight: 15, id: "thebetweenlands:limestone"},
    {color: 12, weight: 7, id: "thebetweenlands:mud"},
    {color: 12, weight: 7, id: "thebetweenlands:swamp_dirt"},
    {color: 13, weight: 7, id: "thebetweenlands:swamp_grass"},
    {color: 13, weight: 7, id: "thebetweenlands:slimy_dirt"},
    {color: 13, weight: 7, id: "thebetweenlands:slimy_grass"},
    {color: 0, weight: 7, id: "environmentaltech:mica"},
    {color: 13, weight: 15, id: "abyssalcraft:abyssalsand"},
    {color: 14, weight: 15, id: "abyssalcraft:dreadlandsdirt"}
];




val coalOres = oreDict["oreCoal"];
function idToStack(id as string) as IItemStack {
    if (id.startsWith("OD:")) {
        val oreName = id.substring(3);
        val entry = oreDict[oreName];
        if (!isNull(entry) && !entry.empty) {
            val items = entry.items; // 获取所有物品列表
            // 使用 Math.random() 随机选择一个索引
            var index = (Math.random() * items.length) as int;
            // return items[index];
            var stack = items[index];
            // 如果是通配符 32767，修正为 0（默认子类型）
            if (stack.damage == 32767) {
                stack = stack.withDamage(0);
            }
            return stack;
            //
        }
        return null;
    } else {
        return itemUtils.getItem(id);
    }
}
function buildMinerRecipe(
    recipeName as string,
    machineName as string,
    outputList as IData[],
    iteminput as IIngredient,
    processTime as int,
    energyPerTick as int
) {
    val placeholder = <minecraft:stone>.withTag({ench: [{lvl: 1 as short, id: 51 as short}], HideFlags: 1, display: {Lore: ["§e根据放入的虚空矿机来进行不同模式的采矿", "§7§m要是能拿到这个，也算你运气好"], Name: "§b虚空采掘"}});
    val builder = RecipeBuilder.newBuilder(recipeName, machineName, processTime);
    builder.addEnergyPerTickInput(energyPerTick);
    builder.addItemInput(iteminput).setChance(0.0);
    builder.addItemOutput(placeholder);
    
    // 预检查：加权随机选择，只存储 ID 字符串
    builder.addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val world = ctrl.world;
        val pos = ctrl.pos;
        val facing = ctrl.facing;
        val targetPos = ctrl.pos.up(3).getOffset(facing.opposite, 2);
        val blockState = world.getBlockState(targetPos);
        // 获取方块 ID 和 meta
        val blockId = blockState.block.definition.id;
        val meta = blockState.meta;
        // ---- 1. 动态权重（透镜逻辑暂时注释） ----
        var weightedList as IData[] = [];
        for entry in outputList {
            val color = entry.color as int;
            var weight = entry.weight as int;
            //================透镜判定================
            // 1.颜色透镜
            if (color>=0 && color<=15)&&(meta == color) {
                weight = weight * 50;
            // 2.水晶透镜
            }else if (blockId=="environmentaltech:laser_lens_crystal")&&(color==16){
                weight = weight * 50;
            // 3.原木透镜
            }else if (blockId=="divinerpg:mortum_log")&&(color==17){
                weight = weight * 50;
            // 4.树苗透镜
            }else if (blockId=="botania:pylon:1")&&(color==18){
                weight = weight * 50;
            // 5.树叶透镜
            }else if(blockId=="botania:pylon")&&(color==19){
                weight = weight * 50;
            // 6.鲜花透镜
            }else if(blockId=="botania:bifrostperm")&&(color==20){
                weight = weight * 50;
            // 7.食物透镜
            }else if(blockId=="minecraft:hay_block")&&(color==21){
                weight = weight * 50;
            // 8.种子透镜
            }else if(blockId=="contenttweaker:alchemical_crystal")&&(color==22){
                weight = weight * 50;
            // 9.植物透镜
            }else if(blockId=="minecraft:grass")&&(color==23){
                weight = weight * 50;
            }
            //================透镜判定================
            weightedList += {
                color: color,
                weight: weight,
                id: entry.id
            } as IData;
        }

        // ---- 2. 加权随机选择 ----
        var totalWeight = 0;
        for entry in weightedList {
            totalWeight += entry.weight as int;
        }
        if (totalWeight <= 0) {
            event.setFailed("没有可用的产出权重");
            return;
        }
        var rand = Math.random() * totalWeight;
        var selectedId = "";
        for entry in weightedList {
            rand -= entry.weight as int;
            if (rand <= 0) {
                selectedId = entry.id as string;
                break;
            }
        }
        if (selectedId == "") {
            event.setFailed("随机选择失败");
            return;
        }
        // ---- 3. 存储字符串 ID（不转换物品） ----
        var data = ctrl.customData;
        if (isNull(data)) data = {} as IData;
        // data = data + { "selectedId": selectedId };
        var oldmultiplier = (isNull(data.memberGet("outputMultiplier")) ? 0 : data.memberGet("outputMultiplier")) as int;
        var oldSpeed = (isNull(data.memberGet("Upgrade_Speed")) ? 0 : data.memberGet("Upgrade_Speed")) as int;
        var oldFortune = (isNull(data.memberGet("Upgrade_Fortune")) ? 0 : data.memberGet("Upgrade_Fortune")) as int;
        data = data + {
            "selectedId": selectedId,
            "lensMeta": meta,
            "lensBlock": blockId,
            "outputMultiplier": oldmultiplier,
            "Upgrade_Speed":oldSpeed,
            "Upgrade_Fortune":oldFortune,
        };
        ctrl.customData = data;
    });
    // builder.addFactoryStartHandler(function(event as FactoryRecipeStartEvent) {
    //     val ctrl = event.controller;
    //     val data = ctrl.customData;
    //     if (isNull(data)) return;
    //     val speedFactor = data.memberGet("SpeedFactor") as float;
    //     if (!isNull(speedFactor) && speedFactor < 1.0) {
    //         val modifier = RecipeModifierBuilder.create("modularmachinery:duration", "input", speedFactor, 1, false).build();
    //         event.factoryRecipeThread.addModifier("duration", modifier);  // 两个参数
    //     }
    // });
    // 修饰器：读取 ID 字符串，用 idToStack 转换为物品
    builder.addItemModifier(function(ctrl, oldItem) as IItemStack {
        val data = ctrl.customData;
        if (isNull(data)) return oldItem;
        val selectedId = data.memberGet("selectedId") as string;
        var outputMultiplier = data.memberGet("outputMultiplier") as int; // 获取自定义数据中的输出倍数
        if (isNull(selectedId)) return oldItem;
        val stack = idToStack(selectedId);
        // stack就是输出的物品
        if (isNull(stack)) {
            return oldItem;
        } else {
            if(outputMultiplier==0){
                outputMultiplier=1;
            }
            return stack*(outputMultiplier); // 可以根据需要调整数量
        }
    });
    builder.setMaxThreads(1); // 设置最大线程数为 1，确保线程安全
    builder.setThreadName("深度采掘核心");
    builder.build();
}

// ===== 调用构建三个配方 =====
buildMinerRecipe("ore_mining", MACHINE, oreMinerOutputs, <environmentaltech:void_ore_miner_cont_6>,75, 10000000);
buildMinerRecipe("botanic_mining", MACHINE, botanicMinerOutputs, <environmentaltech:void_botanic_miner_cont_6>,75, 10000000);
buildMinerRecipe("resource_mining", MACHINE, resourceMinerOutputs, <environmentaltech:void_res_miner_cont_6>,75, 10000000);

// 0白 1橙 2品红 3淡蓝 4黄 5黄绿 6粉 7灰 8淡灰 9青 10紫 11蓝 12棕 13绿 14红 15黑 16水晶
// 17原木 18树苗 19树叶 20花 21食物 22种子 23植物
val colorNames = [
    "白色", "橙色", "品红色", "淡蓝色", "黄色", "黄绿色", "粉色", "灰色",
    "淡灰色", "青色", "紫色", "蓝色", "棕色", "绿色", "红色", "黑色","水晶",
    "原木","树苗","树叶","鲜花","食物","种子","植物"
];
// ===================== GUI 显示 =====================
MMEvents.onControllerGUIRender(MACHINE, function(event as ControllerGUIRenderEvent) {
    val ctrl = event.controller;
    if (isNull(ctrl)) return;

    // ---- 从 customData 读取数据 ----
    val data = ctrl.customData;
    var lensMeta = -1;            // -1 表示无透镜
    var lensBlock = "";
    var outputMultiplier = 0;    // 默认倍率
    var Upgrade_Speed_Amount = 0;
    var Upgrade_Fortune_Amount = 0;

    if (!isNull(data)) {
        val metaVal = data.memberGet("lensMeta");
        if (!isNull(metaVal)) lensMeta = metaVal as int;

        val blockVal = data.memberGet("lensBlock");
        if (!isNull(blockVal)) lensBlock = blockVal as string;

        val multiVal = data.memberGet("outputMultiplier");
        if (!isNull(multiVal)) outputMultiplier = multiVal as int;

        val speedVal = data.memberGet("Upgrade_Speed");
        if (!isNull(speedVal)) Upgrade_Speed_Amount = speedVal as int;

        val fortuneVal = data.memberGet("Upgrade_Fortune");
        if (!isNull(fortuneVal)) Upgrade_Fortune_Amount = fortuneVal as int;
    }

    // ---- 判断透镜类型并获取颜色名称 ----
    var colorName = "§c未检测到透镜";
    var hasLens = false;

    if (lensBlock == "environmentaltech:laser_lens_colored") {
        // 标准颜色透镜 (meta 0~15)
        if (lensMeta >= 0 && lensMeta <= 15) {
            colorName = colorNames[lensMeta];   // 使用 colorNames 数组
            hasLens = true;
        } else {
            colorName = "§c未知颜色 (meta=" + lensMeta + ")";
        }
    } else if (lensBlock == "environmentaltech:laser_lens_crystal") {
        colorName = "水晶";
        hasLens = true;
    } else if( lensBlock == "divinerpg:mortum_log") {
        colorName = "原木";
        hasLens = true;
    } else if( lensBlock == "botania:pylon")&&(lensMeta == 1) {
        colorName = "树苗";
        hasLens = true;
    } else if( lensBlock == "botania:pylon")&&(lensMeta == 0) {
        colorName = "树叶";
        hasLens = true;
    } else if( lensBlock == "botania:bifrostperm") {
        colorName = "鲜花";
        hasLens = true;
    } else if (lensBlock == "minecraft:hay_block") {
        colorName = "食物";
        hasLens = true;
    } else if (lensBlock == "contenttweaker:alchemical_crystal") {
        colorName = "种子";
        hasLens = true;
    } else if (lensBlock == "minecraft:grass") {
        colorName = "植物";
        hasLens = true;
    } else {
        colorName = "§c未检测到有效透镜";
    }
    // ---- 构建显示信息 ----
    var extra = event.extraInfo;
    if (isNull(extra)) extra = [] as string[];

    extra += "§3=======/§9深度虚空采掘机§3/=======";
    extra += "§a当前透镜：§f§l" + colorName;
    // 如果检测到有效透镜，显示加成提示
    if (hasLens) {
        extra += "§a对应颜色水晶/矿石权重 §b× 50";
    } else {
        extra += "§a未放置有效透镜，无额外权重加成";
    }
    // extra += "§a速度升级数量：§b" + Upgrade_Speed_Amount + "/16";
    extra += "§a时运升级数量：§b" + Upgrade_Fortune_Amount + "/64";
    if(outputMultiplier==0){
        outputMultiplier=1;
    }
    // var speedFactorDisplay = 1.0;
    // if (!isNull(data)) {
    //     val sf = data.memberGet("SpeedFactor") as float;
    //     if (!isNull(sf)) speedFactorDisplay = sf;
    // }
    // extra += "§a当前速度：§b" + (speedFactorDisplay * 100) + "%";
    extra += "§a当前产出倍率：§b" + (outputMultiplier) + " x";
    event.extraInfo = extra;
});
// ===================== GUI 显示 =====================

val fortuneUpgradeRecipe = RecipeBuilder.newBuilder("upgrade_for_deep_miner_fortune", MACHINE, 1);
fortuneUpgradeRecipe
    .addItemInput(<environmentaltech:modifier_luck>)   // 消耗时运升级物品
    .addPreCheckHandler(function(event as RecipeCheckEvent) {
        val ctrl = event.controller;
        val data = ctrl.customData;
        if (isNull(data)) {
            // 如果没有 customData，则升级数为 0，允许执行
            return;
        }
        val fortune = data.memberGet("Upgrade_Fortune") as int;
        if (isNull(fortune)) {
            // 没有该键，默认为 0
            return;
        }
        if (fortune >= 64) {
            event.setFailed("§c时运升级已满！");
        }
    })
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        var data = ctrl.customData;
        if (isNull(data)) {
            data = {} as IData;
        }
        // 读取当前时运升级数，不存在则默认为 0
        var currentFortune = (isNull(data.memberGet("Upgrade_Fortune")) ? 0 : data.memberGet("Upgrade_Fortune")) as int;
        var currentMultiplier = (isNull(data.memberGet("outputMultiplier")) ? 0 : data.memberGet("outputMultiplier")) as int;
        // 增加 1
        val newFortune = currentFortune + 1;
        val newMultiplier = currentMultiplier + 2;
        // 合并更新数据
        data = data + { "Upgrade_Fortune": newFortune };
        data = data + { "outputMultiplier": newMultiplier};
        
        ctrl.customData = data;
    })
    .addRecipeTooltip("§a消耗一个§6幸运强化部件§a", "增加 §61§a 级时运升级", "最大 §664§a 级")
    .setThreadName("升级核心")   // 可选，指定线程名
    .build();
// val speedUpgradeRecipe = RecipeBuilder.newBuilder("upgrade_for_deep_miner_speed", MACHINE, 1);
// speedUpgradeRecipe
//     .addItemInput(<environmentaltech:modifier_speed>)
//     .addPreCheckHandler(function(event as RecipeCheckEvent) {
//         val ctrl = event.controller;
//         val data = ctrl.customData;
//         if (isNull(data)) return;
//         val speed = data.memberGet("Upgrade_Speed") as int;
//         if (!isNull(speed) && speed >= 16) {
//             event.setFailed("§c速度升级已满！");
//         }
//     })
//     .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
//         val ctrl = event.controller;
//         var data = ctrl.customData;
//         if (isNull(data)) data = {} as IData;

//         var currentSpeed = (isNull(data.memberGet("Upgrade_Speed")) ? 0 : data.memberGet("Upgrade_Speed")) as int;
//         val newSpeed = currentSpeed + 1;

//         // 计算新速度因子：使用 CTUtils 的 Math.pow
        
//         val perLevelFactor = pow(0.05, 1.0 / 16.0) as float;
//         var currentFactor = (isNull(data.memberGet("SpeedFactor")) ? 1.0 : data.memberGet("SpeedFactor")) as float;
//         val newFactor = currentFactor * perLevelFactor;

//         data = data + {
//             "Upgrade_Speed": newSpeed,
//             "SpeedFactor": newFactor
//         };
//         ctrl.customData = data;
//     })
//     .addRecipeTooltip("§a消耗一个§6速度升级模块§a", "增加 §61§a 级速度升级", "最大 §616§a 级")
//     .setThreadName("升级核心")
//     .build();
<divinerpg:mortum_log>.addTooltip(format.gold("特殊深度虚空采掘透镜：原木"));
<botania:pylon:1>.addTooltip(format.gold("特殊深度虚空采掘透镜：树苗"));
<botania:pylon>.addTooltip(format.gold("特殊深度虚空采掘透镜：树叶"));
<botania:bifrostperm>.addTooltip(format.gold("特殊深度虚空采掘透镜：鲜花"));
<minecraft:hay_block>.addTooltip(format.gold("特殊深度虚空采掘透镜：食物"));
<contenttweaker:alchemical_crystal>.addTooltip(format.gold("特殊深度虚空采掘透镜：种子"));
<minecraft:grass>.addTooltip(format.gold("特殊深度虚空采掘透镜：植物"));