#loader crafttweaker reloadable

import crafttweaker.event.PlayerInteractEntityEvent;
import crafttweaker.entity.IEntity;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;

import native.net.minecraft.entity.Entity;
import native.twilightforest.capabilities.CapabilityList;
import native.twilightforest.capabilities.shield.IShieldCapability;

val SHIELD_BREAKER = <contenttweaker:shield_breaker>;

events.onPlayerInteractEntity(function(event as PlayerInteractEntityEvent) {
    if (event.world.remote) return;
    if (event.hand != "MAIN_HAND") return;

    val player = event.player;
    val target = event.target;
    if (isNull(player) || isNull(target)) return;
    val heldItem = player.currentItem;
    if (isNull(heldItem) || !heldItem.matches(SHIELD_BREAKER)) return;

    if (clearEntityShields(target, player)) {
        if (!player.creative) {
            heldItem.mutable().shrink(1);
        }
    }
});

function clearEntityShields(target as IEntity, player as IPlayer) as bool {
    val nativeEntity = target.native as Entity;
    if (isNull(nativeEntity)) {
        player.sendChat("§c无法获取实体。");
        return false;
    }

    val shield = nativeEntity.getCapability(CapabilityList.SHIELDS, null) as IShieldCapability;
    if (isNull(shield)) {
        player.sendChat("§e该实体没有护盾能力。");
        return false;
    }

    // 关键：检查护盾值是否 > 0
    if (shield.shieldsLeft() <= 0) {
        player.sendChat("§e该实体没有护盾。");
        return false;
    }

    // 清除两种护盾
    shield.setShields(0, true);
    shield.setShields(0, false);

    player.sendChat("§a已清除实体护盾！");
    return true;
}