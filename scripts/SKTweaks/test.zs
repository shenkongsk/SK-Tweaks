#loader crafttweaker reloadable
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;
import mods.ctutils.utils.Math;
import crafttweaker.item.IItemStack;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeThread;
import crafttweaker.world.IFacing;
import mods.modularmachinery.RecipeFinishEvent;
import mods.modularmachinery.RecipeStartEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.MachineController;
import mods.contenttweaker.World;
import mods.modularmachinery.IMachineController;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IWorld;
import mods.modularmachinery.MachineStructureFormedEvent;


var test_recipe_multi_sk = RecipeBuilder.newBuilder("test_recipe_multi_sk","test_machine",20);
test_recipe_multi_sk
    .addInput(<minecraft:stone>*1)
    .addStartHandler(function(event as RecipeStartEvent) {
        var ctrl = event.controller;
        var data = ctrl.customData;
        var pos = getOffsetPos(ctrl,-10,0,-8);
        var world = ctrl.world;
        world.setBlockState(<blockstate:contenttweaker:defined_block>, pos);
    })
    .build();