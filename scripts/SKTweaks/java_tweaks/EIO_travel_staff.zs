// #loader mixin
// #mixin {targets: "crazypants.enderio.base.item.travelstaff.ItemTravelStaff"}
// zenClass MixinItemTravelStaff {
//     #mixin ModifyVariable 
//     #{
//     #    method: "onItemRightClick",
//     #    name: "ticksSinceBlink",
//     #    at: @At("STORE")
//     #}
//     function modifyTicksSinceBlink(original as long) as long {
//         return 2147483647;
//     }
// }