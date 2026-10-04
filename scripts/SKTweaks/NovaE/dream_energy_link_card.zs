#reloadable
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.MachineController;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.ActiveMachineRecipe;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.MachineStructureFormedEvent;

import crafttweaker.util.Math;
import crafttweaker.data.IData;
import crafttweaker.world.IWorld;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.event.PlayerInteractBlockEvent;

val COORD_ITEM = <contenttweaker:dream_energy_link_card>;
<contenttweaker:dream_energy_link_card>.addTooltip("§eShift + 右键 §b梦之§a能量核心控制器§9以记录坐标");
<contenttweaker:dream_energy_link_card>.addTooltip("§e右键 §9某些特殊的MMCE控制器写入已保存的坐标");

events.onPlayerRightClickBlock(function(event as PlayerInteractBlockEvent) {
    val world = event.world;
    if (world.remote) return; // 只在服务端执行

    val player = event.player;
    val item = event.item;
    if (isNull(item) || item.definition.id != COORD_ITEM.definition.id) return;

    val pos = event.position;
    val block = event.block;
    if (isNull(block)) return;

    // 获取 MMCE 控制器
    val ctrl = MachineController.getControllerAt(world, pos.x, pos.y, pos.z);
    if (isNull(ctrl)) return;


    if (player.isSneaking) {
        val machineName = ctrl.formedMachineName;
        if (isNull(machineName)) {
            player.sendMessage("§c控制器未成型！");
            return;
        }
        if (machineName != "modularmachinery:dream_energy_core") {
            player.sendMessage("§c只能绑定到梦之能量核心控制器！");
            return;
        }
        // ---- Shift 右键：记录坐标到物品 NBT ----
        val dim = world.provider.dimensionID;
        val lore = [
            "§6世界：§f" + dim,
            "§6X：§f" + pos.x,
            "§6Y：§f" + pos.y,
            "§6Z：§f" + pos.z
        ];
        item.mutable().updateTag({
            x: pos.x,
            y: pos.y,
            z: pos.z,
            dim: dim,
            display: {
                Lore: [
                    "§6世界：§f" + dim,
                    "§6X：§f" + pos.x,
                    "§6Y：§f" + pos.y,
                    "§6Z：§f" + pos.z
                ]
            }
        });
        player.sendMessage("§a已记录梦之能量核心控制器坐标：世界 " + dim + " (" + pos.x + ", " + pos.y + ", " + pos.z + ")");
        event.cancel();
    } else {
        val machineName = ctrl.formedMachineName;
        if (isNull(machineName)) {
            player.sendMessage("§c控制器未成型！");
            return;
        }
        if (machineName == "modularmachinery:dream_energy_core") {
            player.sendMessage("§c禁止套娃！");
            return;
        }
        // ---- 普通右键：将物品中的坐标写入控制器 customData ----
        if (isNull(item.tag) || isNull(item.tag.x)) {
            player.sendMessage("§c物品未绑定坐标！");
            return;
        }
        val x = item.tag.x as int;
        val y = item.tag.y as int;
        val z = item.tag.z as int;
        val dim = item.tag.dim as int;

        var data = ctrl.customData;
        if (isNull(data)) data = {} as IData;
        val newData = data + {
            "DECore_X": x,
            "DECore_Y": y,
            "DECore_Z": z,
            "DECore_Dim": dim
        } as IData;
        ctrl.customData = newData;
        player.sendMessage("§a已将梦之能量核心控制器坐标写入：世界 " + dim + " (" + x + ", " + y + ", " + z + ")");
        event.cancel();
    }
});