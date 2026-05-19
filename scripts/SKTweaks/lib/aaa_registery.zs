// #loader crafttweaker reloadable
// #loader contenttweaker
// #priority 10000
// import mods.contenttweaker.VanillaFactory;
// import mods.contenttweaker.Item;
// import mods.contenttweaker.Fluid;
// import mods.contenttweaker.Color;
// import mods.contenttweaker.Block;

// function Custom_Item_Register_SK(
//     itemName as string,                       // 物品ID (必填)
//     maxStackSize as int = 64,                 // 最大堆叠数 默认64
//     rarity as string = "common",              // 稀有度 默认common
//     smeltingExperience as float = 0.0,        // 熔炉经验 默认0
//     rightClick as function = null,            // 右键行为 默认无
//     toolClass as string = "",                 // 工具类型 默认无
//     toolLevel as int = 0,                     // 挖掘等级 默认0
//     beaconPayment as bool = false             // 信标支付 默认false
// ) as void {
    
//     // 创建物品
//     var customItem as Item = VanillaFactory.createItem(itemName);
    
//     // 设置基本属性
//     customItem.maxStackSize = maxStackSize;
//     customItem.rarity = rarity;
//     customItem.smeltingExperience = smeltingExperience;
//     customItem.beaconPayment = beaconPayment;
    
//     // 设置工具属性（只有当 toolClass 不为空时才设置）
//     if (toolClass != "") {
//         customItem.toolClass = toolClass;
//         customItem.toolLevel = toolLevel;
//     }
    
//     // 绑定右键功能（只有当 rightClick 不为 null 时才设置）
//     if (rightClick != null) {
//         customItem.itemRightClick = rightClick;
//     }
    
//     // 完成注册
//     customItem.register();
// }
// function Custom_Fluid_Register_SK(
//     fluidName as string,                          // 流体ID（必填）
//     colorHex as string = "FFFFFF",                // 16进制颜色 默认白色
//     material as IMaterialDefinition = <blockmaterial:water>, // 流体材质 默认水
//     temperature as int = 300,                     // 温度 默认300（室温）
//     density as int = 1000,                        // 密度 默认1000
//     viscosity as int = 1000,                      // 粘稠度 默认1000
//     luminosity as int = 0,                        // 亮度 默认0
//     isGaseous as bool = false,                    // 是否为气体 默认否
//     colorize as bool = false,                     // 是否颜色叠加 默认否
//     stillLocation as string = "",                 // 静止纹理路径 默认空（自动）
//     flowingLocation as string = ""                // 流动纹理路径 默认空（自动）
// ) as void {
    
//     // 创建流体并设置颜色
//     var customFluid = VanillaFactory.createFluid(fluidName, Color.fromHex(colorHex));
    
//     // 设置基本属性
//     customFluid.material = material;
//     customFluid.temperature = temperature;
//     customFluid.density = density;
//     customFluid.viscosity = viscosity;
//     customFluid.luminosity = luminosity;
//     customFluid.gaseous = isGaseous;
//     customFluid.colorize = colorize;
    
//     // 设置纹理（仅当提供了路径时）
//     if (stillLocation != "") {
//         customFluid.stillLocation = stillLocation;
//     }
//     if (flowingLocation != "") {
//         customFluid.flowingLocation = flowingLocation;
//     }
    
//     // 完成注册
//     customFluid.register();
// }
// function Custom_Block_Register_SK(
//     blockName as string,                        // 方块ID（必填）
//     material as IMaterialDefinition = <blockmaterial:rock>, // 方块材质 默认石头
//     blockHardness as float = 1.5,               // 硬度 默认1.5（石头）
//     blockResistance as float = 1.0,             // 爆炸抗性 默认1.0
//     toolClass as string = "",                   // 采集工具 默认无
//     toolLevel as int = 0,                       // 挖掘等级 默认0
//     lightValue as float = 0.0,                  // 亮度 默认0
//     lightOpacity as int = 255,                  // 不透明度 默认255（完全不透光）
//     translucent as bool = false,                // 是否透光 默认否
//     fullBlock as bool = true,                   // 是否完整方块 默认是
//     blockSoundType as ISoundType = <soundtype:stone>, // 声音类型 默认石头
//     canProvidePower as bool = false,            // 是否发出红石信号 默认否
//     tickRandomly as bool = false,               // 是否接受随机刻 默认否
//     causesSuffocation as bool = true,           // 是否导致窒息 默认是
//     slipperiness as float = 0.6,                // 光滑度 默认0.6
//     canSpawnMob as bool = true,                 // 怪物能否生成 默认能
//     isUnbreakable as bool = false               // 是否不可破坏 默认否
// ) as void {

//     // 创建方块
//     var block as Block = VanillaFactory.createBlock(blockName, material);

//     // 基础属性
//     block.blockHardness = blockHardness;
//     block.blockResistance = blockResistance;
//     block.blockSoundType = blockSoundType;

//     // 如果不可破坏，强制设置基岩级硬度
//     if (isUnbreakable) {
//         block.blockHardness = -1.0;
//         block.blockResistance = 6000000.0;
//     }

//     // 工具属性（仅当指定了工具类型时才设置）
//     if (toolClass != "") {
//         block.toolClass = toolClass;
//         block.toolLevel = toolLevel;
//     }

//     // 光照相关
//     block.lightValue = lightValue;
//     block.lightOpacity = lightOpacity;
//     block.translucent = translucent;
//     block.fullBlock = fullBlock;

//     // 红石相关
//     block.canProvidePower = canProvidePower;

//     // 其他属性
//     block.tickRandomly = tickRandomly;
//     block.causesSuffocation = causesSuffocation;
//     block.slipperiness = slipperiness;
//     block.canSpawnMob = canSpawnMob;

//     // 完成注册
//     block.register();
// }