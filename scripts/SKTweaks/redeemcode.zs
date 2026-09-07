#loader crafttweaker reloadable

import mods.zenutils.command.ZenCommand;
import mods.zenutils.command.CommandUtils;
import mods.zenutils.command.IGetTabCompletion;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;

// 你猜我为什么写这个
val validCodes as string[] = [
    "我不想努力了",
    "aeddddd是祝",
    "来点轮椅发电",
    "这是什么",
    "群友手办",
    "流体清理",
    "增进友谊",
    "酷炫方块",
    "肉丸人的真面目"
];

val codeRewards as IItemStack[][] = [
    [<minecraft:white_shulker_box>.withTag({BlockEntityTag: {Items: [{Slot: 13 as byte, id: "minecraft:paper", Count: 1, Damage: 0 as short, tag: {display: {Name: "§b哈哈哈哈哈哈哈被骗了吧"}}}]}, HideFlags: 32, display: {Lore: ["§d虚拟并行卡（等级 7）§f x64", "§7中枢 ME 接口  x64", "§7寰宇支配之剑  x1"]}})*1],
    [<mmceaddition:machine_data>.withTag({machine: "modularmachinery:seared_caster", count: 1024}) * 1],
    [<mmceaddition:machine_data>.withTag({machine: "modularmachinery:solar_array", count: 1, display: {Lore: ["§7机器: §6神话太阳能阵列", "§7内部存储数量: §e2,147,483,647", "§8放入对应机器的虚拟并行仓以提供并行度"]}, HideFlags: 32})*1],
    [<thaumicaugmentation:rift_seed>.withTag({riftSize: 2000, grown: 1 as byte, display: {Name: "§4这是什么我该怎么弄掉它", Lore: ["§8§l不要使用这个......"]}, HideFlags: 32})*1],
    [<draconicevolution:mob_soul> * 1],
    [<cyclicmagic:ender_water>.withTag({Unbreakable: 1 as byte, display: {Name: "§b反物质蒸发器", Lore: ["§l§6不毁"]}, HideFlags: 4}) * 1],
    [<thermalexpansion:florb>.withTag({Fluid: "liquid_fertilizer", display: {Lore: ["§d右键丢出"], Name: "§f流体球 （巧克力）§8§m（确信）"}}) * 64],
    [<appliedenergistics2:facade>.withTag({item: "avaritia:block_resource", damage: 1, display: {Name: "§d无尽块 - 1/6"}}) * 6],
    [<minecraft:skull:3>.withTag({SkullOwner: {Name: "sainagh", Id: "493f29bb-b31b-39fa-b972-fec5d901113a"}}) * 1,<extrabotany:cosmetic:9>*1]
];

// ---------- 使用列表存储已使用记录 ----------
global usedCodes as [string] = [];

val redeemCommand as ZenCommand = ZenCommand.create("SKT_redeemcode");

redeemCommand.getCommandUsage = function(sender) {
    return "commands.redeem.usage";
};

redeemCommand.requiredPermissionLevel = 0;

redeemCommand.execute = function(command, server, sender, args) {
    val player = CommandUtils.getCommandSenderAsPlayer(sender);
    if (isNull(player)) {
        return;
    }

    if (args.length != 1) {
        player.sendMessage("§c用法：/SKT_redeemcode <兑换码>");
        return;
    }

    val code = args[0];
    val playerUUID = player.uuid;

    // 1. 检查兑换码是否有效
    var codeIndex = -1;
    for i in 0 to validCodes.length  {
        if (validCodes[i] == code) {
            codeIndex = i;
            break;
        }
    }
    if (codeIndex == -1) {
        player.sendMessage("§c无效的兑换码！");
        return;
    }

    // 2. 检查是否已使用
    val usedKey = playerUUID + ":" + code;
    var alreadyUsed = false;
    for entry in usedCodes {
        if (entry == usedKey) {
            alreadyUsed = true;
            break;
        }
    }
    if (alreadyUsed) {
        player.sendMessage("§c你已经使用过该兑换码！");
        return;
    }

    // 3. 发放奖励
    val rewards = codeRewards[codeIndex];
    if (!isNull(rewards)) {
        for item in rewards {
            player.give(item);
        }
        // 使用 .add() 方法（不重新赋值字段）
        usedCodes.add(usedKey);
        player.sendMessage("§a兑换成功！获得奖励物品。");
    } else {
        player.sendMessage("§c该兑换码暂无奖励，请联系管理员。");
    }
};

redeemCommand.register();