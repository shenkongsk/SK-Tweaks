#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Commands;
import crafttweaker.player.IPlayer;

// 辅助函数：生成单个物品的 NBT 片段，支持 Damage 标签
function buildItemNBT(id as string, nbtData as string, count as int, damage as int) as string {
    if (id == "") return "{}";
    var item = "{id:\"" + id + "\",Count:" + count + "b";
    if (damage != 0) {
        item += ",Damage:" + damage;
    }
    if (nbtData != "" && nbtData != "{}") {
        item += ",tag:" + nbtData;
    }
    item += "}";
    return item;
}

// 批量创建盔甲架召唤石的核心函数（已增加 damage 参数）
function createArmorStandSummonStone(
    id as string,
    headRot as float[],
    bodyRot as float[],
    leftArmRot as float[],
    rightArmRot as float[],
    leftLegRot as float[],
    rightLegRot as float[],
    yawRot as float,
    pitchRot as float,
    isSmall as bool,
    isInvisible as bool,
    hasBasePlate as bool,
    showArms as bool,
    isGlowing as bool,
    isNameVisible as bool,
    customName as string,
    mainHandId as string, mainHandNbt as string, mainHandCount as int, mainHandDamage as int,
    offHandId as string, offHandNbt as string, offHandCount as int, offHandDamage as int,
    headId as string, headNbt as string, headCount as int, headDamage as int,
    chestId as string, chestNbt as string, chestCount as int, chestDamage as int,
    legsId as string, legsNbt as string, legsCount as int, legsDamage as int,
    feetId as string, feetNbt as string, feetCount as int, feetDamage as int
) as void {
    
    // 直接构建 NBT 字符串
    var nbt = "{";
    
    if (isSmall) nbt += "Small:1,";
    if (isInvisible) nbt += "Invisible:1,";
    if (!hasBasePlate) nbt += "NoBasePlate:1,";
    if (showArms) nbt += "ShowArms:1,";
    if (isGlowing) nbt += "Glowing:1,";
    if (isNameVisible && customName != "") nbt += "CustomNameVisible:1,";
    if (customName != "") nbt += "CustomName:\"" + customName + "\",";
    
    // Pose（手动拼接）
    var poseStr = "";
    if (!isNull(headRot) && headRot.length >= 3)
        poseStr += "Head:[" + headRot[0] + "f," + headRot[1] + "f," + headRot[2] + "f],";
    if (!isNull(bodyRot) && bodyRot.length >= 3)
        poseStr += "Body:[" + bodyRot[0] + "f," + bodyRot[1] + "f," + bodyRot[2] + "f],";
    if (!isNull(leftArmRot) && leftArmRot.length >= 3)
        poseStr += "LeftArm:[" + leftArmRot[0] + "f," + leftArmRot[1] + "f," + leftArmRot[2] + "f],";
    if (!isNull(rightArmRot) && rightArmRot.length >= 3)
        poseStr += "RightArm:[" + rightArmRot[0] + "f," + rightArmRot[1] + "f," + rightArmRot[2] + "f],";
    if (!isNull(leftLegRot) && leftLegRot.length >= 3)
        poseStr += "LeftLeg:[" + leftLegRot[0] + "f," + leftLegRot[1] + "f," + leftLegRot[2] + "f],";
    if (!isNull(rightLegRot) && rightLegRot.length >= 3)
        poseStr += "RightLeg:[" + rightLegRot[0] + "f," + rightLegRot[1] + "f," + rightLegRot[2] + "f],";
    
    if (poseStr != "") {
        // 去掉末尾逗号
        if (poseStr.endsWith(",")) poseStr = poseStr.substring(0, poseStr.length - 1);
        nbt += "Pose:{" + poseStr + "},";
    }
    
    nbt += "Rotation:[" + yawRot + "f," + pitchRot + "f],";
    
    var mainHandItem = buildItemNBT(mainHandId, mainHandNbt, mainHandCount, mainHandDamage);
    var offHandItem = buildItemNBT(offHandId, offHandNbt, offHandCount, offHandDamage);
    nbt += "HandItems:[" + mainHandItem + "," + offHandItem + "],";
    
    var feetItem = buildItemNBT(feetId, feetNbt, feetCount, feetDamage);
    var legsItem = buildItemNBT(legsId, legsNbt, legsCount, legsDamage);
    var chestItem = buildItemNBT(chestId, chestNbt, chestCount, chestDamage);
    var headItem = buildItemNBT(headId, headNbt, headCount, headDamage);
    nbt += "ArmorItems:[" + feetItem + "," + legsItem + "," + chestItem + "," + headItem + "],";

    if (nbt.endsWith(",")) nbt = nbt.substring(0, nbt.length - 1);
    nbt += "}";
    
    // 调试：打印生成的 NBT
    print("Generated NBT for " + id + ": " + nbt);
    
    var stone = VanillaFactory.createItem(id);
    stone.maxStackSize = 1;
    stone.textureLocation = mods.contenttweaker.ResourceLocation.create("contenttweaker:items/alchemical_spark_callstone_single");
    stone.itemRightClick = function(stack, world, player, hand) {
        if (world.remote) return "FAIL";
        var pos = player.position;
        var x = pos.x as int;
        var y = (pos.y + 1) as int;
        var z = pos.z as int;
        var command = "summon minecraft:armor_stand " + x + " " + y + " " + z + " " + nbt;
        print("Executing command: " + command);
        Commands.call(command, player, world, true, true);
        if (!player.creative) stack.shrink(1);
        return "SUCCESS";
    };
    stone.register();
    print("已注册召唤石: " + id);
}
// createArmorStandSummonStone(
//     "summon_iron_guard",
//     null, null, null, null, null, null,
//     0.0, 0.0,
//     false, false, true, true, false, true,
//     "SKtest",
//     "minecraft:iron_sword", "", 1, 0,
//     "", "", 0, 0,
//     "minecraft:iron_helmet", "", 1, 0,
//     "minecraft:iron_chestplate", "", 1, 0,
//     "minecraft:iron_leggings", "", 1, 0,
//     "minecraft:iron_boots", "", 1, 0
// );
// shigure_kirara--卡尚--空白维度方块
createArmorStandSummonStone(
    "summon_shigure_kirara",
    null, null, [-90,30,-15], [-90,0,0], null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "shigure_kirara",
    "thaumicaugmentation:impulse_cannon", "", 1, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:shigure_kirara}", 1, 3,
    "thaumictinkerer:kami_chest", "{ench:[{id:0s,lvl:15s}]}", 1, 0,
    "thaumictinkerer:kami_legs", "{ench:[{id:0s,lvl:15s}]}", 1, 0,
    "thaumictinkerer:kami_boots", "{ench:[{id:0s,lvl:15s}]}", 1, 0
);
// IridumSky--树龙界--碳化原木
createArmorStandSummonStone(
    "summon_IridumSky",
    [-30,0,0], null, null, [-45,-30,0], null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "IridumSky",
    "unlimitedchiselworks:chisel_stonebrick_abyssalcraft_darkstone_brick_0", "", 1, 7,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:IridumSky}", 1, 3,
    "extrabotany:combatmaidchest", "", 1, 0,
    "extrabotany:combatmaidlegs", "", 1, 0,
    "extrabotany:combatmaidboots", "", 1, 0
);
// Dinnerbond--叁壹界--奥金草方块
createArmorStandSummonStone(
    "summon_Dinnerbond_1",
    [-30,0,0], null, null, [-90,30,30], null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "Dinnerbond",
    "avaritia:infinity_sword", "", 1, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:Dinnerbond}", 1, 3,
    "immersiveengineering:faraday_suit_chest", "", 1, 0,
    "immersiveengineering:faraday_suit_legs", "", 1, 0,
    "immersiveengineering:faraday_suit_feet", "", 1, 0
);
createArmorStandSummonStone(
    "summon_Dinnerbond_2",
    [-30,0,0], null, null, [-90,30,30], null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "",
    "", "", 0, 0,
    "", "", 0, 0,
    "thaumcraft:goggles", "", 1, 0,
    "", "", 0, 0,
    "", "", 0, 0,
    "", "", 0, 0
);
// EsteyNum--惧惮界--南瓜头
createArmorStandSummonStone(
    "summon_EsteyNum",
    null, null, null, null, null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "EsteyNum",
    "", "", 0, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:EsteyNum}", 1, 3,
    "minecraft:golden_chestplate", "{ench:[{id:0s,lvl:15s}]}", 1, 0,
    "minecraft:golden_leggings", "{ench:[{id:0s,lvl:15s}]}", 1, 0,
    "minecraft:golden_boots", "{ench:[{id:0s,lvl:15s}]}", 1, 0
);
// Pyromaniacal--梦魇世界--美梦草方块
createArmorStandSummonStone(
    "summon_Pyromaniacal",
    null, null, null, null, null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "Pyromaniacal",
    "tombstone:grave_key", "{tombPosX: 100, tombPosY: 100, tombPosZ: 100, tombPosD: 1}", 1, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:Pyromaniacal}", 1, 3,
    "", "", 0, 0,
    "", "", 0, 0,
    "", "", 0, 0
);
// Flxiowers_--比邻星带--未定义物体
createArmorStandSummonStone(
    "summon_Flxiowers_",
    null, null, null, null, null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "Flxiowers_",
    "contenttweaker:defined_ingot", "", 1, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:Flxiowers_}", 1, 3,
    "thaumadditions:mithminite_robe", "{ench:[{id:0s,lvl:15s}]}", 1, 0,
    "thaumadditions:mithminite_belt", "{ench:[{id:0s,lvl:15s}]}", 1, 0,
    "thaumadditions:mithminite_boots", "{ench:[{id:0s,lvl:15s}]}", 1, 0
);
// ping_su--光精界--鄙夷方砖
createArmorStandSummonStone(
    "summon_ping_su",
    null, null, null, null, null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "ping_su",
    "", "", 0, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:ping_su}", 1, 3,
    "contenttweaker:sacrifice_metal_chest", "{ench:[{lvl:1s,id:70s},{lvl:15s,id:34s},{lvl:20s,id:7s}]}", 1, 0,
    "contenttweaker:sacrifice_metal_legs", "{ench:[{lvl:1s,id:70s},{lvl:15s,id:34s},{lvl:20s,id:7s}]}", 1, 0,
    "contenttweaker:sacrifice_metal_feet", "{ench:[{lvl:1s,id:70s},{lvl:15s,id:34s},{lvl:20s,id:7s}]}", 1, 0
);
// themyself--塞德娜--蓝水晶方块
createArmorStandSummonStone(
    "summon_themyself",
    null, null, [300,0,45], [300,0,45], null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "themyself",
    "packagedauto:distributor", "", 1, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:themyself}", 1, 3,
    "redstonearsenal:armor.plate_flux", "{ench:[{id:7,lvl:200}],Energy:800000}", 1, 0,
    "redstonearsenal:armor.legs_flux", "{ench:[{id:7,lvl:200}],Energy:800000}", 1, 0,
    "redstonearsenal:armor.boots_flux", "{ench:[{id:7,lvl:200}],Energy:800000}", 1, 0
);
// x_zhangjun--月球--月面土
createArmorStandSummonStone(
    "summon_x_zhangjun",
    null, null, null, null, null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "x_zhangjun",
    "extrabotany:firstfractal", "{soulbindUUID:\"38ced497-0f46-4e4e-aba0-e1c26604535a\",ench:[{id:16s,lvl:100s}]}", 1, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:x_zhangjun}", 1, 3,
    "ebwizardry:battlemage_chestplate_earth", "{ench:[{id:34s,lvl:10s},{id:7s,lvl:10s}]}", 1, 0,
    "ebwizardry:battlemage_leggings_earth", "{ench:[{id:34s,lvl:10s},{id:7s,lvl:10s}]}", 1, 0,
    "ebwizardry:battlemage_boots_earth", "{ench:[{id:34s,lvl:10s},{id:7s,lvl:10s}]}", 1, 0
);
// Dogegg_Flower--末地--末地石
createArmorStandSummonStone(
    "summon_Dogegg_Flower",
    null, null, [180,-90,45], [180,90,-45], null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "Dogegg_Flower",
    "", "", 0, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:Dogegg_Flower}", 1, 3,
    "extrabotany:combatmaidchest", "", 1, 0,
    "extrabotany:combatmaidlegs", "", 1, 0,
    "extrabotany:combatmaidboots", "", 1, 0
);
// SnodVII--秘金块--秘界
createArmorStandSummonStone(
    "summon_SnodVII",
    null, null, null, [180,180,300], null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "SnodVII",
    "twilightforest:giant_sword", "", 1, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:SnodVII}", 1, 3,
    "divinerpg:vemos_chestplate", "", 1, 0,
    "divinerpg:vemos_leggings", "", 1, 0,
    "divinerpg:vemos_boots", "", 1, 0
);
// Fading_Sky--极光方块--暮色森林
createArmorStandSummonStone(
    "summon_Fading_Sky",
    null, null, null, null, null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "Fading_Sky",
    "twilightforest:glass_sword", "", 1, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:Fading_Sky}", 1, 3,
    "thaumcraft:crimson_robe_chest", "", 1, 0,
    "thaumcraft:crimson_robe_legs", "", 1, 0,
    "thaumcraft:crimson_boots", "", 1, 0
);
// adrin58--福鲁伊克斯块--地盘界
createArmorStandSummonStone(
    "summon_adrin58",
    null, null, null, null, null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "adrin58",
    "", "", 0, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:adrin58}", 1, 3,
    "enderio:item_stellar_alloy_chestplate", "", 1, 0,
    "enderio:item_stellar_alloy_leggings", "", 1, 0,
    "enderio:item_stellar_alloy_boots", "", 1, 0
);
// Puzitsa--草方块--主世界
createArmorStandSummonStone(
    "summon_Puzitsa",
    null, null, null, null, null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "Puzitsa",
    "aoa3:baron_sword", "", 1, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:Puzitsa}", 1, 3,
    "enderio:item_stellar_alloy_chestplate", "", 1, 0,
    "enderio:item_stellar_alloy_leggings", "", 1, 0,
    "enderio:item_stellar_alloy_boots", "", 1, 0
);
// MagicKyy--现实之壁--维度门
createArmorStandSummonStone(
    "summon_MagicKyy",
    null, null, null, null, null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "MagicKyy",
    "dimdoors:rift_configuration_tool", "", 1, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:MagicKyy}", 1, 3,
    "extrabotany:cosmeticmaidchest", "", 1, 0,
    "extrabotany:cosmeticmaidlegs", "", 1, 0,
    "extrabotany:cosmeticmaidboots", "", 1, 0
);
// GreatHeaven--地狱岩--下界
createArmorStandSummonStone(
    "summon_GreatHeaven",
    null, null, null, null, null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "GreatHeaven",
    "extrabotany:firstfractal", "{soulbindUUID:\"326f6a2d-40bd-488c-9646-7a2a1a976da4\",ench:[{id:16s,lvl:100s}]}", 1, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:GreatHeaven}", 1, 3,
    "draconicevolution:draconic_chest", "{Energy: 16000000}", 1, 0,
    "draconicevolution:draconic_legs", "{Energy: 16000000}", 1, 0,
    "draconicevolution:draconic_boots", "{Energy: 16000000}", 1, 0
);
// whizzball1--淤泥草方块--地方界
createArmorStandSummonStone(
    "summon_whizzball1",
    null, null, null, null, null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "whizzball1",
    "", "", 0, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:whizzball1}", 1, 3,
    "", "", 0, 0,
    "", "", 0, 0,
    "", "", 0, 0
);
// xplodous_--黑暗圆石--黑暗领域
createArmorStandSummonStone(
    "summon_xplodous_",
    null, null, null, null, null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "xplodous_",
    "xreliquary:magicbane", "", 1, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:xplodous_}", 1, 3,
    "simplyjetpacks:itemjetpack", "{Energy:50000000,JetpackParticle:0,ench:[{id:7,lvl:200}]}", 1, 24,
    "redstonearsenal:armor.legs_flux", "{ench:[{id:7,lvl:200}],Energy:800000}", 1, 0,
    "redstonearsenal:armor.boots_flux", "{ench:[{id:7,lvl:200}],Energy:800000}", 1, 0
);
// origami10004--八重压缩圆石--漆黑世界
createArmorStandSummonStone(
    "summon_origami10004",
    null, null, null, null, null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "origami10004",
    "xreliquary:magicbane", "", 1, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:origami10004}", 1, 3,
    "draconicevolution:draconic_chest", "{Energy: 16000000}", 1, 0,
    "draconicevolution:draconic_legs", "{Energy: 16000000}", 1, 0,
    "draconicevolution:draconic_boots", "{Energy: 16000000}", 1, 0
);
// NerdySpider--秘境--神秘草方块
createArmorStandSummonStone(
    "summon_NerdySpider_1",
    [13,35,0], null, null, [-60,0,60], null, null,
    0.0, 0.0,
    false, false, true, true, false, false,
    "",
    "", "", 0, 0,
    "", "", 0, 0,
    "minecraft:skull", "{SkullOwner:NerdySpider}", 1, 3,
    "", "", 0, 0,
    "", "", 0, 0,
    "", "", 0, 0
);
createArmorStandSummonStone(
    "summon_NerdySpider_2",
    [13,35,0], null, null, [-60,0,60], null, null,
    0.0, 0.0,
    false, false, true, true, false, true,
    "NerdySpider",
    "superfactorymanager:labelgun", "", 1, 0,
    "", "", 0, 0,
    "twilightforest:trophy", "", 1, 8,
    "thaumicaugmentation:thaumium_robes_chestplate", "{color: 11483206}", 1, 0,
    "thaumcraft:void_robe_legs", "{color:11481910}", 1, 0,
    "thaumicaugmentation:void_boots", "{color: 9975385}", 1, 0
);