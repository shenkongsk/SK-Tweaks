// #loader mixin

// #mixin {targets: "github.kasuminova.mmce.common.tile.base.MEFluidBus"}
// zenClass MixinMEFluidBus {
//     #mixin ModifyConstant 
//     #{
//     #    method: "<init>",
//     #    constant: {intValue: 8000}
//     #}
//     function modifyCapacity(original as int) as int {
//         return 2147483647;
//     }
//         // 修改 updateTankCapacity 中的 TANK_DEFAULT_CAPACITY（也是 8000）
//     #mixin ModifyConstant 
//     #{
//     #    method: "updateTankCapacity",
//     #    constant: {intValue: 8000}
//     #}
//     function modifyUpdateCapacity(original as int) as int {
//         return 2147483647;
//     }
// }