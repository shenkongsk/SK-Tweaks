// #loader mixin

// #mixin {targets: "github.kasuminova.mmce.common.tile.base.MEFluidBus"}
// zenClass MixinMEFluidBus_SlotCount {
//     #mixin ModifyConstant 
//     #{ 
//     #   method: "<init>", 
//     #   constant: {intValue: 9} 
//     #}
//     function modifySlotCount(original as int) as int {
//         return 18; // 改成你想要的槽位数，例如 18
//     }
// }



// #mixin {targets: "github.kasuminova.mmce.client.gui.GuiMEFluidOutputBus"}
// zenClass MixinGuiMEFluidOutputBus {
//     #mixin ModifyConstant 
//     #{ 
//     #   method: "initGui", 
//     #   constant: {intValue: 9} 
//     #}
//     function modifySlotCountInGui(original as int) as int {
//         return 18;
//     }
// }