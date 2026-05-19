import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.MachineBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.MultiblockModifierBuilder;
import mods.modularmachinery.BlockArrayBuilder;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.RecipeTickEvent;
import mods.modularmachinery.Sync;
//控制器
recipes.addShaped(<modularmachinery:advanced_liquid_conversion_machine_controller>,
[[<twilightforest:block_storage:1>,<iceandfire:ice_dragon_blood>,<twilightforest:block_storage:1>],
[<iceandfire:ice_dragon_blood>,<modularmachinery:blockcontroller>,<iceandfire:ice_dragon_blood>],
[<twilightforest:block_storage:1>,<iceandfire:ice_dragon_blood>,<twilightforest:block_storage:1>]]);
//炽焰
RecipeBuilder.newBuilder("ALCM_pyrotheum", "advanced_liquid_conversion_machine", 10)
    .addEnergyPerTickInput(51200)
    .addInput(<liquid:lava> * 10000)
    .addOutput(<liquid:pyrotheum> * 1000)
    .build();
RecipeBuilder.newBuilder("ALCM_pyrotheum_infinity", "advanced_liquid_conversion_machine", 10)
    .addInput(<projecte:item.pe_volcanite_amulet>).setChance(0).setParallelizeUnaffected(true)
    .addEnergyPerTickInput(102400)
    .addOutput(<liquid:pyrotheum> * 1000)
    .build();
//凛冰
RecipeBuilder.newBuilder("ALCM_cyrotheum", "advanced_liquid_conversion_machine", 10)
    .addEnergyPerTickInput(51200)
    .addInput(<liquid:water> * 10000)
    .addOutput(<liquid:cryotheum> * 1000)
    .build();
RecipeBuilder.newBuilder("ALCM_cyrotheum_infinity", "advanced_liquid_conversion_machine", 10)
    .addInput(<projecte:item.pe_evertide_amulet>).setChance(0).setParallelizeUnaffected(true)
    .addEnergyPerTickInput(102400)
    .addOutput(<liquid:cryotheum> * 1000)
    .build();
//来自新星工程的支援