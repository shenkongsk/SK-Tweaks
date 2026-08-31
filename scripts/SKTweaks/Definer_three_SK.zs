#loader crafttweaker reloadable
import mods.ctutils.utils.Math;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.ActiveMachineRecipe;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import crafttweaker.item.IItemStack;

var MACHINE = "definer_three_sk";
MachineModifier.setMaxThreads(MACHINE, 0);
val threadA = FactoryRecipeThread.createCoreThread("§e再定义器");
MachineModifier.addCoreThread(MACHINE, threadA);
var definer_sk_1 = RecipeBuilder.newBuilder("definer_sk_1_recipe",MACHINE,200);
definer_sk_1
  .addEnergyPerTickInput(100000000)
//   .addStartHandler(function(event as RecipeCheckEvent) {
//             val ctrl = event.controller;
//             val world = ctrl.world;
//             val pos = ctrl.pos;
//             if (Math.random() < 0.2){
//                 var offsetY = 0;
//                 if (Math.random() < 0.5) {
//                     offsetY = 4;
//                 } else {
//                     offsetY = 6;
//                 }
//                 val targetPos = pos.add(0, offsetY, 4);
//                 world.setBlockState(<blockstate:contenttweaker:defined_block>,targetPos);
//             }
//         })
  .addStartHandler(function(event as RecipeCheckEvent) {
      val ctrl = event.controller;
      val world = ctrl.world;
      if (Math.random() < 0.1) {
          var offsetY = 0;
          if (Math.random() < 0.5) {
              offsetY = 4;
          } else {
              offsetY = 6;
          }
          val targetPos = ctrl.pos.up(offsetY).getOffset(ctrl.facing.opposite, 4);
          world.setBlockState(<blockstate:contenttweaker:defined_block>, targetPos);
      }
  })
  .addItemInput(<contenttweaker:defined_egg>*16)
  .addItemInput(<contenttweaker:defined_inferium_catalyst>*4)
  .addFluidInput(<liquid:molten_defined>*4608)
  .addFluidInput(<liquid:divination_catalyst>*2000)
  .addItemOutput(<contenttweaker:defined_ingot>*64)
  .addFluidOutput(<liquid:messy_rainbow_fluid>*1000)
  .addFluidOutput(<liquid:strange_matter>*500)
  .addRecipeTooltip("§c配方§e可能会§c导致机器堵塞！§r")
  .setMaxThreads(1)
  .build();

var definer_sk_2 = RecipeBuilder.newBuilder("definer_sk_2_recipe",MACHINE,400);
definer_sk_2
  .addDimensionInput(174)
  .addEnergyPerTickInput(400000000)
  .addStartHandler(function(event as RecipeCheckEvent) {
      val ctrl = event.controller;
      val world = ctrl.world;
      if (Math.random() < 0.3) {
          var offsetY = 0;
          if (Math.random() < 0.5) {
              offsetY = 4;
          } else {
              offsetY = 6;
          }
          val targetPos = ctrl.pos.up(offsetY).getOffset(ctrl.facing.opposite, 4);
          world.setBlockState(<blockstate:contenttweaker:defined_block>, targetPos);
      }
  })
  .addItemInput(<contenttweaker:defined_egg>*32)
  .addItemInput(<contenttweaker:defined_block>*4)
  .addFluidInput(<liquid:molten_defined>*9216)
  .addFluidInput(<liquid:naquadah_alloy>*8000)
  .addItemOutput(<contenttweaker:defined_ingot>*512)
  .addFluidOutput(<liquid:strange_matter>*2000)
  .addFluidOutput(<liquid:unholy_radioactive_mix>*1000)
  .addRecipeTooltip("维度要求：§b炼金界§r","§c配方§e可能会§c导致机器堵塞！§r")
  .setMaxThreads(1)
  .build();

var definer_sk_3 = RecipeBuilder.newBuilder("definer_sk_3_recipe",MACHINE,1600);
definer_sk_3
  .addDimensionInput(191)
  .addEnergyPerTickInput(4000000000)
  .addItemInput(<contenttweaker:defined_egg>*64)
  .addItemInput(<contenttweaker:recursive_quantum>*4)
  .addFluidInput(<liquid:molten_defined>*18432)
  .addFluidInput(<liquid:recursive_computing_matter>*1000)
  .addItemOutput(<contenttweaker:defined_ingot>*2048)
  .addFluidOutput(<liquid:fractallite_halite>*144)
  .addFluidOutput(<liquid:infinitely_unholy_radioactive_mix>*1000)
  .addRecipeTooltip("维度要求：§b叁壹界§r","§c配方§e不会§c导致机器堵塞！§r")
  .setMaxThreads(1)
  .build();