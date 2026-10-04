import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.MachineController;
import mods.modularmachinery.IMachineController;
import crafttweaker.world.IWorld;
import crafttweaker.data.IData;
import native.java.math.BigInteger;
function AddEnergyToDreamCore(decoreCtrl as IMachineController, amount as BigInteger) as void {
    var data = decoreCtrl.customData;
    if (isNull(data)) data = {} as IData;

    // 读取当前能量（字符串形式的 BigInteger）
    var current = BigInteger(Get_CustomData_string(data, "energy", "0"));
    val newEnergy = current.add(amount);

    // 写回
    val newData = data + ({ "energy": newEnergy.toString() } as IData);
    decoreCtrl.customData = newData;
}
// MMEvents.onMachineTick("你的发电机机器名", function(event as MachineTickEvent) {
//     val ctrl = event.controller;
//     val world = ctrl.world;
//     if (world.remote) return;
//
//     val data = ctrl.customData;
//
//     val decoreX = data.memberGet("DECore_X");
//     if (isNull(decoreX)) return;
//
//     val x = decoreX as int;
//     val y = data.memberGet("DECore_Y") as int;
//     val z = data.memberGet("DECore_Z") as int;
//     val dim = data.memberGet("DECore_Dim") as int;
//     val cworld = IWorld.getFromID(dim);
//     val decoreCtrl = MachineController.getControllerAt(cworld, x, y, z);
//     if (isNull(decoreCtrl)) {
//         // 梦核不存在：解除连接，清空待输出能量，恢复正常输出
//         val cleared = data
//             + ({ "pendingEnergyOutput": "0" } as IData)
//             - "DECore_X" - "DECore_Y" - "DECore_Z" - "DECore_Dim";
//         ctrl.customData = cleared;
//         return;
//     }
//     AddEnergyToDreamCore(decoreCtrl, outputEnergy);
        // 这里outputenergy不确定
// });